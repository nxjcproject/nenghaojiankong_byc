﻿using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.FormulaEnergy;
using Monitor_byc.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Data;
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
            IList<DataItem> dataItems = new List<DataItem>();
            string factoryLevel = organizationId;

            //string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(organizationId);

            #region 获得表中实时数据
            ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);
            DataTable sourceDt = precessPower.GetMonitorDatas(factoryLevel);
            //DataRow[] rows = sourceDt.Select(String.Format("OrganizationID='{0}'", organizationId));
            IList<DataRow> rows = new List<DataRow>();
            foreach(DataRow dr in sourceDt.Rows){
                rows.Add(dr);
            }

            string[] fields = { "本日合计", "本月累计", "本年累计" };
            //dataItems = ProcessEnergyMonitorService.GetPowerMonitor(rows, fields).ToList();
            dataItems = ProcessEnergyMonitorService.GetPowerMonitor(rows.ToArray(), fields).ToList();
            #endregion

            //#region 获得dcs实时数据
            //ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(dcsConn);
            //IEnumerable<DataItem> monitorItems = monitorService.GetRealtimeDatas(organizationId, sceneName);
            //foreach (var item in monitorItems)
            //{
            //    dataItems.Add(item);
            //}
            //#endregion

            //#region 获得电表功率数据
            //ProcessEnergyMonitorService ammeterService = new ProcessEnergyMonitorService(ammeterConn);
            //IEnumerable<DataItem> ammeterItems = ammeterService.GetRealtimeDatas(organizationId, sceneName);
            //foreach (var item in ammeterItems)
            //{
            //    dataItems.Add(item);
            //}
            //#endregion

            //#region 获得实时电能消耗数据
            //RealtimeFormulaValueService formulaValue = new RealtimeFormulaValueService(ammeterConn, "");
            //IEnumerable<DataItem> formulaValueItems = formulaValue.GetFormulaPowerConsumption(factoryLevel);
            //foreach (var item in formulaValueItems)
            //{
            //    dataItems.Add(item);
            //}
            //#endregion

            #region  获得实时公式电耗
            FormulaEnergyService formulaEnergyServer = new FormulaEnergyService(ammeterConn);
            IEnumerable<DataItem> formulaEnergyItems = formulaEnergyServer.GetFormulaPowerConsumption(factoryLevel);
            foreach (var item in formulaEnergyItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得实时公式功率
            FormulaPowerService formulaPowerServer = new FormulaPowerService(connString);
            IEnumerable<DataItem> formulaPowerItems = formulaPowerServer.GetFormulaPower(factoryLevel);
            foreach (var item in formulaPowerItems)
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