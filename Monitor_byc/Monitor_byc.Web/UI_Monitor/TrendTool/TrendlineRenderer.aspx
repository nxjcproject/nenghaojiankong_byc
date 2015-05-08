<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrendlineRenderer.aspx.cs" Inherits="Monitor_byc.Web.UI_Monitor.TrendTool.TrendlineRenderer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<!-- easyui 样式开始 -->
	<link rel="stylesheet" type="text/css" href="/lib/ealib/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
	<!-- easyui 样式结束 -->
	<!-- easyui 脚本开始 -->
	<script type="text/javascript" src="/lib/ealib/jquery.min.js"></script>
	<script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/lib/ealib/locale/easyui-lang-zh_CN.js"></script>
	<!-- easyui 脚本结束 -->
		
	<!-- jqplot 样式开始 -->
	<link rel="stylesheet" type="text/css" href="/lib/pllib/jquery.jqplot.min.css" />
	<!-- jqplot 样式结束 -->
	<!-- jqplot 脚本开始 -->
	<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="/lib/pllib/excanvas.js"></script><![endif]-->
	<script type="text/javascript" src="/lib/pllib/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="/lib/pllib/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.canvasTextRenderer.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.dateAxisRenderer.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.cursor.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.highlighter.min.js"></script>
	<script type="text/javascript" src="/lib/pllib/plugins/jqplot.trendline.min.js"></script>
	<!-- jqplot 脚本结束 -->
		
	<!-- colorpicker 样式开始 -->
	<link rel="stylesheet" type="text/css" href="/lib/cplib/css/colorpicker.css" />
	<!-- colorpicker 样式结束 -->
	<!-- colorpicker 脚本开始 -->
	<script type="text/javascript" src="/lib/cplib/js/colorpicker.js"></script>
	<!-- colorpicker 脚本结束 -->
		
	<style>
	body {
		min-width: 800px;
		min-height: 600px;
	}
	.jqplot-axis {
		font-size: 12px;
		color: grey;
	}
	.jqplot-highlighter-tooltip {
		font-size: 12px;
		color: grey;
		background-color: white;
	}
	.jqplot-cursor-tooltip {
		font-size: 12px;
		color: grey;
		background-color: white;
	}
	</style>
		
	<script>
	    var DATA_POINT_PER_SCREEN = 5;

		$(document).ready(function () {

		    var thisId = window.location.hash;
		    if (thisId != "" && thisId != undefined) {
		        //alert(thisId);
		    }
		    currentData = data.slice(0, DATA_POINT_PER_SCREEN);
		    plotChart();

		    $('#chartContainer').panel({
		        onResize: function (w, h) {
		            plot1.replot({ resetAxes: true });
		        }
		    });


		    ///////////////////////////////////////////////////////////////////////////
		    // colorpicker初始化
		    ///////////////////////////////////////////////////////////////////////////

		    $('#colorpickerContainer').ColorPicker({
		        flat: true,
		        color: '#4bb2c5',
		        onSubmit: applyNewColor
		    });

		    function applyNewColor(hsb, hex, rgb) {
		        chartOptions.seriesColors[0] = '#' + hex;
		        plot1.replot(chartOptions);
		        $('#dlgColor').dialog('close');
		    }


		    ///////////////////////////////////////////////////////////////////////////
		    // jqplot设置
		    ///////////////////////////////////////////////////////////////////////////

		    // 初始化

		    $("input[type=checkbox][name=gridsVertical]").attr("checked", false);
		    $("input[type=checkbox][name=gridsHorizontal]").attr("checked", false);

		    // 背景颜色

		    $("input[type=radio][name=backgroundColor]").change(function () {
		        $('#chartContainer').css("background", $(this).val());
		        $('#sliderContainer').css("background", $(this).val());
		        chartOptions.grid.background = $(this).val();
		        plot1.replot(chartOptions);
		    });

		    // 垂直网格

		    $("input[type=checkbox][name=gridsVertical]").change(function () {
		        chartOptions.axes.xaxis.tickOptions.showGridline = this.checked;
		        plot1.replot(chartOptions);
		    });

		    // 水平网格

		    $("input[type=checkbox][name=gridsHorizontal]").change(function () {
		        chartOptions.axes.yaxis.tickOptions.showGridline = this.checked;
		        plot1.replot(chartOptions);
		    });
		    
		    // 线宽

		    $("input[type=radio][name=lineWidth]").change(function () {
		        chartOptions.seriesDefaults.lineWidth = $(this).val();
		        plot1.replot(chartOptions);
		    });

		    // 光滑/折线

		    $("input[type=radio][name=lineSmooth]").change(function () {
		        chartOptions.seriesDefaults.rendererOptions.smooth = ($(this).val() == '1') ? true : false;
		        plot1.replot(chartOptions);
		    });

		    // 填充

		    $("a[name=lineFilled]").click(function () {
		        chartOptions.seriesDefaults.fill = !chartOptions.seriesDefaults.fill;
		        plot1.replot(chartOptions);
		    });

		    // 趋势

		    $("a[name=lineTrend]").click(function () {
		        chartOptions.seriesDefaults.trendline.show = !chartOptions.seriesDefaults.trendline.show;
		        plot1.replot(chartOptions);
		    });
		});

		var plot1 = null;
		var data = [['2015-04-01', 578.55], ['2015-04-02', 566.15], ['2015-04-03', 480.88], ['2015-04-04', 509.84],
                    ['2015-04-05', 454.13], ['2015-04-06', 379.75], ['2015-04-07', 303.12], ['2015-04-08', 308.56],
                    ['2015-04-09', 299.14], ['2015-04-10', 346.51], ['2015-04-11', 325.99], ['2015-04-12', 386.15],
		            ['2015-04-13', 578.55], ['2015-04-14', 566.15], ['2015-04-15', 480.88], ['2015-04-16', 509.84],
                    ['2015-04-17', 454.13], ['2015-04-18', 379.75], ['2015-04-19', 303.12], ['2015-04-20', 308.56],
                    ['2015-04-21', 299.14], ['2015-04-22', 346.51], ['2015-04-23', 325.99], ['2015-04-24', 386.15]];
		var currentData = [];

		// chart 选项

		var chartOptions = {
		    seriesColors: ["#4bb2c5", "#c5b47f", "#EAA228", "#579575", "#839557", "#958c12",
					"#953579", "#4b5de4", "#d8b83f", "#ff5800", "#0085cc"],
		    seriesDefaults: {
		        show: true,
		        lineWidth: 1.0,
		        showLine: true,
		        fill: false,
		        showMarker: false,
		        renderer: $.jqplot.LineRenderer,
		        rendererOptions: {
		            smooth: true											// smooth
		        },
		        trendline: {
		            show: false												// trendline
		        },
		        isDragable: false											// dragable
		    },
		    grid: {
		        gridLineColor: 'grey',
		        background: 'black',
		        borderColor: 'grey',
		        borderWidth: 1.0
		        //renderer: $.jqplot.CanvasGridRenderer,
		        //rendererOptions: {} 
		    },
		    cursor: {
		        show: true
		    },
		    highlighter: {
		        show: true,
		        showMarker: true,
		        useAxesFormatters: true
		    },
		    axes: {
		        xaxis: {
		            renderer: $.jqplot.DateAxisRenderer,
		            tickRenderer: $.jqplot.CanvasAxisTickRenderer,
		            tickOptions: {
		                showGridline: false,
		                angle: -30,
		                formatString: '%Y-%m-%d %H:%M:%S'
		            }
		        },
		        yaxis: {
		            tickOptions: {
		                showGridline: false
		            }
		        }
		    }
		};

		function plotChart() {
		    plot1 = $.jqplot('chart', [currentData], chartOptions);
		}

		function test(value) {
		    value = (value * (data.length - DATA_POINT_PER_SCREEN) / 100);
		    currentData = data.slice(value, value + DATA_POINT_PER_SCREEN);
		    if (plot1) {
		        plot1.destroy();
		    }
		    plot1 = $.jqplot('chart', [currentData], chartOptions);
		}

	</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:62px;overflow:hidden;">
		<div class="easyui-panel" style="width:100%;">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="$('#dlgConfig').dialog('open')">设置</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="$('#dlgColor').dialog('open')">颜色</a>
			<a href="javascript:void(0)" class="easyui-menubutton" data-options="plain:true,menu:'#menAction'">操作</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'">帮助</a>
		</div>
		<div class="easyui-panel" style="width:100%;margin-top:-2px;padding:4px;">
			<input class="easyui-datetimebox" style="width:145px"> - <input class="easyui-datetimebox" style="width:145px">
			<select class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" style="width:60px;auto-height:true;">
				<option value="AL">5分钟</option>
				<option value="AK">1小时</option>
			</select>
			<!--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>-->
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>
			<a href="javascript:void(0)" name="lineFilled" class="easyui-linkbutton" data-options="plain:true,toggle:true">填充</a>
			<a href="javascript:void(0)" name="lineTrend" class="easyui-linkbutton" data-options="plain:true,toggle:true">趋势</a>
		</div>
	</div>
	<div data-options="region:'south',border:false,split:true" style="height:100px;">
		<table class="easyui-datagrid" data-options="singleSelect:true,fit:true">
			<thead>
				<tr>
					<th data-options="field:'itemid',width:80,align:'center'">显示</th>
					<th data-options="field:'productid',width:100,align:'center'">颜色</th>
					<th data-options="field:'listprice',width:100,align:'center'">标签</th>
					<th data-options="field:'unitcost',width:100,align:'center'">平均值</th>
					<th data-options="field:'attr1',width:100,align:'center'">下限</th>
					<th data-options="field:'status',width:100,align:'center'">上限</th>
				</tr>
			</thead>
		</table>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-layout" data-options="fit:true">
			<div id="chartContainer" data-options="region:'center',border:false" style="overflow:hidden;background-color:black;">
				<div id="chart" style="width:100%;height:100%;"></div>
			</div>
			<div id="sliderContainer" data-options="region:'south',border:false" style="height:20px;overflow:hidden;background-color:black;">
				<input class="easyui-slider" data-options="onChange:test" style="margin-bottom:0px;" />
			<div>
		<div>
	</div>
	<div id="dlgConfig" class="easyui-dialog" title="设置" style="width:400px;height:200px;padding:10px"
			data-options="
				closed:true,
				modal:true,
				buttons: [{
					text:'确认',
					iconCls:'icon-ok',
					handler:function(){
						$('#dlgConfig').dialog('close');
					}
				}]
			">
        <div>
            <b>背景颜色：</b>
            <ul>
                <li><input name="backgroundColor" value="black" type="radio" checked />黑色（默认）</li>
                <li><input name="backgroundColor" value="white" type="radio" />白色</li>
            </ul>
        </div>
        <div>
            <b>网格：</b>
            <ul>
                <li><input name="gridsVertical" value="vertical" type="checkbox" />垂直</li>
                <li><input name="gridsHorizontal" value="horizontal" type="checkbox" />水平</li>
            </ul>
        </div>
        <div>
            <b>线宽：</b>
            <ul>
                <li><input name="lineWidth" value="1" type="radio" checked />细（默认）</li>
                <li><input name="lineWidth" value="2" type="radio" />粗</li>
            </ul>
        </div>
        <div>
            <b>曲线选项：</b>
            <ul>
                <li><input name="lineSmooth" value="1" type="radio" checked />光滑（默认）</li>
                <li><input name="lineSmooth" value="2" type="radio" />折线</li>
            </ul>
        </div>
	</div>
	<div id="dlgColor" class="easyui-dialog" title="颜色" style="width:370px;height:212px;padding:0px"
			data-options="closed:true,modal:true">
		<div id="colorpickerContainer"></div>
    </div>
	<div id="menAction" style="width:100px;">
		<div>打印</div>
		<div class="menu-sep"></div>
		<div>保存</div>
	</div>
    <form id="form1" runat="server"></form>
</body>
</html>
