using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public interface IDataProvider
    {
        IDictionary<string, decimal> GetData(string organizationId, string variableName, DateTime startTime, DateTime stopTime, string timeSpan);
    }
}
