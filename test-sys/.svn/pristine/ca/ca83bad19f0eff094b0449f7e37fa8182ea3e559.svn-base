//添加
function addDisrelationship() {
    var page = $("#DisrelationshipPage").val();
    edit("PaperCreatController/addBefore.htm",
        "addDisrelationshipForm",
        "PaperCreatController/add.htm",
        "添加试卷",
        "PaperCreatController/getList.htm",
        '试卷管理');
}

//查看试卷试题
function chakan(paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/getPaperQuer.htm?paperCreatId=" + paperCreatId,
        success: function (html) {
            $("#mainContent").html(html);
        }
    })

}

//查看试卷详情
function chakanxianqing(paperCreatId, page) {

    $.ajax({
        type: "post",
        url: "PaperCreatController/getPaperDetail.htm?paperCreatId=" + paperCreatId + "&page=" + page,
        success: function (html) {
            $("#mainContent").html(html);
        }

    })


}

//查看试卷详情返回
function returnPaperCreatList(page) {

    $.ajax({
        type: "post",
        url: "PaperCreatController/getList.htm?page=" + page,
        success: function (html) {
            $("#mainContent").html(html);
        }
    })

}


//根据条件查找
function searchItem() {
    var name = $("#searchPaper").val();
    $.ajax({
        type: "post",
        url: "PaperCreatController/getList.htm",
        data: {name: name},
        success: function (html) {
            $("#mainContent").html(html);
        },
        error: function () {
            layer.msg("查询失败");
        }

    })

}


//查看试题详情
function xiangqing(questionId, page) {
    $.ajax({
        type: "post",
        url: "QuestionsController/getDetail.htm",
        data: {id: questionId, page: page},
        success: function (html) {
            $("#mainContent").html(html);
        }
    })
}

//返回试题列表
function fanhuiliebaio(page) {
    $("#mainContent").load("PaperCreatController/getQuestionDetila.htm?page=" + page);

}


//去添加试题
function addQuestion(paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/toQuestList.htm",
        data: {paperCreatId: paperCreatId},
        success: function (html) {
            $("#mainContent").html(html);
        }
    })
}


//在添加试题页面查看试题详情
function toxiangqing(questionsId, paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/toQuestListDetail.htm",
        data: {id: questionsId, paperCreatId: paperCreatId},
        success: function (html) {
            $("#mainContent").html(html);
        }
    })
}

//从试题详情返回添加试题页面
function toquestionsLists(paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/toQuestList.htm",
        data: {paperCreatId: paperCreatId},
        success: function (html) {
            $("#mainContent").html(html);
        }
    })
}

//从添加页面点击添加，添加试题之后返回试卷试题页面
function addquertion(paperCreatId) {
    /*$.ajax({
        type:"post",
        url:"PaperCreatController/getPaperQuer.htm?paperCreatId="+paperCreatId,
        success:function(html){
            layer.msg("添加成功");
            $("#mainContent").html(html);
        }

    })*/

    var danxuanNums = $("#danxuanNums").val();
    var duoxianNums = $("#duoxianNums").val();
    var panduanNums = $("#panduanNums").val();
    var paperTotail = $("#paperTotail").val();

    /*if(danxuanNums<=0){
        layer.msg("单选题已够，请不要再添加");
        return;
    }
    if(duoxianNums<=0){
        layer.msg("多选题已够，请不要再添加");
        return;
    }
    if(panduanNums<=0){
        layer.msg("判断题已够，请不要再添加");
        return;
    }*/


    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });

    if (ids == "-1") {
        layer.msg("请选择要添加的试题");
        return;
    }

    /*layer.confirm("确认添加吗?",function(index){*/


    $.ajax({
        method: 'post',
        url: 'PaperCreatController/addQuestions.htm',
        data: {
            ids: ids,
            paperCreatId: paperCreatId,
            danxuanNums: danxuanNums,
            duoxianNums: duoxianNums,
            panduanNums: panduanNums,
            paperTotail: paperTotail
        },
        success: function (data) {

            data = eval("(" + data + ")");
            if (data.result == 'true') {
                layer.msg("添加成功");
                $.ajax({
                    type: "post",
                    url: "PaperCreatController/getPaperQuer.htm?paperCreatId=" + data.paperCreatId,
                    success: function (html) {
                        $("#mainContent").html(html);
                    },
                    error: function () {
                        layer.msg("获取数据失败");
                    }
                })
            }
            if (data.result == 'false') {
                alert(data.sbf + "请修改添加数量")

            }
        }
    })
    /* });*/


}


