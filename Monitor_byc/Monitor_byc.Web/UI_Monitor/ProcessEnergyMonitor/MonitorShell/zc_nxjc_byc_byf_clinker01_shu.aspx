<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zc_nxjc_byc_byf_clinker01_shu.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.zc_nxjc_byc_byf_clinker01_shu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <title></title>
</head>
<body>
    <div style="position: relative; background-image: url('../../images/page/zc_nxjc_byc_byf_clinker01_shu.png'); width: 1350px; height: 740px; overflow: hidden;">
        <table class="mytable" style="position: absolute; top: 77px; left: 37px;">
            <tr>
                <td><span id="zc_nxjc_byc_byf_cementmill01P01PowerConsumption"></span></td>
            </tr>
            <tr>
                <td><span id="kilnHoistC"></span></td>               
            </tr>
            <tr>
                <td><span id="Span2"></span></td>             
            </tr>
        </table>
         <table class="mytable" style="position: absolute; top: 143px; left: 36px;">
            <tr>
                <td><span id="Span3"></span></td>
            </tr>
            <tr>
                <td><span id="Span4"></span></td>               
            </tr>
            <tr>
                <td><span id="Span5"></span></td>             
            </tr>
        </table>
         <table class="mytable" style="position: absolute; top: 229px; left: 741px;">
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
        <table class="mytable" style="position: absolute; top: 462px; left: 361px;">
            <tr>
                <td><span id="Span87"></span></td>
            </tr>
            <tr>
                <td><span id="Span88"></span></td>               
            </tr>
            <tr>
                <td><span id="Span89"></span></td>             
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 450px; left: 475px;">
            <tr>
                <td><span id="Span90"></span></td>
            </tr>
            <tr>
                <td><span id="Span91"></span></td>               
            </tr>
            <tr>
                <td><span id="Span92"></span></td>             
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 518px; left: 475px;">
            <tr>
                <td><span id="Span93"></span></td>
            </tr>
            <tr>
                <td><span id="Span94"></span></td>               
            </tr>
            <tr>
                <td><span id="Span95"></span></td>             
            </tr>
        </table>
         <table class="mytable" style="position: absolute; top: 438px; left: 857px;">
            <tr>
                <td><span id="Span96"></span></td>
            </tr>
            <tr>
                <td><span id="clinkerChainConveyorC"></span></td>               
            </tr>
            <tr>
                <td><span id="clinkerChainConveyorP"></span></td>             
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 117px; left: 1240px;">
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
        <table class="mytable" style="position: absolute; top: 273px; left: 992px;">
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
        <table class="mytable" style="position: absolute; top: 278px; left: 1224px;">
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
        <table class="mytable" style="position: absolute; top: 450px; left: 1141px;">
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
          <table class="mytable" style="position: absolute; top: 534px; left: 1229px;">
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
        <table class="mytable" style="position: absolute; top: 532px; left: 89px;">
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
         <table class="mytable" style="position: absolute; top: 621px; left: 89px;">
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
        <table class="mytable" style="position: absolute; top: 569px; left: 611px;">
            <tr>
                <td><span id="Span27"></span></td>
                <td><span id="Span28"></span></td>
                <td><span id="Span29"></span></td>
                <td><span id="Span54"></span></td>
                <td><span id="Span55"></span></td>
                <td><span id="Span56"></span></td>
            </tr>
            <tr>
                <td><span id="Span30"></span></td>
                <td><span id="Span31"></span></td>
                <td><span id="Span32"></span></td>
                <td><span id="Span57"></span></td>
                <td><span id="Span58"></span></td>
                <td><span id="Span59"></span></td>
            </tr>
            <tr>
                <td><span id="Span33"></span></td>
                <td><span id="Span34"></span></td>
                <td><span id="Span35"></span></td>
                <td><span id="Span60"></span></td>
                <td><span id="Span61"></span></td>
                <td><span id="Span62"></span></td>
            </tr>
        </table>
        <table class="mytable" style="position: absolute; top: 675px; left: 584px;">
            <tr>
                <td><span id="Span51"></span></td>
                <td><span id="Span52"></span></td>
                <td><span id="Span53"></span></td>
                <td><span id="Span63"></span></td>
                <td><span id="Span64"></span></td>
                <td><span id="Span65"></span></td>
                <td><span id="Span78"></span></td>
            </tr>
            <tr>
                <td><span id="Span66"></span></td>
                <td><span id="Span67"></span></td>
                <td><span id="Span68"></span></td>
                <td><span id="Span69"></span></td>
                <td><span id="Span70"></span></td>
                <td><span id="Span71"></span></td>
                <td><span id="Span79"></span></td>
            </tr>
            <tr>
                <td><span id="Span72"></span></td>
                <td><span id="Span73"></span></td>
                <td><span id="Span74"></span></td>
                <td><span id="Span75"></span></td>
                <td><span id="Span76"></span></td>
                <td><span id="Span77"></span></td>
                <td><span id="Span80"></span></td>
            </tr>
        </table>
    </div>
</body>
</html>
