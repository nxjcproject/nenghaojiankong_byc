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
    public class RealtimeElectricityQuantityProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _companyFactory;

        public RealtimeElectricityQuantityProvider(string companyconnString)
        {
            _companyFactory = new SqlServerDataFactory(companyconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string queryString = @"select OrganizationID,VariableID,FormulaValue from [zc_nxjc_byc_byf].[dbo].[RealtimeFormulaValue] 
                                   where OrganizationID=@organizationId";
            StringBuilder baseString = new StringBuilder(queryString);
            IList<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@organizationId", organizationId));
            //SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };

            ParametersHelper.AddParamsCondition(baseString, parameters, variableIds);

            DataTable dt = _companyFactory.Query(queryString.ToString(), parameters.ToArray());

            foreach (DataRow dr in dt.Rows)
            {
                DataItem itemFormulaValue = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableID"].ToString().Trim() + ">ElectricityQuantity",
                    Value = dr["FormulaValue"].ToString().Trim()
                };
                results.Add(itemFormulaValue);
            }

            return results;
        }
    }
}
