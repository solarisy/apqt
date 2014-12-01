//导航特效
$(function(){$(".nav ul li,.nav li dl dd,.article_nav li").hover(function(){$(this).addClass("hover");},function(){$(this).removeClass("hover");})});
//$(function(){
//	$(".nav li").hover(function(){
//		$(this).children("dl").slideToggle();
//		});
//	});
	
//标题背景特效	
$(function(){
	$(".boxWap").hover(
  function () {
     $(this).children(".title_1").animate({backgroundPosition:"(-227px 0)"},400);
	 }, 
  function () {
	 $(this).children(".title_1").animate({backgroundPosition:"(-145px 0)"},400);
  }
);});
//标题特效	
$(function(){
	$(".title").hover(
  function () {
	 $(this).children(".txt_1").animate({opacity:"0.5"},400);
	 $(this).children(".txt_2").animate({opacity:"0.5"},400);
	 $(this).children(".txt_3").animate({opacity:"0.5"},400);
	 }, 
  function () {
	 $(this).children(".txt_1").animate({opacity:"1"},200);
	 $(this).children(".txt_2").animate({opacity:"1"},200);
	 $(this).children(".txt_3").animate({opacity:"1"},200);
  }
);});



    //加入收藏
 
        function AddFavorite(sURL, sTitle) {
 
            sURL = encodeURI(sURL); 
        try{   
 
            window.external.addFavorite(sURL, sTitle);   
 
        }catch(e) {   
 
            try{   
 
                window.sidebar.addPanel(sTitle, sURL, "");   
 
            }catch (e) {   
 
                alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
 
            }   
 
        }
 
    }
 
    //设为首页
 
    function SetHome(url){
 
        if (document.all) {
 
            document.body.style.behavior='url(#default#homepage)';
 
               document.body.setHomePage(url);
 
        }else{
 
            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
 
        }
 
    }













