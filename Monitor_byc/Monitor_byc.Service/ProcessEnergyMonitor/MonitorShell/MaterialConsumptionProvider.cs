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
    public class MaterialConsumptionProvider : IDataItemProvider
    {
        private ISqlServerDataFactory _companyFactory;
        public MaterialConsumptionProvider(string companyconnString)
        {
            _companyFactory = new SqlServerDataFactory(companyconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();

            string materialDetailString = @"select A.OrganizationID,B.VariableId,B.TagTableName,B.Formula 
                                         from [NXJC].[dbo].[tz_Material] as A,[NXJC].[dbo].[material_MaterialDetail] as B
                                         where A.KeyID=B.KeyID and A.OrganizationID like @organizationId";
            SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };
            DataTable materialDetailTable = _companyFactory.Query(materialDetailString, parameters);

            StringBuilder baseString = new StringBuilder("select top 1");
            string baseTableName = "";
            IList<string> variables = new List<string>();
            foreach (DataRow dr in materialDetailTable.Rows)
            {
                baseString.Append(string.Format(" {0} as {1},", dr["Formula"].ToString().Trim(), dr["VariableId"].ToString().Trim()));
                variables.Add(dr["VariableId"].ToString().Trim());
                if (baseTableName == "")
                {
                    baseTableName = dr["TagTableName"].ToString().Trim();
                }
            }
            baseString.Remove(baseString.Length - 1, 1);
            baseString.Append(" from ").Append("[zc_nxjc_byc_byf].[dbo]." + baseTableName).Append(" order by vDate desc");
            DataTable resultDt = _companyFactory.Query(baseString.ToString());

            foreach (var item in variables)
            {
                DataItem dataItem = new DataItem
                {
                    ID = organizationId + ">" + item + ">Material",
                    Value = resultDt.Rows[0][item].ToString().Trim()
                };
                results.Add(dataItem);
            }
            return results;
        }
    }
}
