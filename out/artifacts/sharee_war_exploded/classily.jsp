<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>视频分类</title>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/classily.css">
    <link rel="stylesheet" href="css/element_ui_index.css">
    <script src="js/vue.js"></script>
    <script src="js/element_ui_index.js"></script>
<%--    <link rel="stylesheet" href="css/element_ui_lib_index.css">--%>

</head>
<body >
<jsp:include page="head_bar.jsp"></jsp:include>
<%--<iframe id="iframe" src="head_bar.jsp" width="100%" height="260px" scrolling="no" ></iframe>--%>
<div>
    <div class="context">
        <div class="context_left" id="resources" >
            <div class="resource_item" v-for="item in resourceList" @click="handleClick(item)">
                <div class="resource_pic"><img :src="item.img" style="object-fit: cover;" onerror="javascript:this.src='img/default.jpg';"></div>
                <div class="resource_title" style="width: 88%;display: inline-block">{{item.name}}</div>
            </div>
            <div class="block" style="margin-bottom: 20px;">
                <el-pagination
                        background
                        layout="prev, pager, next"
                        :total="TotalPage"
                        @current-change="handleCurrentChange"
                        :current-page.sync="currentPage"
                >
                </el-pagination>
            </div>
        </div>
    </div>
</div>
<%--<iframe src="bottom_bar.jsp" width="100%" height="auto"  scrolling="no" ></iframe>--%>
<jsp:include page="bottom_bar.jsp"></jsp:include>
</body>

<script type="text/javascript">
    var cur_resources = ${curRes};
    var pages = ${pages};
    //当前种类和页面
    var classily ,page=1;
    if (window != top) 	top.location.href = location.href; //让iframe中的跳转转换成主页跳转


    // 绑定该种类该页面的资源数据和方法
    const resources=new Vue({
        el:'#resources',
        data:{
            resourceList:cur_resources,
            currentPage: 1,
            TotalPage: pages*10
        },
        methods:{
            handleClick(item) {
                console.log(item.id);
                console.log(item.category);
                var link = "resource?id="+item.id+"&classily="+item.category+"&flag="+${flag};
                window.parent.location.href=link;
            },

            handleCurrentChange(val) {
                console.log(`当前页: ${val}`);
                // 设置页码的跳转路径，携带种类参数和点击的页码数
                var link ="classily?search="+classily+"&page="+val+"&flag="+${flag};
                window.parent.location.href=link;
            }
        }
    })


    //获取url中的参数值

    $(function () {
        (function ($) {
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        })(jQuery);
        classily = $.getUrlParam('classily');
        page = $.getUrlParam(page);
        if(!classily) classily="${search}";
        if(!page) page=${page};
        // 重新设置导航头的路径，携带种类的参数，用来显示当前种类
        $('#iframe').attr('src','head_bar.jsp?classily='+classily);
        console.log(classily+" "+page);
        // 设置当前的页数
        resources.currentPage=page;
    });


    // 预加载下一页
    $(document).ready(function () {
        if( page < pages) {
            var nextHref = "classily?search="+classily+"&page="+(page+1)+"&flag="+0;
            var link = '<link rel="prefetch" href="' + nextHref + '">';
            $('head').append(link);
            var pageNumbers = $(".number");
            for (var i = 0; i < pageNumbers.length ; i++) {
                if (pageNumbers[i].innerText - 1 === page ) {
                    pageNumbers.eq(i).css('color', '#409EFF');
                    break;
                }
            }
        }
    })


</script>
</html>