<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商户统计</title>
    <style>
        th .layui-table-cell{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin: 0">
    <ul class="layui-tab-title">
        <li class="layui-this">商家统计</li>
        <li>代理商</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table class="layui-hide" id="sellertable"></table>
        </div>
        <div class="layui-tab-item">
            <table class="layui-hide" id="goldtable"></table>
        </div>

    </div>
</div>
<script>
    var param = {sellerParam: {}, agentParam: {}};
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

        var sellerParam = param.sellerParam;
        table.render({
            elem: '#sellertable',
            height: 500,
            url: 'analysis/business/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'realName', title: '商家名称', width: 160, fixed: 'left', rowspan: 2},
                {field: 'productTotalCount', title: '商品总量', width: 100, rowspan: 2, templet: '<div>{{formatter0(d.productTotalCount)}}</div>'},
                {field: 'orderTotalCount', title: '订单总量', width: 100, rowspan: 2, templet: '<div>{{formatter0(d.orderTotalCount)}}</div>'},
                {align: 'center', title: '现金商品', colspan: 4},
                {align: 'center', title: '积分商品', colspan: 4},
                {align: 'center', title: '金币商品', colspan: 4},
                {align: 'center', title: '优乐购', colspan: 4}
            ], [
                {field: 'productMoneyCount', title: '商品总量', width: 100, templet: '<div>{{formatter0(d.productMoneyCount)}}</div>'},
                {field: 'productMoneyPrice', title: '商品总额', width: 100,templet: '<div>{{formatter(d.productMoneyPrice)}}</div>'},
                {field: 'orderMoneyCount', title: '订单总量', width: 100, templet: '<div>{{formatter0(d.orderMoneyCount)}}</div>'},
                {field: 'orderMoneyTotalAmount', title: '订单总额', width: 100, templet: '<div>{{formatter(d.orderMoneyTotalAmount)}}</div>'},
                {field: 'productPointCount', title: '商品总量', width: 100, templet: '<div>{{formatter0(d.productPointCount)}}</div>'},
                {field: 'productPointPrice', title: '商品总额', width: 100, templet: '<div>{{formatter0(d.productPointPrice)}}</div>'},
                {field: 'orderPointCount', title: '订单总量', width: 100, templet: '<div>{{formatter0(d.orderPointCount)}}</div>'},
                {field: 'orderPointTotalAmount', title: '订单总额', width: 100, templet: '<div>{{formatter0(d.orderPointTotalAmount)}}</div>'},
                {field: 'productGoldCount', title: '商品总量', width: 100, templet: '<div>{{formatter0(d.productGoldCount)}}</div>'},
                {field: 'productGoldPrice', title: '商品总额', width: 100, templet: '<div>{{formatter0(d.productGoldPrice)}}</div>'},
                {field: 'orderGoldCount', title: '订单总量', width: 100, templet: '<div>{{formatter0(d.orderGoldCount)}}</div>'},
                {field: 'orderGoldTotalAmount', title: '订单总额', width: 100, templet: '<div>{{formatter0(d.orderGoldTotalAmount)}}</div>'},
                {field: 'productYouleCount', title: '商品总量', width: 100, templet: '<div>{{formatter0(d.productYouleCount)}}</div>'},
                {field: 'productYoulePrice', title: '商品总额', width: 100, templet: '<div>{{formatter0(d.productYoulePrice)}}</div>'},
                {field: 'orderYouleCount', title: '订单总量', width: 100, templet: '<div>{{formatter0(d.orderYouleCount)}}</div>'},
                {field: 'orderYouleTotalAmount', title: '订单总额', width: 100, templet: '<div>{{formatter0(d.orderYouleTotalAmount)}}</div>'}
            ]],
            where: sellerParam,
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
</script>
</body>
</html>
