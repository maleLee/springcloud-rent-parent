//服务器地址
var server = {
	domain:"http://localhost/SpringJavaWeb7/"
};
//添加跨域支持
$(function(){
	$.ajaxSetup({
		crossDomain:true,
		xhrFields:{
			withCredentials:true
		}
	});
	
});

