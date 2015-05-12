<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zc_nxjc_byc_byf_cementmill02.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.zc_nxjc_byc_byf_cementmill02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtCss.css" />

    <link rel="stylesheet" type="text/css" href="/UI_Monitor/css/common/mymonitor.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script src="/UI_Monitor/js/common/monitorjs.js"></script>
    <script src="/UI_Monitor/js/common/chartjs.js"></script>
    <script src="/UI_Monitor/js/common/SubMonitorAdapter.js"></script>
    <script>
        publicData.organizationId = "zc_nxjc_byc_byf_cementmill02";
        publicData.sceneName = "2#水泥磨";
    </script>
    <title></title>
</head>
<body id="SubMonitorBody" style="margin: 0px; padding: 0px; overflow: auto;">
    <div id="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_cementmill02.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 46px; left: 114px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>gypsumCrusher>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>gypsumCrusher>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>gypsumCrusher>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 187px; left: -1px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>clinkerStorageBeltMachine>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>clinkerStorageBeltMachine>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>clinkerStorageBeltMachine>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 318px; left: 349px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineSettledRoller>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineSettledRoller>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineSettledRoller>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 363px; left: 534px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineActionRoller>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineActionRoller>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>rollingMachineActionRoller>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 328px; left: 730px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>powderSelectingStorehouse>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>powderSelectingStorehouse>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>powderSelectingStorehouse>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 434px; left: 839px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementMillMainMotor>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementMillMainMotor>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementMillMainMotor>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 105px; left: 911px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>mainExhaustFan>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>mainExhaustFan>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>mainExhaustFan>Power"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 552px; left: 88px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02P02PowerConsumption"></span></td>
                <td><span id="Span6"></span></td>
                <td><span id="Span3"></span></td>
            </tr>
            <tr>
                <td><span id="Span1"></span></td>
                <td><span id="Span7"></span></td>
                <td><span id="Span4"></span></td>
            </tr>
            <tr>
                <td><span id="Span2"></span></td>
                <td><span id="Span8"></span></td>
                <td><span id="Span5"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
