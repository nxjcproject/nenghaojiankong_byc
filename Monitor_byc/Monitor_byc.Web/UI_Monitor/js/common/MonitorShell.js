var BrowserName = "IE";
var AutoResizeFlag = false;    //当true表示自动调整大小，当false根据滑动条调整大小
var OrganizationId = "";
var OrganizationName = "";
var OrganizationType = "";
var PageIdString = "";
$(function () {
    //Initialize();
    InitializeData();
    InitializeSlider();
    InitializeIframe();
    SetDisplayPageButton();
});

//初始化数据
function InitializeData() {
    BrowserName = getbrowser();    //获得浏览器信息

    OrganizationId = $('#organizationIdContainerId').val();              //后台传来的组织机构ID
    OrganizationName = $('#organizationNameContainerId').val();          //后台传来的组织机构名称
    OrganizationType = $('#organizationTypeContainerId').val();          //后台传来的组织机构类型
    PageIdString = $('#pageIdStringContainerId').val();                  //后台传来的页面信息


    if (OrganizationType == "熟料") {
        $("#ProcessMontor").attr("src", OrganizationId + '_sheng.aspx?PageId=' + PageIdString);
        //$("#ProcessMontor").reload();
    }
    else {
        $("#ProcessMontor").attr("src", OrganizationId + '.aspx?PageId=' + PageIdString);
        //$("#ProcessMontor").reload();
    }
}
//初始化Iframe，Ifame自适应大小
function InitializeIframe() {
    if (BrowserName == "IE") {
        if (document.compatMode == "CSS1Compat") {//模式匹配 解决ie8下兼容模式
        }
        $('#ProcessMontor').css('width', $('#MonitorLayout').layout('panel', 'center').panel('options').width - 4);
        $('#ProcessMontor').css('height', $('#MonitorLayout').layout('panel', 'center').panel('options').height - 5);

        $('#MonitorLayout').layout('panel', 'center').panel({
            onResize: function (width, height) {
                $('#ProcessMontor').css('width', width - 4);
                $('#ProcessMontor').css('height', height - 5);
                if (AutoResizeFlag == true) {               //子页面自动调整大小
                    SetAutoMonitorZoom(width - 4, height - 5);
                }
            }
        });

    } else if (BrowserName == "FF") {
        $('#ProcessMontor').css('width', $('#MonitorLayout').layout('panel', 'center').panel('options').width - 6);
        $('#ProcessMontor').css('height', $('#MonitorLayout').layout('panel', 'center').panel('options').height - 6);

        $('#MonitorLayout').layout('panel', 'center').panel({
            onResize: function (width, height) {
                $('#ProcessMontor').css('width', width - 6);
                $('#ProcessMontor').css('height', height - 6);
                if (AutoResizeFlag == true) {               //子页面自动调整大小
                    SetAutoMonitorZoom(width - 6, height - 6);
                }
            }
        });
    } else {
        $('#ProcessMontor').css('width', $('#MonitorLayout').layout('panel', 'center').panel('options').width - 19);
        $('#ProcessMontor').css('height', $('#MonitorLayout').layout('panel', 'center').panel('options').height - 5);

        $('#MonitorLayout').layout('panel', 'center').panel({
            onResize: function (width, height) {
                $('#ProcessMontor').css('width', width - 19);
                $('#ProcessMontor').css('height', height - 5);
                if (AutoResizeFlag == true) {               //子页面自动调整大小
                    SetAutoMonitorZoom(width - 19, height - 5);
                }
            }
        });
    }

}
//初始化滑块
function InitializeSlider() {
    $('#slider_MonitorZoom').slider({
        width: 200,
        height: 24,
        value: 100,
        min: 10,
        max: 100,
        step: 10,
        showTip: false,
        mode: 'h',
        reversed: true,
        onChange: function (newValue, oldValue) {
            if (AutoResizeFlag == false) {
                MonitorZoom(newValue, oldValue);
                document.getElementById("ProcessMontor").contentWindow.SetBodySize(parseFloat(newValue) / 100, $('#ProcessMontor').width(), $('#ProcessMontor').height(), BrowserName);
            }
        }
    });
}
//当点击自动匹配大小按钮后，iframe中的页面按照比例自适应当前窗口
function SetAutoResize() {
    if (AutoResizeFlag == false) {
        AutoResizeFlag = true;

        var m_IframeWidth = $('#ProcessMontor').width();
        var m_IframeHeight = $('#ProcessMontor').height();
        SetAutoMonitorZoom(m_IframeWidth, m_IframeHeight);
    }
    else {
        AutoResizeFlag = false;
    }
}
//改变缩放比例
function SetAutoMonitorZoom(myWidth, myHeight) {
    var m_SubPageWidth = document.getElementById("ProcessMontor").contentWindow.GetDefaultWidth();
    var m_SubPageHeight = document.getElementById("ProcessMontor").contentWindow.GetDefaultHeight();
    var m_ZommRadioValue = 100;
    if (myWidth / myHeight > m_SubPageWidth / m_SubPageHeight) {            //当现有iframe的宽高比大于子页面的宽高比，则按高进行比例缩放
        m_ZommRadioValue = myHeight * 100 / m_SubPageHeight;
    }
    else {//当现有iframe的宽高比小于等于子页面的宽高比，则按宽进行比例缩放
        m_ZommRadioValue = myWidth * 100 / m_SubPageWidth;
    }
    MonitorZoom(m_ZommRadioValue, m_ZommRadioValue);
    document.getElementById("ProcessMontor").contentWindow.SetBodySize(parseFloat(m_ZommRadioValue) / 100, $('#ProcessMontor').width(), $('#ProcessMontor').height(), BrowserName);
}
//改变缩放比例
function MonitorZoom(myNewValue, myOldValue) {
    var zoomObject = document.getElementById("ProcessMontor").contentWindow.document.body;

    zoomEle(zoomObject, parseFloat(myNewValue) / 100, parseFloat(myNewValue) / 100);
}

