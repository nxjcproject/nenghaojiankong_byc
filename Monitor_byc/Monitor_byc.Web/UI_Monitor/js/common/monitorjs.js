var pageViewName = '';
var pageOrganizationId = '';
$(function () {
    pageViewName = $('#viewNameContainerId').val();
    pageOrganizationId = $('#organizationIdContainerId').val();
    
    InitializePage();
    if (pageViewName != 'saa') {
        $(".selectable").attr('data-organizationid', pageOrganizationId);
    };
    setTimeout(function () {
        if (pageViewName != 'saa') {
            $("#titleId").text(pageViewName + "生产能耗监控总貌图");
            var aa = $("#titleId");
        }
    }, 1000);
});
var publicData = {
    realTimer: {},
    pollingIntervals: 10000
};

function InitializePage() {
    setTimeout(getLatestData, 1000);

    
}
function getLatestData() {
    //var m_MsgData;
    var dataToServer = {
        organizationId: "",
        sceneName: ""
    };
    var urlString = "zc_nxjc_byc_byf_cementmill01.aspx/GetRealTimeData";
    $.ajax({
        type: "POST",
        url: urlString,
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            serviceSuccessful(data);
        }
    });
}

function serviceSuccessful(resultObject) {
    displayScene(resultObject.d);
    setupTimerToPollLatestData();
}
function setupTimerToPollLatestData() {
    // 设置获取最新数据定时器
    clearTimeout(publicData.realTimer);
    publicData.realTimer = setTimeout(
        function () {
            getLatestData();
        }, publicData.pollingIntervals);
}
function displayScene(scene) {
    // 显示监控画面参数
    // $("#sceneName").html(scene.Name);
    var datetime = $.jsonDateToDateTime(scene.time);
    $("#timestamp").html(datetime);

    // 显示数据项
    displayDataItem(scene.DataSet);
}
function displayDataItem(dataSets) {
    $.each(dataSets, function (i, item) {
        var value = Number(item.Value)
        var element = $(document.getElementById(item.ID));
        //if (element.attr("tagName") == "span")
            element.html(value.toFixed(0));
        //else
            element.val(value.toFixed(0));
    });
}

