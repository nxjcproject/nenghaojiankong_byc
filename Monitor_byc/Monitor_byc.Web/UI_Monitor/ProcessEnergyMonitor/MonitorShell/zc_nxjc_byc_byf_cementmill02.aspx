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

    <script src="../../js/common/monitorjs.js"></script>
    <script src="../../js/common/chartjs.js"></script>
    <script src="../../js/common/SubMonitorAdapter.js"></script>
    <title></title>
</head>
<body id ="SubMonitorBody" style ="margin:0px; padding:0px;overflow: auto;">
    <div id ="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_cementmill02.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 44px; left: 114px;">
            <tr>
                <td><span id="Span32"></span></td>
            </tr>
            <tr>
                <td><span id="gypsumCrusherC"></span></td>
            </tr>
            <tr>
                <td><span id="gypsumCrusherP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 187px; left: -2px;">
            <tr>
                <td><span id="Span9"></span></td>
            </tr>
            <tr>
                <td><span id="Span10"></span></td>
            </tr>
            <tr>
                <td><span id="clinkerStorageBeltP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 318px; left: 348px;">
            <tr>
                <td><span id="Span12"></span></td>
            </tr>
            <tr>
                <td><span id="rollingMachineSettledRollerC"></span></td>
            </tr>
            <tr>
                <td><span id="rollingMachineSettledRollerP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 363px; left: 533px;">
            <tr>
                <td><span id="Span15"></span></td>
            </tr>
            <tr>
                <td><span id="rollingMachineActionRollerC"></span></td>
            </tr>
            <tr>
                <td><span id="rollingMachineActionRollerP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 328px; left: 730px;">
            <tr>
                <td><span id="Span18"></span></td>
            </tr>
            <tr>
                <td><span id="powderSelectingStorehouseC"></span></td>
            </tr>
            <tr>
                <td><span id="powderSelectingStorehouseP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 434px; left: 839px;">
            <tr>
                <td><span id="Span21"></span></td>
            </tr>
            <tr>
                <td><span id="cementMillMainMotorC"></span></td>
            </tr>
            <tr>
                <td><span id="cementMillMainMotorP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 105px; left: 911px;">
            <tr>
                <td><span id="Span24"></span></td>
            </tr>
            <tr>
                <td><span id="mainExhaustFanC"></span></td>
            </tr>
            <tr>
                <td><span id="mainExhaustFanP"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 552px; left: 88px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01P01PowerConsumption">ssssss</span></td>
                <td><span id="Span6">ssss</span></td>
                <td><span id="Span3">ssss</span></td>
            </tr>
            <tr>
                <td><span id="Span1">1111</span></td>
                <td><span id="Span7">2222</span></td>
                <td><span id="Span4">ssss</span></td>
            </tr>
            <tr>
                <td><span id="Span2">3333</span></td>
                <td><span id="Span8">4444</span></td>
                <td><span id="Span5">ssss</span></td>
            </tr>
        </table>
    </div>
</body>
</html>
