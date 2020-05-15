<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<%--    <title>导航头</title>--%>
    <link rel="stylesheet" type="text/css" href="css/head_bar.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

    <script src="js/vue.js"></script>
    <link rel="stylesheet" href="css/element_ui_index.css">
    <script src="js/element_ui_index.js"></script>
<%--    <link rel="stylesheet" href="css/element_ui_lib_index.css">--%>
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
    <!-- <script src="https://unpkg.com/vue/dist/vue.js"></script> -->
    <!-- <script src="https://unpkg.com/element-ui/lib/index.js"></script> -->

</head>
<body>
<div class="bg" style="background-image: url(img/bg_head1.jfif);">
    <div style="background-color: #2f2f2f8f">
        <div class="top_bar" style="height: 20px">
            <ul class="top_left">
                <c:if test="${loginUser.name!=null}">
                    <li><a target="_parent">${loginUser.name}</a></li>
                    <li><a target="_parent" href="UserLoginOutServlet">退出登录</a></li>
                </c:if>
                <c:if test="${loginUser.name==null}">
                    <li><a target="_parent" href="login.jsp">登录</a></li>
                    <li><a target="_parent" href="login.jsp">注册</a></li>

                </c:if>
            </ul>
            <ul class="top_right">
                <li><a target="_parent" href="Communication">论坛</a></li>
                <c:if test="${loginUser.name!=null}">
                    <li><a target="_parent" href="classily?page=1&flag=3">我的视频</a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <div>
        <div class="headerLayout" style="height: 70px">
            <div><a href="index" class="logo" style="background-image: url(img/logo.png);" target="parent"></a>
            </div>
            <div style="margin-top: 15px;" id="search" class="search">
                <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                    <el-button slot="append" icon="el-icon-search" @click="handleClick"></el-button>
                </el-input>
            </div>

            <c:if test="${loginUser.speak==null}">

                <div class="upload"><a target="_parent" href="login.jsp">上传请登录</a></div>
            </c:if>
            <c:if test="${loginUser.speak==1}">
                <div class="upload"><a target="_parent" href="upload.jsp">分享视频</a></div>
            </c:if>
        </div>
    </div>
    <div>
        <div>
            <div id="type_bar" style="margin-bottom: 0px;margin-top: 30px;">
<%--                <el-tabs v-model="activeName" type="card" @tab-click="handleClick">--%>
<%--                    <el-tab-pane label="全部" name="全部">全部</el-tab-pane>--%>
<%--                    <el-tab-pane label="新番放送" name="新番放送">新番放送</el-tab-pane>--%>
<%--                    <el-tab-pane label="日本动漫" name="日本动漫">日本动漫</el-tab-pane>--%>
<%--                    <el-tab-pane label="国产动漫" name="国产动漫">国产动漫</el-tab-pane>--%>
<%--                    <el-tab-pane label="剧场动画" name="剧场动画">剧场动画</el-tab-pane>--%>
<%--                    <el-tab-pane label="用户分享" name="用户分享">用户分享</el-tab-pane>--%>
<%--                </el-tabs>--%>
                <div class="el-tabs el-tabs--card el-tabs--top">
                    <div class="el-tabs__header is-top">
                        <div class="el-tabs__nav-wrap is-top">
                            <div class="el-tabs__nav-scroll">
                                <div role="tablist" class="el-tabs__nav is-top" style="transform: translateX(0px);">
                                    <a href="classily?search=全部&page=1&flag=2">
                                        <div id="tab-全部" aria-controls="全部" role="tab" tabindex="-1" class="el-tabs__item is-top">全部</div>
                                    </a>
                                    <a href="classily?search=新番放送&page=1&flag=2">
                                        <div id="tab-新番放送" aria-controls="新番放送" role="tab" tabindex="-1" class="el-tabs__item is-top">新番放送</div>
                                    </a>
                                    <a href="classily?search=日本动漫&page=1&flag=2">
                                        <div id="tab-日本动漫" aria-controls="日本动漫" role="tab" tabindex="-1" class="el-tabs__item is-top">日本动漫</div>
                                    </a>
                                    <a href="classily?search=国产动漫&page=1&flag=2">
                                        <div id="tab-国产动漫" aria-controls="国产动漫" role="tab" tabindex="-1" class="el-tabs__item is-top">国产动漫</div>
                                    </a>
                                    <a href="classily?search=剧场动画&page=1&flag=2">
                                        <div id="tab-剧场动画" aria-controls="剧场动画" role="tab" tabindex="-1" class="el-tabs__item is-top">剧场动画</div>
                                    </a>
                                    <a href="classily?search=用户分享&page=1&flag=2">
                                        <div id="tab-用户分享" aria-controls="用户分享" role="tab" tabindex="-1" class="el-tabs__item is-top">用户分享</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


<script type="module">


    //获取url中的参数值
    var classily;
    $(function () {
        (function ($) {
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]);
                return null;
            }
        })(jQuery);
        classily = $.getUrlParam('classily');
        if (!classily) classily = "none";
        vm.activeName = classily;
        // 根据获取的种类参数，显示分类导航栏中的该种分类
        $(".el-tabs__nav>div").click( function(){
            console.log(this.innerText)
            var link = "classily?search=" + this.innerText+"&page=1"+"&flag=2";
            window.parent.location.href = link;
        });
    });

    new Vue({
        el: '#search',
        data: function () {
            return {input: ''}
        },
        methods: {
            handleClick : function() {
                // 搜索的跳转路径，携带搜索的内容
                var link = "classily?search=" + this.input+"&page=1"+"&flag=1";
                window.parent.location.href = link;
            }
        }
    })
    const vm = new Vue({
        el: '#type_bar',
        data: {
            activeName: 'all'
        },
        methods: {
            handleClick : function(tab, event) {
                // console.log(this.activeName);
                // 设置分类导航栏的跳转路径，携带分类的参数
                console.log(1)
                var link = "classily?search=" + this.activeName+"&page=1"+"&flag=2";
                window.parent.location.href = link;
            }
        }

    })

</script>

</body>
</html>
