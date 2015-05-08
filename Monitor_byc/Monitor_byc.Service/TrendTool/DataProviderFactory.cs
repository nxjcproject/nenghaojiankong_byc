using Monitor_byc.Infrastructure.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public static class DataProviderFactory
    {
        public static IDataProvider GetDataProvider(string type)
        {
            string connectionString = ConnectionStringFactory.NXJCConnectionString;

            return new AmmeterEnergyProvider(connectionString);
        }
    }
}
