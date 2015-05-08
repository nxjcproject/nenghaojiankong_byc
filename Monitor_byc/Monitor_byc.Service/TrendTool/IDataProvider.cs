using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public interface IDataProvider
    {
        decimal[] GetData(string variableName, DateTime startTime, DateTime stopTime);
    }
}
