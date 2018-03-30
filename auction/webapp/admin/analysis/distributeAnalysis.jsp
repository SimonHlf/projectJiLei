<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分销统计</title>
    <style>
        th .layui-table-cell {
            text-align: center;
        }
    </style>
</head>
<body>
<table class="layui-hide" id="distributetable"></table>
<script>
    var param = {distributeParam: {}};
    var datatable;
    layui.use(['laypage', 'layer', 'element', 'table'], function () {
        var $ = layui.jquery
            , element = layui.element //Tab的切换功能，切换事件监听等，需要依赖element模块
            , laypage = layui.layui
            , table = layui.table;
        datatable = table;
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
            /*switch (data.index) {
                case 0 :
                    table.reload('idTest');
                    break;
                case 1 :
                    table.reload('idTest2');
                    break;
                case 2 :
                    table.reload('idTest3');
                    break;
            }*/
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

        var distributeParam = param.distributeParam;
        table.render({
            elem: '#distributetable',
            height: 500,
            url: 'analysis/distribute/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                // {field: 'nickName', title: '用户昵称', width: 120, fixed: 'left', rowspan: 2},
                {field: 'userAccount', title: '用户账号', width: 120, rowspan: 2, fixed: 'left'},
                {field: 'phone', title: '电话', width: 120, rowspan: 2},
                {field: 'childrenNum', title: '下线人数', width: 100, rowspan: 2, templet: '<div title="ffff">{{showChildren(d,0)}}</div>'},
                {align: 'center', title: '一级', colspan: 4},
                {align: 'center', title: '二级', colspan: 4},
                {align: 'center', title: '三级', colspan: 4}

            ], [
                {field: 'oneLevelNum', title: '人数', width: 80, templet: '<div>{{showChildren(d,1)}}</div>'},
                {field: 'oneLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.oneLevelMoney)}}</div>'},
                {field: 'oneLevelGold', title: '金币收益', width: 100},
                {field: 'oneLevelPoint', title: '积分收益', width: 100},
                {field: 'twoLevelNum', title: '人数', width: 80, templet: '<div>{{showChildren(d,2)}}</div>'},
                {field: 'twoLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.twoLevelMoney)}}</div>'},
                {field: 'twoLevelGold', title: '金币收益', width: 100},
                {field: 'twoLevelPoint', title: '积分收益', width: 100},
                {field: 'threeLevelNum', title: '人数', width: 80, templet: '<div>{{showChildren(d,3)}}</div>'},
                {field: 'threeLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.threeLevelMoney)}}</div>'},
                {field: 'threeLevelGold', title: '金币收益', width: 100},
                {field: 'threeLevelPoint', title: '积分收益', width: 100}
            ]],
            where: distributeParam,
            id: 'idTest',
            done: function (data) {

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

    //查询下线信息
    function showChildren(d, type) {
        console.log(d);
        var i;
        switch (type) {
            case 0 :
                i = d.childrenNum;
                break;
            case 1 :
                i = d.oneLevelNum;
                break;
            case 2 :
                i = d.twoLevelNum;
                break;
            case 3 :
                i = d.threeLevelNum;
                break;
        }
        return '<a href="javascript:showChildrenInfo(\'' + d.mark + '\',' + type + ')" title="点击查看下线信息">' + i + '</a>';
    }

    //查询下线信息
    function showChildrenInfo(pmark, type) {
        var title = '';
        switch (type) {
            case 0 :
                title = '所有下线信息';
                break;
            case 1 :
                title = '一级下线信息';
                break;
            case 2 :
                title = '二级下线信息';
                break;
            case 3 :
                title = '三级下线信息';
                break;
        }
        var w = $(window).width();
        var h = $(window).height();
        var table = '<table id="table1"></table>';
        var index = layer.open({
            type: 1,
            area: [w * 0.84 + 'px', h * 0.84 + 'px'],
            title: title,
            fixed: false,
            maxmin: false,
            scrollbar: false,
            content: table,
            btn: ['关闭']

        });
        datatable.render({
            elem: '#table1',
            height: h * 0.84 - 120,
            url: 'analysis/distribute/queryChildrenList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                // {field: 'nickName', title: '用户昵称', width: 120, fixed: 'left', rowspan: 2},
                {field: 'userAccount', title: '用户账号', width: 120, rowspan: 2, fixed: 'left'},
                {field: 'phone', title: '电话', width: 120, rowspan: 2},
                {field: 'childrenNum', title: '下线人数', width: 100, rowspan: 2},
                {align: 'center', title: '一级', colspan: 4},
                {align: 'center', title: '二级', colspan: 4},
                {align: 'center', title: '三级', colspan: 4}

            ], [
                {field: 'oneLevelNum', title: '人数', width: 80},
                {field: 'oneLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.oneLevelMoney)}}</div>'},
                {field: 'oneLevelGold', title: '金币收益', width: 100},
                {field: 'oneLevelPoint', title: '积分收益', width: 100},
                {field: 'twoLevelNum', title: '人数', width: 80},
                {field: 'twoLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.twoLevelMoney)}}</div>'},
                {field: 'twoLevelGold', title: '金币收益', width: 100},
                {field: 'twoLevelPoint', title: '积分收益', width: 100},
                {field: 'threeLevelNum', title: '人数', width: 80},
                {field: 'threeLevelMoney', title: '现金收益', width: 100, templet: '<div>{{formatter(d.threeLevelMoney)}}</div>'},
                {field: 'threeLevelGold', title: '金币收益', width: 100},
                {field: 'threeLevelPoint', title: '积分收益', width: 100}
            ]],
            where: {pmark: pmark, type: type},
            id: 'idTest1',
            done: function (data) {

            }
        });
    }
</script>
</body>
</html>
