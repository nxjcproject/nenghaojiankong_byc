using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class SumCDMElectricityConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _nxjcFactory;
        public SumCDMElectricityConsumptionProvider(string nxjcconnString)
        {
            _nxjcFactory = new SqlServerDataFactory(nxjcconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string sqlSource = @"SELECT D.OrganizationID,C.VariableId,C.CumulantClass,C.CumulantLastClass,C.CumulantDay,SUM(C.CumulantDay+D.TotalPeakValleyFlat) AS CumulantMonth
                                    FROM RealtimeIncrementCumulant AS C,
                                    (select A.OrganizationID,B.VariableId,SUM(B.TotalPeakValleyFlat) as TotalPeakValleyFlat
                                    from tz_Balance as A,balance_Energy as B
                                    where A.BalanceId=B.KeyId
                                    AND A.TimeStamp>=CONVERT(varchar(8),GETDATE(),20)+'01'
                                    group by A.OrganizationID,B.VariableId) AS D
                                    WHERE C.VariableId=D.VariableId 
                                    AND (C.VariableId='cement_CementOutput' OR C.VariableId='clinker_ClinkerOutput' OR C.VariableId='cementmill_ElectricityQuantity'
                                    OR C.VariableId='clinker_ElectricityQuantity' OR C.VariableId='clinker_PulverizedCoalInput')
                                    GROUP BY D.OrganizationID,C.VariableId,C.CumulantClass,C.CumulantLastClass,C.CumulantDay";
            DataTable sourceDt = _nxjcFactory.Query(sqlSource);
            string m_OrganizationId = sourceDt.Rows[0]["OrganizationID"].ToString().Trim();
            string sqlTemplate = @"SELECT A.VariableId,A.ValueFormula 
                                    FROM balance_Energy_Template AS A
                                    WHERE
									A.VariableId='clinker_CoalConsumption'
									OR A.VariableId='cementmill_ElectricityConsumption'
									OR A.VariableId='clinker_ElectricityConsumption'";
            DataTable templateDt = _nxjcFactory.Query(sqlTemplate);
            DataRow row = templateDt.NewRow();
            row["VariableId"] = "cementmill_CoalConsumption";
            row["ValueFormula"] = "[clinker_PulverizedCoalInput]/[cement_CementOutput]";
            templateDt.Rows.Add(row);
            string[] columns = { "CumulantClass", "CumulantDay", "CumulantMonth" };

            DataTable resultDt = EnergyConsumption.EnergyConsumptionCalculate.Calculate(sourceDt, templateDt, "ValueFormula", columns);
            DataColumn column = new DataColumn("OrganizationID", typeof(string));
            column.DefaultValue = m_OrganizationId;
            resultDt.Columns.Add(column);
            foreach (DataRow dr in resultDt.Rows)
            {
                DataItem itemClass = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumClass",
                    Value = dr["CumulantClass"].ToString().Trim()
                };
                results.Add(itemClass);

                DataItem itemDay = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumDay",
                    Value = dr["CumulantDay"].ToString().Trim()
                };
                results.Add(itemDay);

                DataItem itemMonth = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumMonth",
                    Value = dr["CumulantMonth"].ToString().Trim()
                };
                results.Add(itemMonth);
            }

            return results;
        }
    }
}