<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zc_nxjc_byc_byf.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.zc_nxjc_byc_byf" %>

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
        publicData.organizationId = "zc_nxjc_byc_byf";
        publicData.sceneName = "";
    </script>
    <title></title>
</head>
<body id="SubMonitorBody" style="margin: 0px; padding: 0px; overflow: auto;">
    <div id="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf.png'); width: 1287px; height: 705px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 83px; left: 19px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 84px; left: 85px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawBatchHomogenize_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 149px; left: 191px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_MixtureMaterialsOutput>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 302px; left: 495px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 301px; left: 557px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>coalPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 55px; left: 363px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 52px; left: 426px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>wasteGasTreatment_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 389px; left: 23px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 390px; left: 84px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsGrind_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsGrind_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsGrind_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 387px; left: 500px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalOutput>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 48px; left: 930px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 48px; left: 989px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>hybridMaterialsPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 94px; left: 685px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 98px; left: 747px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerTransport_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 211px; left: 617px; right: 604px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerElectricityGeneration_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="Span26"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>electricityOutput_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>electricityOwnDemand_ElectricityQuantity>Class"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 211px; left: 683px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerElectricityGeneration_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="Span33"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>electricityOutput_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>electricityOwnDemand_ElectricityConsumption>Class"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 55px; left: 1142px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf>auxiliaryProduction_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>auxiliaryProduction_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>auxiliaryProduction_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 158px; left: 1092px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 158px; left: 1152px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cementPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 196px; left: 1004px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cement_CementOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cement_CementOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01>cement_CementOutput>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 409px; left: 1004px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cement_CementOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cement_CementOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cement_CementOutput>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 373px; left: 841px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 373px; left: 903px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill02>cementPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 505px; left: 772px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_ClinkerOutput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_ClinkerOutput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_ClinkerOutput>Month"></span></td>
            </tr>
        </table>

        <table class="mytable" style="position: absolute; top: 583px; left: 1028px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 583px; left: 1087px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementPacking_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 606px; left: 749px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalInput>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalInput>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_PulverizedCoalInput>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 605px; left: 812px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_CoalConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_CoalConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_CoalConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 604px; left: 597px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityQuantity>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityQuantity>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityQuantity>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 605px; left: 658px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerBurning_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 612px; left: 404px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_ElectricityConsumption>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinker_CoalConsumption>CoalConsumption"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 612px; left: 471px;">
            <tr>
                <td><span id="zc_nxjc_byc>cementmill_ElectricityConsumption>ElectricityConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc>cementmill_CoalConsumption>CoalConsumption"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 589px; left: 83px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerPreparation_ElectricityConsumption>Class"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementmill_ElectricityConsumption>Class"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 589px; left: 152px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerPreparation_ElectricityConsumption>Day"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementmill_ElectricityConsumption>Day"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 589px; left: 222px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>rawMaterialsPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf_clinker01>clinkerPreparation_ElectricityConsumption>Month"></span></td>
            </tr>
            <tr>
                <td><span id="zc_nxjc_byc_byf>cementmill_ElectricityConsumption>Month"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
