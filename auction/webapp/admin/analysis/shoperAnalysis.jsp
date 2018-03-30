<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品销量</title>
</head>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin: 0">
    <ul class="layui-tab-title">
        <li class="layui-this">现金商品</li>
        <li>金币商品</li>
        <li>积分商品</li>
        <li>优乐购</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table class="layui-hide" id="gathermoneytable"></table>
            <table class="layui-hide" id="moneytable"></table>
        </div>
        <div class="layui-tab-item">
            <table class="layui-hide" id="gathergoldtable"></table>
            <table class="layui-hide" id="goldtable"></table>
        </div>
        <div class="layui-tab-item">
            <table class="layui-hide" id="gatherpointstable"></table>
            <table class="layui-hide" id="pointstable"></table>
        </div>
        <div class="layui-tab-item">
            <table class="layui-hide" id="gatheryouletable"></table>
            <table class="layui-hide" id="youletable"></table>
        </div>
    </div>
</div>
<script>
    var param = {moneyParam: {}, goldParam: {}, pointsParam: {},youleParam:{}};
    layui.use(['laypage', 'layer', 'element', 'table'], function () {
        var $ = layui.jquery
            , element = layui.element //Tab的切换功能，切换事件监听等，需要依赖element模块
            , laypage = layui.layui
            , table = layui.table;
        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44');
                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22');
            }
        };
        element.on('tab(docDemoTabBrief)', function (data) {
            switch (data.index) {
                case 0 :
                    table.reload('idTest');
                    break;
                case 1 :
                    table.reload('idTest2');
                    break;
                case 2 :
                    table.reload('idTest3');
                    break;
                case 3 :
                    table.reload('idTest4');
                    break;
            }
        });

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);
        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

        var moneyParam = param.moneyParam;
        moneyParam.proType = '1';
        table.render({
            elem: '#moneytable',
            height: 500,
            url: 'analysis/shoper/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'productName', title: '商品名称', width: 180, fixed: 'left'},
                {field: 'totalNum', title: '商品销量'},
                {field: 'totalPrice', title: '销售额', templet: '<div>{{formatter(d.totalPrice)}}</div>'},
                {field: 'account', title: '商家账号'},
            ]],
            where: moneyParam,
            id: 'idTest',
            done: function (data) {
                table.render({
                    elem: '#gathermoneytable',
                    data: data.gatherData, //数据接口
                    page: false,
                    cols: [[ //表头
                        {field: 'totalNum', title: '商品总量'},
                        {field: 'totalPrice', title: '销售总额', templet: '<div>{{formatter(d.totalPrice)}}</div>'},
                    ]],
                    id: 'gatherIdTest'
                });
            }
        });


        //金币商品
        var goldParam = param.goldParam;
        goldParam.proType = '2';
        table.render({
            elem: '#goldtable',
            height: 500,
            url: 'analysis/shoper/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'productName', title: '商品名称', width: 180, fixed: 'left'},
                {field: 'totalNum', title: '商品销量'},
                {field: 'totalPrice', title: '销售额'},
                {field: 'account', title: '商家账号'},
            ]],
            where: goldParam,
            id: 'idTest2',
            done: function (data) {
                table.render({
                    elem: '#gathergoldtable',
                    data: data.gatherData, //数据接口
                    page: false,
                    cols: [[ //表头
                        {field: 'totalNum', title: '商品总量'},
                        {field: 'totalPrice', title: '销售总额'},
                    ]],
                    id: 'gatherIdTest2'
                });
            }
        });

        //积分商品
        var pointsParam = param.pointsParam;
        pointsParam.proType = '3';
        table.render({
            elem: '#pointstable',
            height: 500,
            url: 'analysis/shoper/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'productName', title: '商品名称', width: 180, fixed: 'left'},
                {field: 'totalNum', title: '商品销量'},
                {field: 'totalPrice', title: '销售额'},
                {field: 'account', title: '商家账号'},
            ]],
            where: pointsParam,
            id: 'idTest3',
            done: function (data) {
                table.render({
                    elem: '#gatherpointstable',
                    data: data.gatherData, //数据接口
                    page: false,
                    cols: [[ //表头
                        {field: 'totalNum', title: '商品总量'},
                        {field: 'totalPrice', title: '销售总额'},
                    ]],
                    id: 'gatherIdTest3'
                });
            }
        });
        //优乐购商品
        var youleParam = param.youleParam;
        youleParam.proType = '4';
        table.render({
            elem: '#youletable',
            height: 500,
            url: 'analysis/shoper/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'productName', title: '商品名称', width: 180, fixed: 'left'},
                {field: 'totalNum', title: '商品销量'},
                {field: 'totalPrice', title: '销售额'},
                {field: 'account', title: '商家账号'},
            ]],
            where: youleParam,
            id: 'idTest4',
            done: function (data) {
                table.render({
                    elem: '#gatheryouletable',
                    data: data.gatherData, //数据接口
                    page: false,
                    cols: [[ //表头
                        {field: 'totalNum', title: '商品总量'},
                        {field: 'totalPrice', title: '销售总额'},
                    ]],
                    id: 'gatherIdTest4'
                });
            }
        });
    });

    //格式化金额，保留两位小数
    function formatter(value) {
        return Number(value).toFixed(2);
    }
    function formatter0(value) {
        return Number(value).toFixed(0);
    }
</script>
</body>
</html>
