$(function () {
    //var alermInterval= setInterval("alarmBlink()", 500);
    var blinkInterval= setInterval("initAlarm()", 4000);
    initAlarm();
});

function initAlarm(){
    initAlarmFlag();
    getRealtimeAlarmData();
}

function initAlarmFlag() {
    $(".alarmContainer").each(function (index, element) {
        $(this).attr("data-alarmFlag", "0");
    });
}

function getRealtimeAlarmData() {
    var urlString = "MonitorView.aspx/GetAlarmInfor";
    $.ajax({
        type: "POST",
        url: urlString,
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
            var mData = JSON.parse(data.d);
            displayAlarm(mData['rows']);
        },
        error:function(){
            displayAlarm('');
    }
    });
}

function displayAlarm(data) {
    setAlarmFlag(data);
    setMyImg();
}

function setAlarmFlag(data) {
    $.each(data, function (idx, obj) {
        var id = obj.OrganizationID + obj.Name;
        var item = document.getElementById(id);
        $(item).attr("data-alarmFlag", "1");
    });
}


function setMyImg() {
    //alert('');
    $(".alarmContainer").each(function (index, element) {
        var flag = $(this).attr("data-alarmFlag");
        if (0 == flag) {
            $(this).html('<img class="normal" src="/UI_Monitor/images/common/greenL.png" style="width:100%;height:100%;" />');
        }
        else {
            $(this).html('<img class="alarm" src="/UI_Monitor/images/common/redL.png" style="width:100%;height:100%;" />');
            setInterval("alarmBlink()", 500);
        }
    });    
}

function alarmBlink() {
    //闪烁
    $(".alarm").fadeIn(500).fadeOut(500);
    //$(".normal").fadeIn(500).fadeOut(500);
}