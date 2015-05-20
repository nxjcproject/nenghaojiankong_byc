﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiMonitorShell.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.ProcessEnergyMonitor.MonitorShell.MultiMonitorShell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="/UI_Monitor/js/common/MonitorShell.js" charset="utf-8"></script>
</head>
<body>
    <div id="MonitorLayout" class="easyui-layout" data-options="border:false,fit:true">
        <div data-options="region:'center',border:true,collapsible:false" style="margin: 0px; padding: 0px;">
            <iframe id="ProcessMontor" name="ProcessMontor" class="DefalutMontor" data-option="allowtransparency:true,frameborder:0" style="width: 100%; height: 100%;"></iframe>
        </div>
        <div data-options="region:'south',border:true,collapsible:false" style="height: 26px; overflow: hidden; margin: 0px; padding: 0px;">
            <div style="float: left; white-space:nowrap;">
                <table>
                    <tr id="DisplayPageButtons" >

                    </tr>
                </table>
            </div>
            <div style="float: right;">
                <table style="margin-right: 15px;">
                    <tr>
                        <td style="width: 35px;">
                            <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'ext-icon-chart_curve',toggle:false" style="height: 22px;"></a>--%>
                        </td>
                        <td style="width: 35px;">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'ext-icon-image',toggle:true" style="height: 22px;" onclick="SetAutoResize();"></a>
                        </td>
                        <td>
                            <input id="slider_MonitorZoom" class="easyui-slider" style="width: 200px; height: 24px;" data-options="showTip:false, reversed:true" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
        <div>
            <input type="text" style="display: none" id="organizationIdContainerId" runat="server" />
            <input type="text" style="display: none" id="organizationTypeContainerId" runat="server" />
            <input type="text" style="display: none" id="organizationNameContainerId" runat="server" />
            <input type="text" style="display: none" id="pageIdStringContainerId" runat="server" />
        </div>
    </form>
</body>
</html>
