using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell
{
    public partial class zc_nxjc_byc_byf : System.Web.UI.Page
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            IList<DataItem> dataItems = new List<DataItem>();
            string factoryLevel = "zc_nxjc_byc_byf";
            organizationId = "zc_nxjc_byc_byf";
            sceneName = "";

            string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(factoryLevel);

            MonitorShellService shellService = new MonitorShellService(connString, "", "");

            #region 获得当班、当日和当月的电量
            IEnumerable<DataItem> monitorItems = shellService.GetCDMElectricity(organizationId);
            foreach (var item in monitorItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得当班、当日和当月的电耗
            IEnumerable<DataItem> consumptionItems = shellService.GetCDMElectricityConsumption(organizationId);
            foreach (var item in consumptionItems)
            {
                dataItems.Add(item);
            }
            #endregion
                        
            SceneMonitor result = new SceneMonitor();
            result.Name = sceneName;
            result.time = DateTime.Now;
            result.DataSet = dataItems;

            return result;
        }
    }
}