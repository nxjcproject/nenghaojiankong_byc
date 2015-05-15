using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public enum DataItemProviderType
    {
        /// <summary>
        /// 本班、当日、当月电量
        /// </summary>
        ClassDayMonthElectricityQuantity,
        /// <summary>
        /// 本班、当日、当月电耗
        /// </summary>
        ClassDayMonthElectricityConsumption,
        /// <summary>
        /// 实时功率
        /// </summary>
        RealtimePower,
        /// <summary>
        /// 实时电量
        /// </summary>
        RealtimeElectricityQuantity,
        /// <summary>
        /// 实时煤粉消耗
        /// </summary>
        RealtimePulverizedCoalInput,
        /// <summary>
        /// 实时电耗
        /// </summary>
        RealtimeElectricityConsumption,
        /// <summary>
        /// 实时煤耗
        /// </summary>
        RealtimeCoalConsumption,
        /// <summary>
        /// 物料消耗
        /// </summary>
        MaterialConsumption



        //ClassDayMonthElectricity,
        //RealtimePowerElectricityCoalDust,
        //RealtimeElectricityCoalConsumption,
        //MaterialConsumption
    }
}
