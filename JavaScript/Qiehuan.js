<style>
    *{margin:0;padding:0;}
    li{list-style:none;}
    .focuspic{height:150px;position:relative;overflow:hidden;width:300px;}
    .showpic1{background:#f2c;height:150px;}
    .showpic2{background:#5f4;height:150px;}
    .focuspic li a{display:block;height:150px;width:100%;}
    .focuspic .num{position:absolute;left:50%;margin-left:65px;bottom:10px;}
    .focuspic .num a{border-radius:15px;width:15px;height:15px;text-indent:-999999px;background:rgb(227,106,169);display:block;margin-right:10px;float:left;cursor:pointer;}
    .focuspic .num .cur{background:#A3003D;}
</style>
<div class="focuspic">
    <ul>
    <li style="display: block;" class="showpic1"><img src="图片地址" alt="" width="" height=""></li>
<li class="showpic2 noshow"><img src="图片地址" alt="" width="" height=""></li>
</ul>
<div class="num"></div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
    var sw1 = 0;
    var hlen1=$(".focuspic>ul>li").length;
    for(var j=1;j<=hlen1;j++){
    $(".focuspic .num").append("<a>"+j+"</a>");
};
    $(".focuspic .num a").eq(0).addClass("cur");
    $(".focuspic .num a").mouseover(function(){
    sw1 = $(".focuspic .num a").index(this);
    myShow1(sw1);
});
    function myShow1(j){
    $(".focuspic .num a").eq(j).addClass("cur").siblings("a").removeClass("cur");
    $(".focuspic ul li").eq(j).stop(true,true).fadeIn(600).siblings("li").fadeOut(100);
}
    //滑入停止动画，滑出开始动画
    $(".focuspic").hover(function(){
    if(myTime1){
    clearInterval(myTime1);
}
},function(){
    myTime1 = setInterval(function(){
    myShow1(sw1)
    sw1++;
    if(sw1==hlen1){sw1=0;}
} , 4000);
});
    //自动开始
    var myTime1 = setInterval(function(){
    myShow1(sw1)
    sw1++;
    if(sw1==hlen1){sw1=0;}
} , 4000);
});
</script>