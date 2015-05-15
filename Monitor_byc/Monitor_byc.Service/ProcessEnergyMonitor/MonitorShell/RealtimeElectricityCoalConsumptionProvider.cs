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
    public class RealtimeElectricityCoalConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _companyFactory;
        public RealtimeElectricityCoalConsumptionProvider(string companyconnString)
        {
            _companyFactory = new SqlServerDataFactory(companyconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string queryString = @"select OrganizationID,VariableID,FormulaValue,CoalDustConsumption,DenominatorValue from [zc_nxjc_byc_byf].[dbo].[RealtimeFormulaValue] 
                                where OrganizationID like @organizationId";
            SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };
            DataTable dt = _companyFactory.Query(queryString, parameters);

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
                        decimal coalDustConsumption = 0;
                        decimal.TryParse(item["CoalDustConsumption"].ToString().Trim(), out coalDustConsumption);

                        DataItem itemElectricityConsumption = new DataItem
                        {
                            ID = item["OrganizationID"].ToString().Trim() + ">" + item["VariableID"].ToString().Trim() + ">" + "ElectricityConsumption",
                            Value = (formulaValue / denominatorValue).ToString()
                        };
                        results.Add(itemElectricityConsumption);
                        DataItem itemCoalConsumption = new DataItem
                        {
                            ID = item["OrganizationID"].ToString().Trim() + ">" + item["VariableID"].ToString().Trim() + ">" + "CoalConsumption",
                            Value = (coalDustConsumption / denominatorValue).ToString()
                        };
                        results.Add(itemCoalConsumption);
                    }
                }
            }

            return results;
        }
    }
}
