using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class SumProcessCDMElectricityConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _nxjcFactory;
        public SumProcessCDMElectricityConsumptionProvider(string nxjcconnString)
        {
            _nxjcFactory = new SqlServerDataFactory(nxjcconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string sqlSource = @"SELECT B.OrganizationID,A.VariableId,SUM(A.CumulantClass) AS CumulantClass,SUM(A.CumulantLastClass) AS CumulantLastClass,SUM(A.CumulantDay) AS CumulantDay,SUM(A.CumulantDay+B.MonthValue) AS CumulantMonth
                                FROM RealtimeIncrementCumulant AS A,
                                (select C.OrganizationID,D.VariableId,sum(D.TotalPeakValleyFlat) as MonthValue
	                            from tz_Balance as C, balance_Energy as D 
	                            where C.BalanceId=D.KeyId and TimeStamp>=CONVERT(varchar(8),GETDATE(),20)+'01'
	                            group by C.OrganizationID, VariableId) AS B
                                WHERE A.VariableId=B.VariableId
								GROUP BY B.OrganizationID,A.VariableId";
            DataTable sourceDt = _nxjcFactory.Query(sqlSource);
            string m_OrganizationId = sourceDt.Rows[0]["OrganizationID"].ToString().Trim();
            string sqlTemplate = @"SELECT A.VariableId,A.ValueFormula 
                                    FROM balance_Energy_Template AS A
                                    WHERE A.ValueType='ElectricityConsumption'
                                    OR A.ValueType='CoalConsumption'";
            DataTable templateDt = _nxjcFactory.Query(sqlTemplate);

            string[] columns = { "CumulantClass", "CumulantDay", "CumulantMonth" };

            DataTable resultDt = EnergyConsumption.EnergyConsumptionCalculate.Calculate(sourceDt, templateDt, "ValueFormula", columns);
            DataColumn column=new DataColumn("OrganizationID",typeof(string));
            column.DefaultValue = m_OrganizationId;
            resultDt.Columns.Add(column);
            foreach (DataRow dr in resultDt.Rows)
            {
                DataItem itemClass = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessClass",
                    Value = dr["CumulantClass"].ToString().Trim()
                };
                results.Add(itemClass);

                DataItem itemDay = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessDay",
                    Value = dr["CumulantDay"].ToString().Trim()
                };
                results.Add(itemDay);

                DataItem itemMonth = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessMonth",
                    Value = dr["CumulantMonth"].ToString().Trim()
                };
                results.Add(itemMonth);
            }

            return results;
        }
    }
}