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
            IDataItemProvider result;

            if (type == DataItemProviderType.ClassDayMonthElectricityQuantity)
            {
                result = new CDMElectricityQuantityProvider(connString);
            }
            else if (type == DataItemProviderType.ClassDayMonthElectricityConsumption)
            {
                result = new CDMElectricityConsumptionProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimePower)
            {
                result = new RealtimePowerProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimeElectricityQuantity)
            {
                result = new RealtimeElectricityQuantityProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimePulverizedCoalInput)
            {
                result = new RealtimePulverizedCoalInputProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimeElectricityConsumption)
            {
                result = new RealtimeElectricityConsumptionProvider(connString);
            }
            else if (type == DataItemProviderType.RealtimeCoalConsumption)
            {
                result = new RealtimeCoalConsumptionProvider(connString);
            }
            else if(type == DataItemProviderType.MaterialConsumption)
            {
                result = new MaterialConsumptionProvider(connString);
            }
            else
            {
                result = new NullProvider();
            }

            return result;
        }
    }
}
