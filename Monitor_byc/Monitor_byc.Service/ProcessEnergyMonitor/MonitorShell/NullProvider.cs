using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class NullProvider : IDataItemProvider
    {
        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            throw new NotImplementedException();
        }
    }
}
