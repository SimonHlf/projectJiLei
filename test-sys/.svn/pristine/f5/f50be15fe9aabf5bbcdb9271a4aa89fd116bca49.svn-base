//考试结果统计 和 应考未考
function testResults(cmd,url){
    var dropDown;
    var startTime;
    var endTime;
    if(cmd == 1){
        dropDown = $("#dropDown").val();
    } else {
        startTime = $("#startTime").val();
        endTime = $("#endTime").val();
        if(!startTime || !endTime){
            layer.msg("请选择开始结束时间");
            return;
        }
    }
    $.ajax({
        type:'post',
        url:url,
        data:{
            dropDown:dropDown,
            startTime:startTime,
            endTime:endTime,
            cmd:cmd
        },
        success:function(data){
            layer.msg("查询完成");
            loadHtml(data);
        },
        error:function(){
            alert("网络错误，请稍后再试");
        }
    })
}

//1应考 2实考 3未考 4及格 5不及格 mark 1考试   2统计
function TherealDetails(cmd,examId,mark){
    var msg = "";
    var currPage = mark == 1 ? $("#examPage").val():$("#thereaPage").val();
    if(cmd == 1){
        msg = "应考考生列表";
    } else if(cmd == 2){
        msg = "实考考生列表";
    } else if(cmd == 3) {
        msg = "未考考生列表";
    } else if(cmd == 4){
        msg = "及格考生列表";
    } else {
        msg = "不及格考生列表";
    }
    ajaxLoad("statistics/TherealDetails.htm?cmd="+cmd+"&examId="+examId+"&mark="+mark+"&currPage="+currPage,msg,this);
  /*  $.ajax({
        type:'post',
        url:'statistics/TherealDetails.htm',
        data:{
            cmd:cmd,
            examId:examId
        },
        success:function(data){
            layer.msg("加载完成");
            loadHtml(data);
        },
        error:function(){
            alert("网络错误，请稍后再试");
        }
    })*/

}

//导出统计列表
function importTherealTest(dropDown,startTime,endTime){
    window.location = "statistics/importTherealTest.htm?dropDown="+dropDown+"&startTime="+startTime+"&endTime="+endTime;
}

//导出实考人考试信息
function downloadHaveTheTest(examId){
    window.location = "statistics/downloadHaveTheTest.htm?examId="+examId;
}

//导出(及格/不及格)
function importPassOrFailExcel(cmd,examId){
    window.location = "statistics/importPassOrFailExcel.htm?cmd="+cmd+"&examId="+examId;
}

//导出应考人列表
function importShouldExamExcel(examId,cmd){
    window.location = "statistics/importShouldExamExcel.htm?examId="+examId+"&cmd="+cmd;
}

//导出未考人列表
function importNotestExamExcel(examId){
    window.location = "statistics/importNotestExamExcel.htm?examId="+examId;
}

//cmd 要跳转的页面 1为考试 2为统计
function LoadHtmlList(cmd,currPage){
    var url;
    var msg;
    if(cmd == 1){
        url = "ExaminationController/list.htm?page=";
        msg = "考试管理";
    } else {
        url = "statistics/therealTest.htm?page=";
        msg = "考试应考未考统计";
    }
    ajaxLoad(url+currPage,msg);
}

function examDetails(){

}