//从试题返回试卷试题页面
function fanhuiDaoPaper(paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/getPaperQuer.htm?paperCreatId=" + paperCreatId,
        success: function (html) {

            $("#mainContent").html(html);
        }

    })
}


//试卷试题返回试卷
function fanhuiPaper() {
    ajaxLoad("PaperCreatController/getList.htm");
}


function pds(data) {
    $("#quesIds").find("option").remove();
    $("#quesIds").append('<option>--请选择分类--</option>');

    $.ajax({
        url: "PaperCreatController/PaperTypeList.htm?insId=" + data,
        success: function (data) {
            var data = eval("(" + data + ")");

            for (var i = 0; i < data.length; i++) {
                $("#quesIds").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>")
            }

        }
    });

}


function delDisRate(paperCreatId) {
    var page = $("#disRatePage").val();
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });
    if (ids == "-1") {
        layer.msg("请选择数据");
        return;
    }
    layer.confirm("确认删除吗?", function (index) {
        $.ajax({
            method: 'post',
            url: 'PaperCreatController/deleteQuestion.htm',
            data: {ids: ids, page: page, paperCreatId: paperCreatId},
            success: function (html) {
                layer.close(index);
                layer.msg("删除成功");
                $("#mainContent").html(html);

            }
        })

    });


}

function delDisrelationship() {
   
	var page = $("#DisrelationshipPage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    var ids = $(checks[0]).val();
   
   /* var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });*/
    
   /* if (ids == "-1") {
        layer.msg("请选择数据");
        return;
    }*/
    $.ajax({
    	type:"post",
    	url:"PaperCreatController/deleteBefor.htm",
    	data:{ids:ids},
    	success:function(datas){
    		//为true则可以删除，为false则不能删除
    		datas=eval("("+datas+")");
    		
    		if(datas.result==true){
    			layer.confirm("确认删除吗?", function (index) {
    		        $.ajax({
    		            method: 'post',
    		            url: 'PaperCreatController/delete.htm',
    		            data: {ids: ids, page: page},
    		            success: function (data) {
    		                layer.msg("删除成功");
    		            	loadHtml(data);
    		                layer.close(index)
    		            }
    		        })
    		    });
    		}else if(datas.result==false){
    			layer.msg("该试卷以绑定考试，不能删除，若删除，请先删除对应的考试");
    			
    		}
    	}
    	
    })
    
    
}

//试题设置
function paperSet(page) {
    var checks = $(".table input:checked");
    if (checks.length != 1) {
        layer.msg("请选择一条数据");
        return;
    }
    var checks = $(checks[0]).val();
    paperId = checks;
    setTimeout(function () {
        console.log("resluts::" + $("#results").val());
    }, 1500);
    jixu(checks, page);
}

var layerFlag = false;

function jixu(checks, page) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/setPaper.htm?paperCreatId=" + checks + "&page=" + page,
        success: function (html) {
            layer.open({
                type: 1,
                title: "试题设置",
                skin: 'layui-layer-rim',//加上边框
                area: ['900px', '500px'],//宽高
                btn: ['确定', '取消'],
                yes: function (index) {
                    var paperCreatId = $("#paperCreatId").val();
                    var res = $("#results").val();
                    var page = $("#fenye").val();
                    var isSets = $("#isSets").val();
                    if (res == 'true') {
                        setSave(page, res, paperCreatId, isSets);
                    } else {
                        console.log(res + "修改试卷设置")
                        updatePaperSet(page, res, paperCreatId, isSets);
                    }
                    console.log(layerFlag + "dianjide")
                    if (layerFlag) {
                        setTimeout(function () {
                            layer.close(index);
                        }, 2000);
                    }

                },
                content: html,
            })
        }


    })


}


