using Monitor_byc.Infrastructure.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class DataItemProviderFactory
    {
        public static IDataItemProvider CreateDataItemProvider(DataItemProviderType type)
        {
            string connString = ConnectionStringFactory.NXJCConnectionString;
            IDataItemProvider result = new NullProvider();
            if (type == DataItemProviderType.ClassDayMonthElectricity)
            {        
                result = new CDMElectricityProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimePowerElectricityCoalDust)
            {
                result = new RealtimePowerElectricityCoalDustProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimeElectricityCoalConsumption)
            {
                result = new RealtimeElectricityCoalConsumptionProvider(connString);
            }
            else if (type == DataItemProviderType.ClassDayMonthElectricityConsumption)
            {
                result = new CDMElectricityConsumptionProvider(connString);
            }
            else if (type == DataItemProviderType.MaterialConsumption)
            {
                result = new MaterialConsumptionProvider(connString);
            }

            return result;
        }
    }
}
