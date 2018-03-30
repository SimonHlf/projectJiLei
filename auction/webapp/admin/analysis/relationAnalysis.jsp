<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织关系</title>
    <style>
        /* body {
             overflow: auto;
         }*/

        .ztree * {
            font-family: "微软雅黑", "宋体", Arial, "Times New Roman", Times, serif;
        }

        .ztree {
            padding: 0;
            border-left: 1px solid #E3E3E3;
            border-right: 1px solid #E3E3E3;
            border-bottom: 1px solid #E3E3E3;
        }

        .ztree li a {
            vertical-align: middle;
            height: 32px;
            padding: 0px;
        }

        .ztree li > a {
            width: 100%;
        }

        .ztree li a.curSelectedNode {
            padding-top: 0px;
            background-color: #FFE6B0;
            border: 1px #FFB951 solid;
            opacity: 1;
            height: 32px;
        }

        .ztree li ul {
            padding-left: 0px
        }

        .ztree div.divTd span {
            line-height: 30px;
            vertical-align: middle;
        }

        .ztree div.divTd {
            height: 100%;
            line-height: 30px;
            border-top: 1px solid #E3E3E3;
            border-left: 1px solid #E3E3E3;
            text-align: center;
            display: inline-block;
            color: #6c6c6c;
            overflow: hidden;
        }

        .ztree div.divTd:first-child {
            text-align: left;
            text-indent: 10px;
            border-left: none;
        }

        .ztree .head {
            background: #E8EFF5;
        }

        .ztree .head div.divTd {
            color: #393939;
            font-weight: bold;
        }

        .ztree .ck {
            padding: 0 5px;
            margin: 2px 3px 7px 3px;
        }

        .ztree li:nth-child(odd) {
            background-color: #F5FAFA;
        }

        .ztree li:nth-child(even) {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
<div class="layer">
    <div id="tableMain">
        <ul id="dataTree" class="ztree">

        </ul>
    </div>
    <div id="hisPage" style="float: right"></div>
</div>
<script type="text/javascript">
    var newOpen = null;


    var setting = {
        view: {
            showLine: false,
            addDiyDom: addDiyDom
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "park", // id编号命名 默认
                pIdKey: "pMark", // 父id编号命名 默认
                rootPId: 0 // 用于修正根节点父节点数据，即 pIdKey 指定的属性值
            }
        }
    };

    /**
     * 自定义DOM节点
     */
    function addDiyDom(treeId, treeNode) {
        var spaceWidth = 15;
        var liObj = $("#" + treeNode.tId);
        var aObj = $("#" + treeNode.tId + "_a");
        var switchObj = $("#" + treeNode.tId + "_switch");
        var icoObj = $("#" + treeNode.tId + "_ico");
        var spanObj = $("#" + treeNode.tId + "_span");
        aObj.attr('title', '');
        aObj.append('<div class="divTd swich fnt" style="width:70%"></div>');
        var div = $(liObj).find('div').eq(0);
        //从默认的位置移除
        switchObj.remove();
        spanObj.remove();
        icoObj.remove();
        //在指定的div中添加
        div.append(switchObj);
        div.append(spanObj);
        //隐藏了层次的span
        var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
        switchObj.before(spaceStr);
        //图标垂直居中
        icoObj.css("margin-top", "9px");
        switchObj.after(icoObj);
        var editStr = '';
        //宽度需要和表头保持一致
        editStr += '<div class="divTd" style="width:10%">' + treeNode.phone + '</div>';
        editStr += '<div class="divTd" style="width:10%">' + treeNode.sonNum + '</div>';
        editStr += '<div class="divTd" style="width:10%">' + treeNode.grandsonNum + '</div>';
        aObj.append(editStr);
    }

    //初始化列表
    function queryHandler(zTreeNodes) {
        //初始化树
        var $dataTree = $("#dataTree");
        $.fn.zTree.init($dataTree, setting, zTreeNodes);
        //添加表头
        var li_head = ' <li class="head"><a>' +
            '<div class="divTd" style="width:70%">姓名</div>' +
            '<div class="divTd" style="width:10%">电话</div>' +
            '<div class="divTd" style="width:10%">直接下级数量</div>' +
            '<div class="divTd" style="width:10%">所有下级数量</div>' +
            '</a></li>';
        var rows = $dataTree.find('li');
        if (rows.length > 0) {
            rows.eq(0).before(li_head)
        } else {
            $dataTree.append(li_head);
            $dataTree.append('<li ><div style="text-align: center;line-height: 30px;" >无数据</div></li>')
        }
    }

    $(function () {
        //初始化数据
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage,
                layer = layui.layer;
            $.ajaxSettings.async = false;
            var limit;
            var count;
            $.getJSON('analysis/relation/queryList.htm', function (data) {
                console.log(data);
                limit = data.limit;
                count = data.total;
                queryHandler(data.relation);
            });
            laypage.render({
                elem: 'hisPage',
                theme: '#2dc3e8',
                limit: limit,
                count: count,
                layout: ['prev', 'page', 'next', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        var p = obj.curr;
                        var l = obj.limit;
                        $.getJSON('analysis/relation/queryList.htm', {page: p, pageSize: l}, function (data) {
                            queryHandler(data.relation);
                        })
                    }
                }
            });
        })
    })

</script>
</body>
</html>