//试卷设置添加保存
function setSave(page, res, paperCreatId, isSets) {
    saveTest(page, res, paperCreatId, isSets);
}

//试卷设置修改保存
function updatePaperSet(page, res, paperCreatId, isSets) {
    console.log("修改试卷设置")
    saveTest(page, res, paperCreatId, isSets);
}


//修改
function updateDisrelationship() {
    
	
	var page = $("#DisrelationshipPage").val();
    var checks = $(".table input:checked");
    if (checks.length != 1) {
        layer.msg("请选择一条数据");
        return;
    }
    edit('PaperCreatController/updateBefore.htm?id=' + $(checks[0]).val(),
        "editDisrelationshipForm",
        "PaperCreatController/update.htm?page=" + page,
        "修改试卷",
        "PaperCreatController/getList.htm?page=" + page,
        '试卷管理');
}

//返回到试卷
function fanhuiDaoshijuan() {
    $.ajax({
        type: "post",
        url: "PaperCreatController/getList.htm",
        success: function (html) {

            $("#mainContent").html(html);

        }

    })

}


function searchQuesByType(paperCreatId, page) {
    var typeId = $("#typeId").val();
    $.ajax({
        type: 'post',
        url: "PaperCreatController/getPaperQuer.htm",
        data: {
            typeId: typeId,
            paperCreatId:
            paperCreatId, page: page
        },
        success: function (html) {
            $("#mainContent").html(html);
        },
        error: function () {
            alert("网络错误,请稍后再试");
        }
    })


}

//预览
function yulan(paperCreatId, sets) {

    $.ajax({
        type: "post",
        url: "PaperCreatController/yulan.htm?paperCreatId=" + paperCreatId,
        success: function (data) {

            data = eval("(" + data + ")");
            if (data.result == false) {
                alert("请先进行试题设置");
                return;
            }

            var orgId = data.orgId;

            var idhave = data.idhave;
            if (idhave == false) {
                alert("本试卷没有试题，请去添加试题");
            }
            window.open("PaperCreatController/yulanBegin.htm?orgId=" + orgId + "&paperCreatId=" + paperCreatId + "&sets=" + sets);

        }
    })


}


//打印试题
function dayin(paperCreatId) {
    $.ajax({
        type: "post",
        url: "PaperCreatController/isSets.htm?paperCreatId=" + paperCreatId,
        success: function (data) {

            data = eval("(" + data + ")");


            if (data.result == false) {
                alert("请先进行试题设置");
                return;
            }
            if (data.isSetss == 'shoudong') {
                if (data.haveTest == 'no') {
                    alert("暂无试题，请添加试题");
                    return;
                }
            }
            window.location.href = "PaperCreatController/brothWorld.htm?paperCreatId=" + paperCreatId;

        }


    })


}

//上级
function superior(userId, cmd) {
    var url;
    if (cmd == 1) {
        url = 'disrelationship/superior.htm';
    } else {
        url = 'disrelationship/subordinate.htm';
    }
    $.ajax({
        type: 'post',
        url: url,
        data: {
            id: userId
        },
        success: function (data) {
            loadHtml(data);
        },
        error: function () {
            alert("网络错误,请稍后再试");
        }
    })

}

//自动试题设置下增加tr
function addNewTr() {
    var strTrTd = "";
    strTrTd += "<tr class='createTr'>";
    strTrTd += "<td class='menuTd'><input type='text' class='selQues' readonly /><span class='triSpan'></span></td>";//下拉树形
    strTrTd += "<td><input type='text' disabled onblur=checkPattern(this,'calScore') class='quesInpNum singleInp'/><span>道</span><em type='singEm'></em></td>";//单选题个数
    strTrTd += "<td><input type='text' disabled onblur=checkPattern(this,'calScore') class='quesInpNum multiInp'/><span>道</span><em type='multiEm'></em></td>";//多选题个数
    strTrTd += "<td><input type='text' disabled onblur=checkPattern(this,'calScore') class='quesInpNum judgeInp'/><span>道</span><em type='judgeEm'></em></td>";//判断题个数
    strTrTd += "<td class='specTd' onclick='clearQuesTr(this)'><i class='delIcon'></i></td>";//删除
    strTrTd += "</tr>";
    $("#listQuesTable").append(strTrTd);
}

