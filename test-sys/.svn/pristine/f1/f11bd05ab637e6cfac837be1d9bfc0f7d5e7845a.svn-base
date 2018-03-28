<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="comNavConPart">
    <strong>考试情况</strong>
    <div class="listNavCon" style="border: none;">
        <div class="dataSearch">
            <div>
                <%--<a href="javascript:void(0)"></a>--%>
                <span class="yearTxt">
									<i id="nowYear">【2018】</i>年
								</span>
                <%--<a class="nextYear" href="javascript:void(0)"></a>--%>
            </div>
        </div>
        <div class="echartsDiv clearfix">
            <%--  折线图  --%>
            <div id="BrokenlineDiv" style="width: 450px;height: 300px;z-index: 100;">

            </div>
            <%--  圆形图  --%>
            <div id="circular" style="width: 400px;height: 300px;float: right;margin-top: -300px;">

            </div>
            <%--<img src="${pageContext.request.contextPath}/web/module/personalCen/image/test.png"
                 class="fl"/>
            <img src="${pageContext.request.contextPath}/web/module/personalCen/image/test1.png"
                 class="fl" style="margin-left:100px;"/>--%>
        </div>
    </div>
</div>

<!-- 我的考试 -->
<%-- <div class="comNavConPart">
    <strong>即将开始的考试</strong>
    <div class="listNavCon">
        <ul class="headNavCon clearfix">
            <li class="oneLiWid">考试名称</li>
            <li class="oneLiWid">试卷名称</li>
            <li class="oneLiWid">考试时间</li>
            <li class="twoLiWid">考试时长</li>
            <li class="threeLiWid">详情</li>
        </ul>
        <ul class="mainListCon clearfix">
            <c:forEach items="${examList}" var="exam">
                <li>
                    <p class="oneLiWid ellip">${exam.exam_name}</p>
                    <p class="oneLiWid ellip">${paperCreat.paperName}</p>
                    <p class="oneLiWid">${exam.start_time}</p>
                    <p class="twoLiWid">${exam.setExamTime}分钟</p>
                    <p class="threeLiWid">
                        <a href="javascript:lookDetail(1)">查看</a>
                    </p>
                </li> 
            </c:forEach>
        </ul>
    </div>
</div> --%>

<!-- 我的补考 -->
<%--<div class="comNavConPart">
    <strong>我的补考</strong>
    <div class="listNavCon">
        <ul class="headNavCon clearfix">
            <li class="oneLiWid">考试名称</li>
            <li class="oneLiWid">考试时间</li>
            <li class="twoLiWid">考试时长</li>
            <li class="threeLiWid">详情</li>
        </ul>
        <ul class="mainListCon clearfix">
            <li>
                <p class="oneLiWid ellip">开年考试1（开卷考试）</p>
                <p class="oneLiWid">2017-12-10 10:10:00</p>
                <p class="twoLiWid">150分钟</p>
                <p class="threeLiWid">
                    <a href="javascript:void(0)">查看</a>
                </p>
            </li>

        </ul>
    </div>
</div>--%>
<script>
    //折线图
    $(function(){
        var myChart = echarts.init(document.getElementById('BrokenlineDiv'));

        var monthList =  "${monthList}";
        monthList = eval('('+monthList+')');//日期
        var fenList = '${fenList}';//分数
        fenList = eval('('+fenList+')');
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        option = {
            color: colors,

            tooltip: {
                trigger: 'none',
                axisPointer: {
                    type: 'cross'
                }
            },
            legend: {
                data:['2015 降水量', '2016 降水量']
            },
            grid: {
                top: 70,
                bottom: 50
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLine: {
                        onZero: false,
                        lineStyle: {
                            color: colors[0]
                        }
                    },
                    axisPointer: {
                        label: {
                            formatter: function (params) {
                                return '考试分数  ' + params.value
                                    + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                            }
                        }
                    },
                    data:monthList /*["2017-2", "2017-3", "2017-4", "2017-5", "2017-6", "2017-7", "2017-8", "2017-9", "2017-10", "2017-11", "2017-12","2018-1"]*/
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name:'2017 考试情况',
                    type:'line',
                    smooth: true,
                    data: fenList/*[50, 60, 79.5, 80, 100, 60, 80, 78.6, 89.4, 57.4, 76.3, 77]*/
                }
            ]
        };

        myChart.setOption(option);
    })

    /*圆形图js*/
    $(function(){
        var myChart = echarts.init(document.getElementById('circular'));
        var Piechart = "${Piechart}";
        Piechart = eval('(['+Piechart+'])');
        option = {
            title : {
                text: '个人答题正确错误率',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left'
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '50%',
                    center: ['50%', '60%'],
                    data:Piechart/*[
                        {value:30, name:'错误率 30%'},
                        {value:70, name:'正确率 70%'}
                    ]*/,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: '#FFB6C1'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);
    })


</script>