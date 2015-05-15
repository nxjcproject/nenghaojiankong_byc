using Monitor_byc.Service.TrendTool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor_byc.Web.UI_Monitor.TrendTool
{
    public partial class TrendlineRenderer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static IDictionary<string, decimal> GetData(string id, string startTime, string endTime, int timeSpan)
        {
            return TrendLineService.GetData(id, DateTime.Parse(startTime), DateTime.Parse(endTime), timeSpan);
        }
    }
}