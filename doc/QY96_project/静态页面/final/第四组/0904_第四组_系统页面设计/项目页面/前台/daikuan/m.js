$(function() {
		$(document).on("click", ".submit", function() {
		_ishas = $(this).hasClass("disabled");
		if (_ishas) {
			return;
		}
		_frmid = $(this).attr("frmid");
		_action = $(this).attr("action");
		_return = $(this).attr("return");
		_btn = $(this)
		$(this).addClass("disabled");
		$.ajax({
			type: "POST",
			url: _action,
			data: $('#' + _frmid).serialize(),
			datatype: "html",
			success: function(data) {
				var models = eval("(" + data + ")");
				layer.open({
					content: models['msg'],
					skin: 'msg',
					time: 2,
					end: function() {
						if (models['callback'] !== "") {
							eval(models['callback']);
							return;
						}
						if (models['status'] == "ok") {
							if (_return !== "" && _return !== undefined) {
								window.location.href = _return;
								return;
							} else if (models['url'] !== "") {
								window.location.href = models['url'];
							} else {
								location.reload();
							}
						} else {
							if (models['code'] !== "") {
								$("#" + models['code']).focus();
							}
							if (models['url'] !== "") {
								window.location.href = models['url'];
							}
							_btn.removeAttr("disabled")
							_btn.removeClass("disabled")
						}	
					}
				});				
			}
		});
		return false
	})
	$(document).on("click", ".get", function() {
		_action = $(this).attr("action");
		_return = $(this).attr("return");
		layer.open({
			content: '您确认要执行本次操作吗？',
			btn: ['确定', '取消'],
			yes: function(index) {
				$.get(_action, function(data) {
					var models = eval("(" + data + ")");
					layer.open({
						content: models['msg'],
						skin: 'msg',
						time: 2,
						end: function() {
							if (models['callback'] !== "") {
								eval(models['callback']);
							}						
							if (_return !== "" && _return !== undefined) {
								window.location.href = _return;
							} else if (models['url'] !== "") {
								window.location.href = models['url'];
							}
						}
					});
				});
			}
		});
	})
})