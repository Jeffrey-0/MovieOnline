<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="head_bar.jsp"></jsp:include>
<head>
    <title>视频详情</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/element_ui_index.css">
    <script src="js/vue.js"></script>
    <script src="js/element_ui_index.js"></script>
    <%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
    <%--    <link rel="stylesheet" href="css/element_ui_lib_index.css">--%>
    <style type="text/css">
        .context{
            height: auto;
        }
        .context_left{
            /*border: black 1px solid;*/
            height: auto;
            margin-bottom: 40px;
            width: 1200px;

        }
        .name{
            width: 98%;
            /*border: black 1px solid;*/
            font-size:26px;
            padding: 1%;
        }
        .CategoryName, .Uploader, .Time{
            display: inline-block;
            padding:1%;
            color: #aaa;
        }
        .buchong{
            border-bottom: black 1px solid;
            margin-bottom: 10px;
        }
        .Descn{
            width: 98%;
            padding: 1%;
        }
        .download{
            position: absolute;
            right: 0px;
            width: 30px;
            height: 30px;
            background: url(img/下载.png);
            background-size: 100% 100%;
            margin: 30px;
        }
        .context_bottom{
            width: 100%;
        }
        html, body {
            height: 100%;
        }
        iframe{
            height: 100%;
            width: 100%;
        }
        .play_num{
            min-height: 80px;
            max-height: 200px;
            overflow: scroll;
            overflow-x: hidden;
        }
        .play_num a{
            padding: 20px;
            float: left;
            font-size: 18px;
            color: #0b0b0b;
        }
        .play_num a:hover{
            color: #3a8ee6;
            cursor: pointer;
        }
        .title{
            margin-top: 10px;
        }



    </style>

</head>
<body>

<%--<iframe src="head_bar.jsp" width="100%" height="260px" scrolling="no" ></iframe>--%>
<div>
    <div class="context">
        <div class="context_left" id="resource">
            <!-- <a class="download" :href="Resource.code"  :download="Resource.code"></a> -->
            <div class="name">{{Resource.name}}</div>
            <div class="buchong">
            </div>


            <div class="Image ad" style="height:600px;margin-top: 20px;margin-bottom: 20px;">
                <iframe :src="Resource.code" class="video" width="100%" height="600px" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe>

            </div>
            <div class="title">简介</div>
            <div class="Descn">{{Resource.descn}}</div>
            <div class="title">分集</div>
            <div class="play_num">
                <a  v-for="index of Resource_num" @click="handleClick(index)" v-if="index<10">第0{{index}}集</a>
                <a  v-for="index of Resource_num" @click="handleClick(index)" v-if="index>=10">第{{index}}集</a>
            </div>
        </div>
        <div class="context_bottom" id="resource_new">
            <div style="width: 100%;font-size:18px;

				 border-bottom: black 1px solid">猜你喜欢</div>
            <div class="resource_item" v-for="item in resourceList" @click="handleClick(item)">
                <img :src="item.img"  class="resource_pic" onerror="javascript:this.src='img/default.jpg';">
                <div class="right">
                    <div  class="resource_title">{{item.name}}</div>
                    <div class="resource_time">{{item.date}}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bottom_bar.jsp"></jsp:include>
<%--<iframe src="bottom_bar.jsp" width="100%" height="auto" scrolling="no"></iframe>--%>

</body>
<script type="text/javascript">
    //设置获取的数据（以下默认数据，应该赋值servlet传入的数据${传入的数据名称}）
    var similar_resources = ${similarRes};
    var resource= ${res};
    // 获取当前视频的总集数
    <%-- var num = ${res.num};--%>
    // var num = 1;
    // 绑定查看的资源数据
    if (window != top)  top.location.href = location.href; //让iframe中的跳转转换成主页跳转
    const vm1=new Vue({
        el:'#resource',
        data:{
            Resource:resource,
            Resource_num: resource.num
        },
        methods:{
            //选集的跳转链接
            handleClick: function(index) {
                var link = "resource?id="+this.Resource.id+"&classily="+this.Resource.category+"&flag=0&num="+index;
                window.parent.location.href=link;
            }
        }
    })
    // 绑定相似资源
    const new_vm1=new Vue({
        el:'#resource_new',
        data:{
            resourceList:similar_resources
        },
        methods: {
            handleClick: function(item) {
                console.log(item.id);
                console.log(item.category);
                var link = "resource?id="+item.id+"&classily="+item.category;
                window.parent.location.href=link;
            }}
    })
</script>
</html>


