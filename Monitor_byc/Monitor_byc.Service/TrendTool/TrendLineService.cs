using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public class TrendLineService
    {
        public IDictionary<string, decimal> GetData(string type, string organizationId, string variableName, DateTime startTime, DateTime stopTime, string timeSpan = "5min")
        {
            IDataProvider dataProvider = DataProviderFactory.GetDataProvider(type);
            return dataProvider.GetData(organizationId, variableName, startTime, stopTime, timeSpan);
        }
    }
}
