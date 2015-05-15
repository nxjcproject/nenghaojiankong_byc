﻿using Monitor_byc.Infrastructure.Configuration;
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
    public partial class zc_nxjc_byc_byf_cementmill02 : System.Web.UI.Page
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
            organizationId = "zc_nxjc_byc_byf_cementmill02";
            sceneName = "2#水泥磨";

            string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(factoryLevel);

            #region 获得dcs实时数据
            ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(dcsConn);
            IEnumerable<DataItem> monitorItems = monitorService.GetRealtimeDatas(organizationId, sceneName);
            foreach (var item in monitorItems)
            {
                dataItems.Add(item);
            }
            #endregion

            MonitorShellService shellService = new MonitorShellService("", ammeterConn, "");

            #region 获得电表功率数据
            IEnumerable<DataItem> ammeterItems = shellService.GetRealtimePower(organizationId);
            foreach (var item in ammeterItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得实时电能消耗数据
            IEnumerable<DataItem> formulaValueItems = shellService.GetRealtimeEnergyConsumption(organizationId);
            foreach (var item in formulaValueItems)
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