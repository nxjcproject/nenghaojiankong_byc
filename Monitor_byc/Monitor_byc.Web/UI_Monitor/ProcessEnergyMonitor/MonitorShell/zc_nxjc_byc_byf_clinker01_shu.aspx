<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zc_nxjc_byc_byf_clinker01_shu.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.zc_nxjc_byc_byf_clinker01_shu" %>

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
    <title></title>
</head>
<body id ="SubMonitorBody" style ="margin:0px; padding:0px;overflow: auto;">
    <div id ="SubMonitorLayout" style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_clinker01_shu.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 75px; left: 30px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01P01PowerConsumption">ssssss</span></td>
            </tr>
            <tr>
                <td><span id="kilnHoist1C"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHoist1P"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 144px; left: 30px;">
            <tr>
                <td><span id="Span3"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHoist2C"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHoist2P"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 230px; left: 735px;">
            <tr>
                <td><span id="Span6"></span></td>
            </tr>
            <tr>
                <td><span id="coalMillMainMotorC"></span></td>
            </tr>
            <tr>
                <td><span id="coalMillMainMotorP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 464px; left: 358px;">
            <tr>
                <td><span id="Span87"></span></td>
            </tr>
            <tr>
                <td><span id="kilnMainMotorC"></span></td>
            </tr>
            <tr>
                <td><span id="kilnMainMotorP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 452px; left: 470px;">
            <tr>
                <td><span id="Span90"></span></td>
            </tr>
            <tr>
                <td><span id="FVOAC"></span></td>
            </tr>
            <tr>
                <td><span id="FVOAP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 520px; left: 472px;">
            <tr>
                <td><span id="Span93"></span></td>
            </tr>
            <tr>
                <td><span id="FVOBC"></span></td>
            </tr>
            <tr>
                <td><span id="FVOBP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 116px; left: 1234px;">
            <tr>
                <td><span id="Span9"></span></td>
            </tr>
            <tr>
                <td><span id="coalMillFanC"></span></td>
            </tr>
            <tr>
                <td><span id="coalMillFanP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 274px; left: 988px;">
            <tr>
                <td><span id="Span18"></span></td>
            </tr>
            <tr>
                <td><span id="Span19"></span></td>
            </tr>
            <tr>
                <td><span id="Span20"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 277px; left: 1220px;">
            <tr>
                <td><span id="Span21"></span></td>
            </tr>
            <tr>
                <td><span id="Span22"></span></td>
            </tr>
            <tr>
                <td><span id="Span23"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 450px; left: 1135px;">
            <tr>
                <td><span id="Span81"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHeadExhaustFanC"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHeadExhaustFanP"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 534px; left: 1224px;">
            <tr>
                <td><span id="Span84"></span></td>
            </tr>
            <tr>
                <td><span id="Span85"></span></td>
            </tr>
            <tr>
                <td><span id="Span86"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 438px; left: 853px;">
            <tr>
                <td><span id="Span10"></span></td>
            </tr>
            <tr>
                <td><span id="Span11"></span></td>
            </tr>
            <tr>
                <td><span id="Span13"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 530px; left: 84px;">
            <tr>
                <td><span id="Span12"></span></td>
                <td><span id=""></span></td>
                <td><span id="Span1"></span></td>
            </tr>
            <tr>
                <td><span id="Span14"></span></td>
                <td><span id="Span15"></span></td>
                <td><span id="Span25"></span></td>
            </tr>
            <tr>
                <td><span id="Span16"></span></td>
                <td><span id="Span17"></span></td>
                <td><span id="Span26"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 621px; left: 84px;">
            <tr>
                <td><span id="Span36"></span></td>
                <td><span id="Span37"></span></td>
                <td><span id="Span38"></span></td>
            </tr>
            <tr>
                <td><span id="Span39"></span></td>
                <td><span id="Span40"></span></td>
                <td><span id="Span41"></span></td>
            </tr>
            <tr>
                <td><span id="Span42"></span></td>
                <td><span id="Span43"></span></td>
                <td><span id="Span44"></span></td>
            </tr>
            <tr>
                <td><span id="Span45"></span></td>
                <td><span id="Span46"></span></td>
                <td><span id="Span47"></span></td>
            </tr>
            <tr>
                <td><span id="Span48"></span></td>
                <td><span id="Span49"></span></td>
                <td><span id="Span50"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 677px; left: 590px;">
            <tr>
                <td><span id="Span27"></span></td>
                <td><span id="Span28"></span></td>
                <td><span id="Span29"></span></td>
                <td><span id="Span54"></span></td>
                <td><span id="Span55"></span></td>
                <td><span id="Span2"></span></td>
                <td><span id="Span4"></span></td>
            </tr>
            <tr>
                <td><span id="grateCooler1C"></span></td>
                <td><span id="grateCooler2C"></span></td>
                <td><span id="grateCooler4C"></span></td>
                <td><span id="grateCooler6C"></span></td>
                <td><span id="grateCooler8C"></span></td>
                <td><span id="grateCooler10C"></span></td>
                <td><span id="grateCooler12C"></span></td>
            </tr>
            <tr>
                <td><span id="grateCooler1P"></span></td>
                <td><span id="grateCooler2P"></span></td>
                <td><span id="grateCooler4P"></span></td>
                <td><span id="grateCooler6P"></span></td>
                <td><span id="grateCooler8P"></span></td>
                <td><span id="grateCooler10P"></span></td>
                <td><span id="grateCooler12P"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 569px; left: 604px;">
            <tr>
                <td><span id="Span51"></span></td>
                <td><span id="Span52"></span></td>
                <td><span id="Span53"></span></td>
                <td><span id="Span63"></span></td>
                <td><span id="Span64"></span></td>
                <td><span id="Span65"></span></td>

            </tr>
            <tr>
                <td><span id="grateCooler3C"></span></td>
                <td><span id="FVOCC"></span></td>
                <td><span id="grateCooler5C"></span></td>
                <td><span id="grateCooler7C"></span></td>
                <td><span id="grateCooler9C"></span></td>
                <td><span id="grateCooler11C"></span></td>

            </tr>
            <tr>
                <td><span id="grateCooler3P"></span></td>
                <td><span id="FVOCP"></span></td>
                <td><span id="grateCooler5P"></span></td>
                <td><span id="grateCooler7P"></span></td>
                <td><span id="grateCooler9P"></span></td>
                <td><span id="grateCooler11P"></span></td>

            </tr>
        </table>
    </div>
</body>
</html>
