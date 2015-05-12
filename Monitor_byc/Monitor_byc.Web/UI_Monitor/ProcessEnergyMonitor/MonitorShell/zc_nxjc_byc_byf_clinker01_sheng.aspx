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

    <script src="/UI_Monitor/js/common/monitorjs.js"></script>
    <script src="/UI_Monitor/js/common/chartjs.js"></script>
    <script src="/UI_Monitor/js/common/SubMonitorAdapter.js"></script>
    <script>
        publicData.organizationId = "zc_nxjc_byc_byf_clinker01";
        publicData.sceneName = "1#熟料线";
    </script>
    <title></title>
</head>
<body id="SubMonitorBody" style="margin: 0px; padding: 0px; overflow: auto;">
    <div id="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_clinker01_sheng.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 42px; left: 14px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher1>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher1>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher1>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 137px; left: 15px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneMineBelt>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneMineBelt>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneMineBelt>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 214px; left: 14px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limePilePeclaimer>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limePilePeclaimer>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limePilePeclaimer>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 315px; left: 15px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneStorageBelt>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneStorageBelt>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>limestoneStorageBelt>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 39px; left: 187px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher2>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher2>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>crusher2>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 141px; left: 400px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>sandstoneCrusher>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>sandstoneCrusher>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>sandstoneCrusher>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 356px; left: 496px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>powderSelectingMachine>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>powderSelectingMachine>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>powderSelectingMachine>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 231px; left: 868px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>circulatingFan>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>circulatingFan>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>circulatingFan>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 218px; left: 1133px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>highTemperatureFan>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>highTemperatureFan>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>highTemperatureFan>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 607px; left: 511px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMealGrindingMainMotor>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMealGrindingMainMotor>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMealGrindingMainMotor>Power"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 425px; left: 1191px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>kilnTailExhaustFan>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>kilnTailExhaustFan>Current"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>kilnTailExhaustFan>Power"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 563px; left: 94px;">
            <tr>
                <td><span id="Span38"></span></td>
            </tr>
            <tr>
                <td><span id="Span40"></span></td>
            </tr>
            <tr>
                <td><span id="Span42"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 563px; left: 167px;">
            <tr>
                <td><span id="Span1"></span></td>
            </tr>
            <tr>
                <td><span id="Span2"></span></td>
            </tr>
            <tr>
                <td><span id="Span3"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 563px; left: 241px;">
            <tr>
                <td><span id="Span4"></span></td>
            </tr>
            <tr>
                <td><span id="Span5"></span></td>
            </tr>
            <tr>
                <td><span id="Span6"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
