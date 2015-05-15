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
    public class RealtimePowerElectricityCoalDustProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _companyFactory;

        public RealtimePowerElectricityCoalDustProvider(string companyconnString)
        {
            _companyFactory = new SqlServerDataFactory(companyconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string queryString = @"select OrganizationID,VariableID,Power,FormulaValue,CoalDustConsumption from [zc_nxjc_byc_byf].[dbo].[RealtimeFormulaValue] 
                                   where OrganizationID like @organizationId";
            SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };
            DataTable dt = _companyFactory.Query(queryString, parameters);

            foreach (DataRow dr in dt.Rows)
            {
                DataItem itemPower = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableID"].ToString().Trim() + ">Power",
                    Value = dr["Power"].ToString().Trim()
                };
                results.Add(itemPower);
                DataItem itemFormulaValue = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableID"].ToString().Trim() + ">ElectricityQuantity",
                    Value = dr["FormulaValue"].ToString().Trim()
                };
                results.Add(itemFormulaValue);
                DataItem itemCoalDustConsumption = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableID"].ToString().Trim() + ">PulverizedCoalInput",
                    Value = dr["CoalDustConsumption"].ToString().Trim()
                };
                results.Add(itemCoalDustConsumption);
            }

            return results;
        }
    }
}
