using Monitor_byc.Infrastructure.Configuration;
using Monitor_byc.Service.FormulaEnergy;
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
    public partial class zc_nxjc_byc_byf_cementmill01 : System.Web.UI.Page
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}