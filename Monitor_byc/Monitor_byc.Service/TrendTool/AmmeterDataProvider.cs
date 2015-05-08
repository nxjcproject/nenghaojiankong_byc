using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public abstract class AmmeterDataProvider
    {
        internal string connectionString = "";

        public AmmeterDataProvider(string connectionString)
        {
            this.connectionString = connectionString;
        }
    }

    public class AmmeterPowerProvider : AmmeterDataProvider, IDataProvider
    {
        public AmmeterPowerProvider(string connectionString) : base(connectionString) { }

        public IDictionary<string, decimal> GetData(string organizationId, string variableName, DateTime startTime, DateTime stopTime, string timeSpan)
        {
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "";

            }

            throw new NotImplementedException();
        }
    }

    public class AmmeterEnergyProvider : AmmeterDataProvider, IDataProvider
    {
        public AmmeterEnergyProvider(string connectionString) : base(connectionString) { }

        public IDictionary<string, decimal> GetData(string organizationId, string variableName, DateTime startTime, DateTime stopTime, string timeSpan)
        {
            throw new NotImplementedException();
        }
    }
}
