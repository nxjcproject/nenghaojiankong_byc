using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.Alarm;
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

namespace Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.NXJC.zc_nxjc_qtx.zc_nxjc_qtx_tys_clinker05
{
    public partial class MonitorView : WebStyleBaseForEnergy.webStyleBase
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {
            base.InitComponts();
            string pageInfors = "";
            //if (Request.QueryString["PageId"] != null)
            //{
            //    pageId = Request.QueryString["PageId"].ToString().Trim();
            //}
            //else
            //{
            //    pageId = "sssss";
            //}
#if DEBUG
            pageInfors = GetPageIdByNodeId("zc_nxjc_qtx_tys_clinker05,5#熟料线");

#elif !DEBUG
            string pageId=Request.QueryString["PageId"].ToString().Trim();
            pageInfors = GetPageIdByNodeId(pageId);
#endif
            //string url = Request.Url.ToString(); 
            //testId.Value = pageInfors;
            //Response.Write("<javascript>"+pageId+","+pageInfors+","+url+"</javascript>");
            //Response.End();
            string[] pageInfoArray = pageInfors.Split(',');
            string organizationId = pageInfoArray[0];
            string viewName = pageInfoArray[1];
            organizationIdContainerId.Value = organizationId;
            viewNameContainerId.Value = viewName;
        }
        [WebMethod]
        public static string GetAlarmInfor(string organizationId)
        {
            DataTable alarmInforTable = AlarmService.GetRealtimeAlarmByOrganizationId(organizationId);
            string Json = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(alarmInforTable);
            return Json;
        }
        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            IList<DataItem> dataItems = new List<DataItem>();
            string factoryLevel = OrganizationHelper.GetFactoryLevel(organizationId);
            //string conn = ConnectionStringFactory.NXJCConnectionString;           
            //string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            //string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(factoryLevel);

            //string ammeterDataBaseName = ConnectionStringFactory.GetAmmeterDatabaseName(organizationId);
            //string dcsDataBaseName = ConnectionStringFactory.GetDCSDatabaseName(organizationId);
            //#region 获得表中实时数据
            //ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);
            //DataTable sourceDt = precessPower.GetMonitorDatas(factoryLevel);
            //DataRow[] rows = sourceDt.Select(String.Format("OrganizationID='{0}'", organizationId));

            //string[] fields = { "本日合计", "本月累计", "本年累计" };
            //dataItems = ProcessEnergyMonitorService.GetPowerMonitor(rows, fields).ToList();
            //#endregion

            #region 获得dcs实时数据(电流)
            ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(connString);
            IEnumerable<DataItem> monitorItems = monitorService.GetRealtimeDatas(organizationId, sceneName, ValueType.Current);
            foreach (var item in monitorItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得电表功率数据
            ProcessEnergyMonitorService ammeterService = new ProcessEnergyMonitorService(connString);
            IEnumerable<DataItem> ammeterItems = ammeterService.GetRealtimeDatas(organizationId, sceneName, ValueType.Power);
            foreach (var item in ammeterItems)
            {
                dataItems.Add(item);
            }
            #endregion

            //#region 获得实时电能消耗数据
            //RealtimeFormulaValueService formulaValue = new RealtimeFormulaValueService(ammeterConn, "");
            //IEnumerable<DataItem> formulaValueItems = formulaValue.GetFormulaPowerConsumption(factoryLevel);
            //foreach (var item in formulaValueItems)
            //{
            //    dataItems.Add(item);
            //}
            //#endregion

            #region  获得实时公式电耗（工序表格电耗）
            FormulaEnergyService formulaEnergyServer = new FormulaEnergyService(connString);
            IEnumerable<DataItem> formulaEnergyItems = formulaEnergyServer.GetFormulaPowerConsumption(organizationId, sceneName);
            foreach (var item in formulaEnergyItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获取公式电耗月平均值（工序表格月平均电耗）
            IEnumerable<DataItem> formulaEnergyConsumptionMonthlyAverageItems = formulaEnergyServer.GetFormulaPowerConsumptionMonthlyAverage(organizationId, sceneName);
            foreach (var item in formulaEnergyConsumptionMonthlyAverageItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得实时公式功率
            FormulaPowerService formulaPowerServer = new FormulaPowerService(connString);
            IEnumerable<DataItem> formulaPowerItems = formulaPowerServer.GetFormulaPower(factoryLevel, sceneName);
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