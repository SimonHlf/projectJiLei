<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户统计</title>
    <meta charset="UTF-8">
    <base href="${basePath}admin/">
    <%--<link rel="stylesheet" href="../web/layui-v2.2.45/layui/css/layui.css">--%>
    <style>
        th .layui-table-cell{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="main" style="height: 250px; width: 99%;"></div>
<div id="toolbar" class="btn-group" style="width: 100%">
    <div style="margin-left: 5px">
        <form id="searchForm" class="form-horizontal search-form">
            <div class="form-group" style="margin-left: 0;margin-right: 0;margin-bottom:0;margin-top: 5px!important">
                <div class="col-sm-2">
                    <select type="text" class="form-control" id="type">
                        <option value="month">按月查询</option>
                        <option value="year">按年查询</option>
                        <option value="custom-month">自定义时间段</option>
                    </select>
                </div>
                <div class="col-sm-3" id="month1d">
                    <input type="text" class="form-control" id="month1" title="请选择日期" placeholder="请选择日期"
                           value="${month}" onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true,maxDate:'%y-%M'})">
                </div>
                <div id="month2d" style="display: none"><span style="float: left;line-height: 30px">至</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="month2" title="请选择日期" placeholder="请选择日期"
                               value="${month}"
                               onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true,maxDate:'%y-%M'})">
                    </div>
                </div>
                <div class="col-sm-3" id="yeard" style="display: none">
                    <input type="text" class="form-control" id="year" title="请选择日期" placeholder="请选择日期"
                           value="${year}" onfocus="WdatePicker({dateFmt:'yyyy',readOnly:true,maxDate:'%y'})">
                </div>
                <div class="col-sm-2">
                    <a class="btn btn-info" id="search-btn">
                        <i class="fa fa-search"></i> 查询
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>
<table id="datatable" lay-filter="test"></table>
<script type="text/javascript" src="assets/echarts/echarts.min.js"></script>
<script type="text/javascript" src="assets/js/My97DatePicker/WdatePicker.js"></script>
<%--<script type="text/javascript" src="../web/layui-v2.2.45/layui/layui.js"></script>--%>
<script>
    var queryParam = {
        type: 'month',
        startTime: '${month}',
        endTime: '${month}',
    };
    $(function () {
        //初始化echarts
        var myChart = echarts.init(document.getElementById("main"));
        //指定图表的配置项和数据
        var option = {
            title: {
                text: '用户统计',
                left: 'center'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                // x: '55%',
                data: ['注册认数']
            },
            grid: {
                x: 60,
                y: 55,
                x2: 20,
                y2: 30
            },
            toolbox: {
                show: true,
                feature: {
                    /* dataZoom: {
                         yAxisIndex: 'none'
                     },*/
                    dataView: {
                        readOnly: false
                    },
                    magicType: {
                        type: ['line', 'bar']
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                name: '日期',
                boundaryGap: true,
                data: ['2019']
            },
            yAxis: [{
                type: 'value',
                name: '注册人数',
                min: 0,
                interval: 200,
                axisLabel: {
                    formatter: '{value}'
                }
            }],
            series: [
                {
                    name: '注册人数',
                    type: 'bar',
                    data: [837]
                }
            ]
        };
        var table;
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#datatable',
                height: 315,
                url: 'analysis/user/queryList.htm', //数据接口
                page: false, //开启分页
                cols: [[ //表头
                    {field: 'time', title: '日期', width: '50%'},
                    {field: 'count', title: '注册人数', width: '50%'}
                ]],
                where: queryParam,
                id: 'idTest',
                done: function (data) {
                    var d = data.data;
                    myChart.hideLoading();
                    myChart.clear();
                    if (!d || d.length == 0) {
                        myChart.showLoading({
                            text: '暂无数据',
                            effect: 'whirling',
                            textStyle: {
                                fontSize: 20
                            }
                        });
                    }
                    var dataArray = [];
                    var timeArray = [];
                    for (var i = 0; i < d.length; i++) {
                        dataArray.push(d[i].count);
                        timeArray.push(d[i].time)
                    }
                    option.xAxis.data = timeArray;
                    option.series[0].data = dataArray;
                    myChart.setOption(option)
                }
            });
        });

        $('#type').change(function () {
            var v = this.value;
            queryParam.type = v;
            if (v === 'year') {
                $('#yeard').css("display", '');
                $('#month1d').css("display", 'none');
                $('#month2d').css("display", 'none');
                queryParam.startTime = $('#year').val()
            } else if (v === 'month') {
                $('#yeard').css("display", 'none');
                $('#month1d').css("display", '');
                $('#month2d').css("display", 'none');
                queryParam.startTime = $('#month1').val();
                queryParam.endTime = $('#month2').val()
            } else if (v === 'custom-month') {
                $('#yeard').css("display", 'none');
                $('#month1d').css("display", '');
                $('#month2d').css("display", '');
                queryParam.startTime = $('#month1').val();
                queryParam.endTime = $('#month2').val()
            }
        });

        $('#search-btn').click(function () {
            $('#type').trigger('change');
            if (queryParam.type === 'custom-month'
                && queryParam.startTime > queryParam.endTime) {
                layer.msg("开始日期不能大于结束日期！");
                return false;
            }
            table.reload('idTest', {
                where: queryParam
            })
        });

        $(window).resize(function () {
            myChart.resize();
        });
    })
</script>
</body>
</html>