var obj = null;

function showTreeMenu() {
    $(document).on('click', ".menuTd", function () {
        obj = this;
        var index = $(this).parents("tr").index();
        $("#menuContent").show().css({"top": $(obj).innerHeight() * (index + 1) + $(".tHdHei").innerHeight()});
        $(document).bind("mousedown", onBodyDown);
    })
}

var setting3 = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "pid",
            rootPId: 0
        }
    }, callback: {
        onClick: function (event, treeId, treeNode) {
            $(obj).find("input").attr("id", treeNode.id).val(treeNode.name);
            var treeNodeId = treeNode.id;
            $.ajax({
                type: "post",
                url: "PaperCreatController/getTypeQuestionsNum.htm",
                data: {quesTypeId: treeNodeId},
                success: function (data) {
                    var newData = eval("(" + data + ")");
                    var otherTd = $(obj).siblings();
                    $(obj).siblings().each(function (i) {
                        $(obj).siblings().find("input").attr("disabled", false);
                        var type = $(obj).siblings().eq(i).find("em").attr("type");
                        var nowEm = $(obj).siblings().eq(i).find("em");
                        if (type == "singEm") {
                            nowEm.html("共<i>" + newData.typeDanxuanNum + "</i>道");
                        } else if (type == "multiEm") {
                            nowEm.html("共<i>" + newData.typeDuoxuanNum + "</i>道");
                        } else {
                            nowEm.html("共<i>" + newData.typePanduanNum + "</i>道");
                        }
                    });
                }
            });
            hideMenu();
        }
    }
};

function checkPattern(obj, options) {
    var lenEm = $(obj).parent().find("em");
    var emHtml = $(obj).parent().find("em i").html();
    if ($(obj).val() == "") {
        $(obj).val(0);
        //layer.msg("当前设置不能为空",{timer:1000});
        //$("#totalSpan").html("");
        //return;
    } else {
        if (lenEm.length > 0 && Number($(obj).val()) > Number(emHtml)) {
            layer.msg("设置题数不能大于总共题数", {timer: 1500});
            $(obj).val("")
            $("#totalSpan").html("");
            return;
        }
        $(obj).val($(obj).val().replace(/\D/g, ''));
        if (options == "calScore") {//计算总分值
            calTotalScore();
        }
    }
}

//计算总分数
function calTotalScore() {
    var singleVal = $("#singScoreInp").val();
    var multiVal = $("#multiScoreInp").val();
    var judgeVal = $("#judgeScoreInp").val();
    var totalSingNum = 0;
    var totalMultiNum = 0;
    var totalJudgeNum = 0;
    var totalScore = 0;

    if ($("#isSets").val() == 0) {//自动
        if (singleVal == "" || multiVal == "" || judgeVal == "") {
            $("#totalSpan").html("");
            return;
        }
        $(".singleInp").each(function (i) {//单选题个数
            if ($(".singleInp").eq(i).val() != "") {
                totalSingNum += parseInt($(".singleInp").eq(i).val());
            } else {
                $("#totalSpan").html("");
                return;
            }
        });
        $(".multiInp").each(function (i) {//多选题个数
            if ($(".multiInp").eq(i).val() != "") {
                totalMultiNum += parseInt($(".multiInp").eq(i).val());
            } else {
                $("#totalSpan").html("");
                return;
            }

        });
        $(".judgeInp").each(function (i) {//判断题个数
            if ($(".judgeInp").eq(i).val() != "") {
                totalJudgeNum += parseInt($(".judgeInp").eq(i).val());
            } else {
                $("#totalSpan").html("");
                return;
            }
        });
        totalScore = parseInt((totalSingNum * singleVal) + (totalMultiNum * multiVal) + (totalJudgeNum * judgeVal));
    } else {//手动
        totalScore = parseInt((hander_sing * singleVal) + (hander_multi * multiVal) + (hander_judge * judgeVal));
    }

    $("#paperTotail").val(totalScore);
    $("#totalSpan").html("共计<em id='totalScoreEm' style='font-style:normal;'>" + totalScore + "</em>分");
}

