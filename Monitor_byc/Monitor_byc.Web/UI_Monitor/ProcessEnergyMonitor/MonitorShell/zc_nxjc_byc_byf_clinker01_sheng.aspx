<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zc_nxjc_byc_byf_clinker01_sheng.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.zc_nxjc_byc_byf_clinker01_sheng" %>

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
    <div id ="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_clinker01_sheng.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 42px; left: 14px;">
            <tr>
                <td><span id="Span32"></span></td>
            </tr>
            <tr>
                <td><span id="crusher1C"></span></td>
            </tr>
            <tr>
                <td><span id="crusher1P"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 137px; left: 15px;">
            <tr>
                <td><span id="Span1"></span></td>
            </tr>
            <tr>
                <td><span id=""></span></td>
            </tr>
            <tr>
                <td><span id="limestoneMineBeltP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 214px; left: 14px;">
            <tr>
                <td><span id="Span4"></span></td>
            </tr>
            <tr>
                <td><span id="Span5"></span></td>
            </tr>
            <tr>
                <td><span id="limePilePeclaimerP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 315px; left: 15px;">
            <tr>
                <td><span id="Span7"></span></td>
            </tr>
            <tr>
                <td><span id="limestoneStorageBeltC"></span></td>
            </tr>
            <tr>
                <td><span id="limestoneStorageBeltP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 39px; left: 187px;">
            <tr>
                <td><span id="Span10"></span></td>
            </tr>
            <tr>
                <td><span id="crusher2C"></span></td>
            </tr>
            <tr>
                <td><span id="crusher2P"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 141px; left: 400px;">
            <tr>
                <td><span id="Span19"></span></td>
            </tr>
            <tr>
                <td><span id=" sandstoneCrusherC"></span></td>
            </tr>
            <tr>
                <td><span id=" sandstoneCrusherP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 356px; left: 496px;">
            <tr>
                <td><span id="Span12"></span></td>
            </tr>
            <tr>
                <td><span id="powderSelectingMachineC"></span></td>
            </tr>
            <tr>
                <td><span id="powderSelectingMachineP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 231px; left: 868px;">
            <tr>
                <td><span id="Span15"></span></td>
            </tr>
            <tr>
                <td><span id="circulatingFanC"></span></td>
            </tr>
            <tr>
                <td><span id="circulatingFanP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 218px; left: 1133px;">
            <tr>
                <td><span id="Span22"></span></td>
            </tr>
            <tr>
                <td><span id="highTemperatureFanC"></span></td>
            </tr>
            <tr>
                <td><span id="highTemperatureFanP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 607px; left: 511px;">
            <tr>
                <td><span id="Span25"></span></td>
            </tr>
            <tr>
                <td><span id="rawMealGrindingMainMotorC"></span></td>
            </tr>
            <tr>
                <td><span id="rawMealGrindingMainMotorP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 425px; left: 1191px;">
            <tr>
                <td><span id="Span28"></span></td>
            </tr>
            <tr>
                <td><span id="kilnTailExhaustFanC"></span></td>
            </tr>
            <tr>
                <td><span id="kilnTailExhaustFanP"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 562px; left: 99px;">
            <tr>
                <td><span id="Span38"></span></td>
                <td><span id="Span39"></span></td>
                <td><span id="Span31"></span></td>
            </tr>
            <tr>
                <td><span id="Span40"></span></td>
                <td><span id="Span41"></span></td>
                <td><span id="Span33"></span></td>
            </tr>
            <tr>
                <td><span id="Span42"></span></td>
                <td><span id="Span43"></span></td>
                <td><span id="Span34"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