//获得浏览器名称
function getbrowser() {
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) { return "Opera" }; //判断是否Opera浏览器
    if (userAgent.indexOf("Firefox") > -1) { return "FF"; } //判断是否Firefox浏览器
    if (userAgent.indexOf("Safari") > -1) { return "Safari"; } //判断是否Safari浏览器
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) { return "IE"; };
    //判断是否IE浏览器
}
//对DOM元素缩放
function zoomEle(el, xScale, yScale) {
    style = el.getAttribute('style') || "";
    if (BrowserName == "IE") {
        if (document.compatMode == "CSS1Compat") {//模式匹配 解决ie8下兼容模式
            el.style.width = el.clientWidth * 2.0;
            el.style.height = el.clientHeight * 2.0;
        }
        el.style.zoom = xScale;
    } else if (BrowserName == "FF") {
        el.style.transform = 'scale(' + xScale + ', ' + yScale + ')';
        el.style.transformOrigin = '0px 0px';
    } else {
        el.setAttribute('style', style + '-webkit-transform: scale(' + xScale + ', ' + yScale + '); -webkit-transform-origin: 0px 0px;');
    }
}
//根据组织机构类型，生成左下角页面菜单
function SetDisplayPageButton() {
    //var OrganizationId = "";
    //var OrganizationName = "";
    //var OrganizationType = "";
    if (BrowserName != "IE") {
        if (OrganizationType == "熟料") {
            var m_DisplayButton01 = $('<a href="' + OrganizationId + '_sheng.aspx?PageId=' + PageIdString + '" style = "height:24px; padding-right:3px;" target="ProcessMontor"></a>');
            m_DisplayButton01.linkbutton({
                iconCls: 'icon-search',
                plain: false,
                text: '生料制备'
            });
            var m_DisplayButton02 = $('<a href="' + OrganizationId + '_shu.aspx?PageId=' + PageIdString + '" style = "height:24px; padding-right:3px;" target="ProcessMontor"></a>');
            m_DisplayButton02.linkbutton({
                iconCls: 'icon-search',
                plain: false,
                text: '熟料制备'
            });
            $('#DisplayPageButtons').append('<td></td>').append(m_DisplayButton01);
            $('#DisplayPageButtons').append('<td></td>').append(m_DisplayButton02);

        }
        else {
            var m_DisplayButton = $('<a href="' + OrganizationId + '.aspx?PageId=' + PageIdString + '" target="ProcessMontor" class="easyui-linkbutton" data-options="iconCls:\'icon-search\',toggle:false" style="height: 22px;">' + OrganizationName + '</a>');
            m_DisplayButton.linkbutton({
                iconCls: 'icon-search',
                plain: false
            });
            $('#DisplayPageButtons').append('<td></td>').append(m_DisplayButton);
        }
    }
    else {
        if (OrganizationType == "熟料") {
            var m_DisplayButton01 = $('<a href="' + OrganizationId + '_sheng.aspx?PageId=' + PageIdString + '" style = "height:24px; padding-right:3px;" target="ProcessMontor"></a>');
            m_DisplayButton01.linkbutton({
                iconCls: 'icon-search',
                plain: false,
                text: '生料制备'
            });
            var m_DisplayButton02 = $('<a href="' + OrganizationId + '_shu.aspx?PageId=' + PageIdString + '" style = "height:24px; padding-right:3px;" target="ProcessMontor"></a>');
            m_DisplayButton02.linkbutton({
                iconCls: 'icon-search',
                plain: false,
                text: '熟料制备'
            });
            var m_Td = $('<td></td>');

            m_Td.append(m_DisplayButton01);
            m_Td.append(m_DisplayButton02);
            $('#DisplayPageButtons').append(m_Td);

        }
        else {
            var m_DisplayButton = $('<a href="' + OrganizationId + '.aspx?PageId=' + PageIdString + '" target="ProcessMontor" class="easyui-linkbutton" data-options="iconCls:\'icon-search\',toggle:false" style="height: 22px;">' + OrganizationName + '</a>');
            m_DisplayButton.linkbutton({
                iconCls: 'icon-search',
                plain: false
            });
            var m_Td = $('<td></td>');
            m_Td.append(m_DisplayButton);
            $('#DisplayPageButtons').append(m_Td);
        }
    }
}
