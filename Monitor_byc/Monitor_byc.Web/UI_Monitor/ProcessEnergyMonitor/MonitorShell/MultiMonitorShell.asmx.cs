using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.ProcessEnergyMonitor;
using Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell
{
    /// <summary>
    /// MultiMonitorShell1 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class MultiMonitorShell1 : System.Web.Services.WebService
    {
        [WebMethod]
        public SceneMonitor GetRealTimeData(string ids, string organizationId, string sceneName)
        {
            IList<DataItem> dataItems = new List<DataItem>();

            string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);

            if (organizationId.Split('_').Count() == 5)
            {
                #region 获得dcs实时数据
                ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(dcsConn);
                IEnumerable<DataItem> monitorItems = monitorService.GetRealtimeDatas(organizationId, sceneName);
                foreach (var item in monitorItems)
                {
                    dataItems.Add(item);
                }
                #endregion
            }

            string[] iditems = ids.Split(',');
            int count = iditems.Count();

            Dictionary<string, IList<string>> idDictionary = new Dictionary<string, IList<string>>();
            for (int i = 0; i < count - 1; i++)
            {
                string[] itemArry = iditems[i].Split('>');
                if (itemArry.Count() == 3)
                {
                    if (itemArry[2] == "Class" || itemArry[2] == "Day" || itemArry[2] == "Month")
                    {
                        string[] variableIdArry = itemArry[1].Split('_');
                        string providerType = "ClassDayMonth" + variableIdArry[1];
                        string key = itemArry[0] + "," + providerType;

                        if (!idDictionary.Keys.Contains(key))
                        {
                            idDictionary.Add(key, new List<string>());
                            idDictionary[key].Add(itemArry[1]);
                        }
                        else
                        {
                            idDictionary[key].Add(itemArry[1]);
                        }
                    }
                    else if (itemArry[2] == "Material")
                    {
                        string providerType = "MaterialConsumption";
                        string key = itemArry[0] + "," + providerType;

                        if (!idDictionary.Keys.Contains(key))
                        {
                            idDictionary.Add(key, new List<string>());
                            idDictionary[key].Add(itemArry[1]);
                        }
                        else
                        {
                            idDictionary[key].Add(itemArry[1]);
                        }
                    }
                    else
                    {
                        string providerType = "Realtime" + itemArry[2];
                        string key = itemArry[0] + "," + providerType;

                        if (!idDictionary.Keys.Contains(key))
                        {
                            idDictionary.Add(key, new List<string>());
                            idDictionary[key].Add(itemArry[1]);
                        }
                        else
                        {
                            idDictionary[key].Add(itemArry[1]);
                        }
                    }
                }
            }

            foreach (var keyitem in idDictionary.Keys)
            {
                string[] keyArry = keyitem.Split(',');
                string[] mvariableids = idDictionary[keyitem].ToArray();

                if (Enum.IsDefined(typeof(DataItemProviderType), keyArry[1]))
                {
                    IEnumerable<DataItem> items = DataItemProviderFactory.CreateDataItemProvider((DataItemProviderType)Enum.Parse(typeof(DataItemProviderType), keyArry[1])).GetDataItem(keyArry[0], mvariableids);
                    foreach (var item in items)
                    {
                        dataItems.Add(item);
                    }
                }
            }
            


            //if (organizationId != factoryLevelOrganizaiontId)
            //{
            //    GetProductionLineRealTimeData(organizationId, factoryLevelOrganizaiontId, sceneName, dataItems);
            //}
            //else
            //{
            //    GetCompanyRealTimeData(organizationId, dataItems);
            //}

            SceneMonitor result = new SceneMonitor();
            result.Name = sceneName;
            result.time = DateTime.Now;
            result.DataSet = dataItems;

            return result;
        }

        /*private void GetProductionLineRealTimeData(string organizationId, string factoryLevelOrganizaiontId, string sceneName, IList<DataItem> dataItems)
        {
            string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(factoryLevelOrganizaiontId);

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
            IEnumerable<DataItem> ammeterItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.RealtimePowerElectricityCoalDust).GetDataItem(factoryLevelOrganizaiontId);//shellService.GetRealtimePower(organizationId);
            foreach (var item in ammeterItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得实时电能消耗数据
            IEnumerable<DataItem> formulaValueItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.RealtimeElectricityCoalConsumption).GetDataItem(factoryLevelOrganizaiontId);//shellService.GetRealtimeEnergyConsumption(organizationId);
            foreach (var item in formulaValueItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得物料消耗
            IEnumerable<DataItem> materialValueItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.MaterialConsumption).GetDataItem(factoryLevelOrganizaiontId);
            foreach (var item in materialValueItems)
            {
                dataItems.Add(item);
            }
            #endregion
        }

        private void GetCompanyRealTimeData(string organizationId, IList<DataItem> dataItems)
        {
            string connString = ConnectionStringFactory.NXJCConnectionString;
            MonitorShellService shellService = new MonitorShellService(connString, "", "");

            #region 获得当班、当日和当月的电量
            IEnumerable<DataItem> monitorItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.ClassDayMonthElectricity).GetDataItem(organizationId);//shellService.GetCDMElectricity(organizationId);
            foreach (var item in monitorItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得当班、当日和当月的电耗
            IEnumerable<DataItem> consumptionItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.ClassDayMonthElectricityConsumption).GetDataItem(organizationId);//shellService.GetCDMElectricityConsumption(organizationId);
            foreach (var item in consumptionItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得物料消耗
            IEnumerable<DataItem> materialValueItems = DataItemProviderFactory.CreateDataItemProvider(DataItemProviderType.MaterialConsumption).GetDataItem(organizationId);
            foreach (var item in materialValueItems)
            {
                dataItems.Add(item);
            }
            #endregion
        }*/

        //private string GetFactoryLevelOrganizationId(string organizationId)
        //{
        //    string[] subString = organizationId.Split('_');
        //    if (subString.Count() == 5)
        //    {
        //        return subString[0] + "_" + subString[1] + "_" + subString[2] + "_" + subString[3];
        //    }
        //    else
        //    {
        //        return organizationId;
        //    }
        //}
    }
}
