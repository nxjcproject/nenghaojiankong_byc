using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.TrendTool
{
    public class TrendLineService
    {
        public static IDictionary<string, decimal> GetData(string id, DateTime startTime, DateTime stopTime, int timeSpanInMin = 5)
        {
            // id 由三部分按顺序组成，分别为组织机构ID、变量名称、变量类型，之间用'>'字符隔开。
            string[] variableParams = id.Split('>');

            // 检测参数是否有效
            if (variableParams.Length != 3)
                throw new ArgumentException("锚点提供的参数无效。id：" + id);

            // 由简单工厂按变量类型实例化数据提供器
            IDataProvider dataProvider = DataProviderFactory.GetDataProvider(id);
            return dataProvider.GetData(id, startTime, stopTime, timeSpanInMin);
        }
    }
}
