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
        <table class="mytable" style="position: absolute; top: 45px; left: 19px;">
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
        <table class="mytable" style="position: absolute; top: 138px; left: 19px;">
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
        <table class="mytable" style="position: absolute; top: 217px; left: 19px;">
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
        <table class="mytable" style="position: absolute; top: 316px; left: 20px;">
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
        <table class="mytable" style="position: absolute; top: 41px; left: 193px;">
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
        <table class="mytable" style="position: absolute; top: 141px; left: 406px;">
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
        <table class="mytable" style="position: absolute; top: 358px; left: 502px;">
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
        <table class="mytable" style="position: absolute; top: 232px; left: 873px;">
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
        <table class="mytable" style="position: absolute; top: 221px; left: 1138px;">
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
        <table class="mytable" style="position: absolute; top: 608px; left: 515px;">
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
        <table class="mytable" style="position: absolute; top: 427px; left: 1196px;">
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

        <table class="mytable" style="position: absolute; top: 563px; left: 97px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation>ElectricityQuantity"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Material"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation>ElectricityConsumption"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 564px; left: 170px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 565px; left: 247px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
