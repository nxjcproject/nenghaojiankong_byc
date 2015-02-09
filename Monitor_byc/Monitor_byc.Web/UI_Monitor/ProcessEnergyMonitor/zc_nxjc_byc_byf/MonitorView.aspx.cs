using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_byc_byf
{
    public partial class MonitorView : System.Web.UI.Page
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            return result;
        }
    }
}