//设置达标分数线
function setTotalScore(obj) {
    if ($("#totalScoreEm").length > 0) {
        if ($(obj).val() > Number($("#totalScoreEm").html())) {
            layer.msg("达标分数线不能高于总分数", {time: 1000});
            return;
        }
        $(obj).val($(obj).val().replace(/\D/g, ''));
    }

}

function hideMenu() {
    $("#menuContent").css({display: "none"});
    $(document).unbind("mousedown", onBodyDown);
}

function onBodyDown(event) {
    if (!(event.target.id == "quesSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
        hideMenu();
    }
}

//删除产品
function clearQuesTr(obj) {
    $(obj).parent().remove();
    calTotalScore();
}

var paperId;

function saveTest(page, res, paperCreatId, isSets) {
    //isSets=0 自动 为1手动
    var isAutoFlag = true;
    if (isSets == 0 && isAutoFlag) {
        var paperids = "";
        var allMeunFlag = true;
        var oneslects = "";
        var allSingleFlag = true;
        var towslects = "";
        var allMultiFlag = true;
        var judges = "";
        var allJudgeFlag = true;
    }
    var singScoreInpVal = $("#singScoreInp").val();
    var multiScoreInpVal = $("#multiScoreInp").val();
    var judgeScoreInpVal = $("#judgeScoreInp").val();
    var scoreInpVal = $("#scoreInp").val();
    var examTimeVal = $("#examTime").val();
    var examUseVal = $("#examUse").val();
    if (isSets == 0 && isAutoFlag) {
        $(".selQues").each(function (i) {
            if ($(".selQues").eq(i).val() == "") {
                allMeunFlag = false;
                return;
            }
            if ($(".selQues").length == 1) {
                paperids = $(".selQues").eq(i).attr("id");

            } else {
                paperids += $(".selQues").eq(i).attr("id") + ",";
            }
        });

        $(".singleInp").each(function (i) {
            if ($(".singleInp").eq(i).val() == "" || $(".singleInp").eq(i).val() < 0) {
                $(".singleInp").eq(i).val(0)
                allSingleFlag = true;
                //return;
            }
            if ($(".singleInp").length == 1) {
                oneslects = $(".singleInp").eq(i).val();
            } else {
                oneslects += $(".singleInp").eq(i).val() + ",";
            }
        });
        $(".multiInp").each(function (i) {
            if ($(".multiInp").eq(i).val() == "" || $(".multiInp").eq(i).val() < 0) {
                $(".multiInp").eq(i).val(0)
                allMultiFlag = true;
                //return;
            }
            if ($(".multiInp").length == 1) {
                towslects = $(".multiInp").eq(i).val();
            } else {
                towslects += $(".multiInp").eq(i).val() + ",";
            }
        });
        $(".judgeInp").each(function (i) {
            if ($(".judgeInp").eq(i).val() == "" || $(".judgeInp").eq(i).val() < 0) {
                $(".judgeInp").eq(i).val(0)
                allJudgeFlag = true;
                //return;
            }
            if ($(".judgeInp").length == 1) {
                judges = $(".judgeInp").eq(i).val();
            } else {
                judges += $(".judgeInp").eq(i).val() + ",";
            }
        });
        if (!allMeunFlag) {
            layer.msg("树形菜单不能为空");
            layerFlag = false;
        } else if (!allSingleFlag) {
            layer.msg("请填写完整您要设置的单选题个数");
            layerFlag = false;
        } else if (!allMultiFlag) {
            layer.msg("请填写完整您要设置的多选题个数");
            layerFlag = false;
        } else if (!allJudgeFlag) {
            layer.msg("请填写完整您要设置的判断题个数");
            layerFlag = false;
        }
    }
    if (isSets == 0 && allMeunFlag && allMultiFlag && allSingleFlag && allJudgeFlag || isSets == 1) {//单选多选判断都填了开始走下一步
        isAutoFlag = false;
    }
    if (!isAutoFlag) {
        if (singScoreInpVal == "") {
            layer.msg("单选题分值设置不能为空");
            layerFlag = false;
            return;
        } else if (multiScoreInpVal == "") {
            layer.msg("多选题分值设置不能为空");
            layerFlag = false;
            return;
        } else if (judgeScoreInpVal == "") {
            layer.msg("判断题分值设置不能为空");
            layerFlag = false;
            return;
        } else if (scoreInpVal == "") {
            layer.msg("达标分数线设置不能为空");
            layerFlag = false;
            return;
        } else if (examTimeVal == "") {
            layer.msg("考试时间限制不能为空");
            layerFlag = false;
            return;
        } else if (examUseVal == "") {
            layer.msg("允许考试次数设置不能为空");
            layerFlag = false;
            return;
        } else {
            var totalSingNum = 0;
            var totalMultiNum = 0;
            var totalJudgeNum = 0;
            if (isSets == 0) {
                if ($(".createTr").length == 0) {
                    paperids = paperids;
                    oneslects = oneslects;
                    towslects = towslects;
                    console.log("twoSelexts:" + towslects)
                    judges = judges;
                } else {
                    paperids = paperids.substring(0, paperids.length - 1);
                    oneslects = oneslects.substring(0, oneslects.length - 1);
                    towslects = towslects.substring(0, towslects.length - 1);
                    console.log("twoSelextssssss:" + towslects)
                    judges = judges.substring(0, judges.length - 1);
                }

                $(".singleInp").each(function (i) {
                    totalSingNum += parseInt($(".singleInp").eq(i).val());
                });
                $(".multiInp").each(function (i) {
                    totalMultiNum += parseInt($(".multiInp").eq(i).val());
                });
                $(".judgeInp").each(function (i) {
                    totalJudgeNum += parseInt($(".judgeInp").eq(i).val());
                });
                console.log($("#setPaperid").val() + "------" + res + "res---" + "--" + paperCreatId + "isSet--" + isSets + "-----Nan??" + paperCreatId + "--" + paperId + "--paperids:::" + paperids + "--" + oneslects + "--" + towslects + "--" + judges + "--" + singScoreInpVal + "--" + multiScoreInpVal + "--" + judgeScoreInpVal + "--" + scoreInpVal + "--" + examTimeVal + "--" + examUseVal)
            } else {
                totalSingNum = hander_sing;
                totalMultiNum = hander_multi;
                totalJudgeNum = hander_judge;
                console.log($("#setPaperid").val() + "-----" + res + "res---" + "--" + paperCreatId + "isSet--" + isSets + "-----Nan??" + paperCreatId + "--" + paperId + "--" + singScoreInpVal + "--" + multiScoreInpVal + "--" + judgeScoreInpVal + "--" + scoreInpVal + "--" + examTimeVal + "--" + examUseVal)
            }
            if (confirm("本套试卷共有单选题" + totalSingNum + "道，多选题" + totalMultiNum + "道，判断题" + totalJudgeNum + "道，确定要添加试卷吗？")) {
                layerFlag = true;
                $.ajax({
                    type: 'post',
                    url: "PaperCreatController/addPaperSet.htm",
                    data: {
                        paperId: paperId,
                        paperids: paperids,
                        oneslects: oneslects,
                        towslects: towslects,
                        judges: judges,
                        attr6: singScoreInpVal,
                        attr7: multiScoreInpVal,
                        attr8: judgeScoreInpVal,
                        paperLine: scoreInpVal,
                        examTime: examTimeVal,
                        examUse: examUseVal,
                        res: res,
                        paperCreatId: paperCreatId,
                        isSets: isSets,
                        id: $("#setPaperid").val(),
                        paperTotail:$("#paperTotail").val()
                    },
                    success: function (data) {
                        console.log("chegngongle??")
                        if (res == "true") {
                            console.log(res + "----------------")
                            layer.msg("添加成功", {time: 1500});
                        } else {
                            console.log(res + "-修改---------------")
                            layer.msg("修改成功", {time: 1500});
                        }
                        $("#mainContent").html(data);
                    }
                });
            } else {
                layerFlag = false;
                return false;
            }
        }
    }
}
