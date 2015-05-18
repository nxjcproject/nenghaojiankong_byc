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
    public class CDMElectricityConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _nxjcFactory;
        public CDMElectricityConsumptionProvider(string nxjcconnString)
        {
            _nxjcFactory = new SqlServerDataFactory(nxjcconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string sqlSource = @"select * from (SELECT A.OrganizationID,A.VariableId,A.CumulantClass,A.CumulantLastClass,A.CumulantDay,(A.CumulantDay+B.MonthValue) AS CumulantMonth
                                FROM RealtimeIncrementCumulant AS A,
                                (select D.OrganizationID,D.VariableId,sum(D.TotalPeakValleyFlat) as MonthValue
	                            from tz_Balance as C, balance_Energy as D 
	                            where C.BalanceId=D.KeyId and TimeStamp>=CONVERT(varchar(8),GETDATE(),20)+'01'
	                            group by D.OrganizationID, VariableId) AS B
                                WHERE A.VariableId=B.VariableId and A.OrganizationID=B.OrganizationID) AS E
                                where E.OrganizationID=@organizationId";

            //cdy修改开始

            //StringBuilder sqlSourceBase = new StringBuilder(sqlSource);
            //IList<SqlParameter> sourceparameters = new List<SqlParameter>();
            //sourceparameters.Add(new SqlParameter("@organizationId", organizationId));
            //ParametersHelper.AddParamsCondition(sqlSourceBase, sourceparameters, variableIds);
            //DataTable sourceDt = _nxjcFactory.Query(sqlSourceBase.ToString(), sourceparameters.ToArray());
            SqlParameter parameter = new SqlParameter("organizationId",organizationId);
            DataTable sourceDt = _nxjcFactory.Query(sqlSource, parameter);
            //cdy修改结束

            string sqlTemplate = @"select * from (SELECT A.OrganizationID,B.VariableID,B.ValueFormula
                                FROM system_Organization AS A,balance_Energy_Template AS B
                                WHERE A.Type=B.ProductionLineType
                                AND B.ValueType='ElectricityConsumption'
                                OR B.ValueType='CoalConsumption'
                                AND B.Enabled='True') as C 
                                where C.OrganizationID=@organizationId";
            StringBuilder sqlTemplateBase = new StringBuilder(sqlTemplate);
            IList<SqlParameter> templateparameters = new List<SqlParameter>();
            templateparameters.Add(new SqlParameter("@organizationId", organizationId));
            ParametersHelper.AddParamsCondition(sqlTemplateBase, templateparameters, variableIds);
            DataTable templateDt = _nxjcFactory.Query(sqlTemplateBase.ToString(), templateparameters.ToArray());

            string[] columns = { "CumulantClass", "CumulantDay", "CumulantMonth" };

            DataTable resultDt = EnergyConsumption.EnergyConsumptionCalculate.CalculateByOrganizationId(sourceDt, templateDt, "ValueFormula", columns);
            foreach (DataRow dr in resultDt.Rows)
            {
                DataItem itemClass = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">Class",
                    Value = dr["CumulantClass"].ToString().Trim()
                };
                results.Add(itemClass);

                DataItem itemDay = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">Day",
                    Value = dr["CumulantDay"].ToString().Trim()
                };
                results.Add(itemDay);

                DataItem itemMonth = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">Month",
                    Value = dr["CumulantMonth"].ToString().Trim()
                };
                results.Add(itemMonth);

            }

            return results;
        }
    }
}
