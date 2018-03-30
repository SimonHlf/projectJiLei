<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞拍统计</title>
    <style>
        th .layui-table-cell {
            text-align: center;
        }
    </style>
</head>
<body>
<table class="layui-hide" id="biddertable"></table>
<script>
    var param = {bidderParam: {}};
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

        var bidderParam = param.bidderParam;
        table.render({
            elem: '#biddertable',
            height: 500,
            url: 'analysis/bidder/queryList.htm', //数据接口
            page: {//开启分页
                layout: ['prev', 'page', 'next', 'limit', 'count', 'skip'],
                prev: '上一页',
                next: '下一页'
            },
            cols: [[ //表头
                {field: 'account', title: '用户账号', width: '22%', fixed: 'left'},
                {field: 'count', title: '竞拍商品数', width: '13%'},
                {field: 'totalNum', title: '竞拍总次数', width: '13%'},
                {field: 'successNum', title: '成交次数', width: '13%'},
                {field: 'totalOffer', title: '成交总额', width: '13%'},
                {field: 'passInNum', title: '流拍次数', width: '13%'},
                {field: 'successNum', title: '成交率(%)', width: '13%', templet: '<div>{{formatter1(d)}}</div>'}
            ]],
            where: bidderParam,
            id: 'idTest',
            done: function (data) {

            }
        });


    });

    //格式化金额，保留两位小数
    function formatter(value) {
        return Number(value).toFixed(2);
    }

    function formatter1(o) {
        return o.totalNum === 0 ? 0 : (o.successNum / o.totalNum*100).toFixed(2);
    }

    function formatter0(value) {
        return Number(value).toFixed(0);
    }
</script>
</body>
</html>

