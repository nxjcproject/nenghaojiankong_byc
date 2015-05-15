using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class ParametersHelper
    {
        public static void AddParamsCondition(StringBuilder queryString, IList<SqlParameter> parameters, string[] paramsCondition)
        {
            if (paramsCondition.Count() > 0)
            {
                queryString.Append(" and (");
                IList<string> flags = new List<string>();
                foreach (var item in paramsCondition)
                {
                    if (!flags.Contains(item))
                    {
                        flags.Add(item);
                        queryString.Append("VariableID").Append("=@").Append(item).Append(" or ");
                        parameters.Add(new SqlParameter("@" + item, item));
                    }
                }
                queryString.Remove(queryString.Length - 4, 4).Append(")");
            }
        }
    }
}
