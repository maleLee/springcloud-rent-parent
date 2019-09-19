//服务器地址
var server={
	domain:"http://76cfa4e6.ngrok.io/WeatherManage/"
};
//添加跨域支持
$.ajaxSetup({
	crossDomain: true,
	xhrFields: {
		withCredentials: true
	}
});

