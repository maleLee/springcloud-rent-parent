// JavaScript Document
$(function(){
	//清除最后一个元素的边距
	var $indexfang=$('.index-fang-list');
	 $indexfang.each(function(){
	     $(this).find("dl:last").css("margin-right","0");
	   })
	//指定购房
	$(".zhiding").click(function(){
		$(".bg100").show();
		$(".zhidinggoufang").fadeIn();
		})	
	$(".close").click(function(){
		$(".bg100").hide();
		$(".zhidinggoufang").fadeOut();
		})
	//产品搜索
	$(".pro-search td a").click(function(){
		 $(this).addClass("pro-cur").siblings("a").removeClass("pro-cur");
		})
	$(".paixu a").click(function(){
		 $(this).addClass("pai-cur").siblings("a").removeClass("pai-cur");
		})
	//关注房源
	$(".guanzhulist:first").fadeIn();
	$(".guanzhueq li").click(function(){
		$(this).addClass("guanzhueqcur").siblings("li").removeClass("guanzhueqcur");
		var guan=$(this).index();
		$(".guanzhulist").eq(guan).fadeIn().siblings(".guanzhulist").hide();
		})
	//产品详情页
	$(".proList:first").fadeIn();
	$(".proEq li").click(function(){
		$(this).addClass("proEqCur").siblings("li").removeClass("proEqCur");
		var proeq=$(this).index();
		$(".proList").eq(proeq).fadeIn().siblings(".proList").hide();
		})	
	})
	
//加入收藏 设为首页	
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}	
	