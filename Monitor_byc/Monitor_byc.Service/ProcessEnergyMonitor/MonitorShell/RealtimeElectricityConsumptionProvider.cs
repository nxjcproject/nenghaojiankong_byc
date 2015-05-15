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
    public class RealtimeElectricityConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _companyFactory;
        public RealtimeElectricityConsumptionProvider(string companyconnString)
        {
            _companyFactory = new SqlServerDataFactory(companyconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string queryString = @"select OrganizationID,VariableID,FormulaValue,DenominatorValue from [zc_nxjc_byc_byf].[dbo].[RealtimeFormulaValue] 
                                where OrganizationID=@organizationId";
            StringBuilder baseString = new StringBuilder(queryString);
            IList<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@organizationId", organizationId));

            ParametersHelper.AddParamsCondition(baseString, parameters, variableIds);

            DataTable dt = _companyFactory.Query(baseString.ToString(), parameters.ToArray());

            foreach (DataRow item in dt.Rows)
            {
                if (!Convert.IsDBNull(item["DenominatorValue"]))
                {
                    decimal denominatorValue = 0;
                    decimal.TryParse(item["DenominatorValue"].ToString().Trim(), out denominatorValue);
                    if (denominatorValue != 0)
                    {
                        decimal formulaValue = 0;
                        decimal.TryParse(item["FormulaValue"].ToString().Trim(), out formulaValue);

                        DataItem itemElectricityConsumption = new DataItem
                        {
                            ID = item["OrganizationID"].ToString().Trim() + ">" + item["VariableID"].ToString().Trim() + ">" + "ElectricityConsumption",
                            Value = (formulaValue / denominatorValue).ToString()
                        };
                        results.Add(itemElectricityConsumption);
                    }
                }
            }

            return results;
        }
    }
}
