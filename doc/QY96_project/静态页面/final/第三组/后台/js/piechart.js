var ci = -1;
$(document).ready(function() {
	$(".example").piechart([
		["Country", "M inhabitants"],
		["China", 1360, 'blue'],
		["India", 1234],
		["USA", 316],
		["Indonesia", 237],
		["Brazil", 201]

		]);
	$(".piechart-flatmin").on('mouseenter','.sector-s',hoverState);
	$(".piechart-flatmin").on('mouseleave','.sector-s',hoverState);
	$(".piechart-flatmin").on('click','.sector-s',clickState);
	$(window).resize(resizeEvent);

});


(function ( $ ) {
    $.fn.piechart = function(e) {
    	chart = {};
    	var ele = $('<div class="piechart-flatmin"></div>');
    	ele.data('value', e[0][1]).data('key',e[0][0]);
    	e.splice(0,1);
    	var pieHole = $('<div class="piehole"></div>');
    	pieHole.css({background: this.getBackground()});
    	pieHole.append('<div class="piehole-text"><p class="flatmin-title"></p><p class="flatmin-percentage"></p><p class="flatmin-value"></p></div>')
    	ele.append('<div class="ratio"></div>').append(pieHole);
    	this.append(ele);
    	var w = ele.width();
    	resp(w,ele);
    	chart.total = totalValue(e);
    	var os = 0;
    	$.each(e,function(v,k) {
    		var d = {color : get_random_color()};
    		if( typeof k[1] == 'number') {
    			sector = {};
    			sector.val = k[1];
    			sector.per = (k[1]/chart.total)*100;
    			sector.nm = k[0];
    			sector.os = os;
    			sector.color = k[2];
    			var y = $.extend({}, d,sector);
    			paintChart(y,ele);
    			os += 360*sector.per/100;
    		}
    	});
        return this;
    }; 
    $.fn.getBackground = function() {
		var bgcolor = '#FFF';
		$.each(this.parents(), function(v,k) {
			console.log(k);
			var rgb = $(k).css('background-color');
			var rgba = rgb.indexOf('rgba');
			if(rgba == -1) {
				bgcolor = rgb;
				return false;
			}
		});
		return bgcolor;
	}
}( jQuery ));

function resp(w,ele) {
	if(w>360) ele.removeClass('m').removeClass('s');
	else if(w > 250 && w<360) ele.addClass('m').removeClass('s');
    else if (w > 100 && w<250) ele.addClass('s').removeClass('m');
}
function paintChart(s,e) {
	var sec = $('<div class="sector"></div>');
	sec.css(  offset(s.os) );
	e.append(sec);
	sec.data('val',s.val).data('per',s.per).data('title',s.nm);
	sec.attr('per',s.per);
	var h = e.height();
	var secs = $('<div class="sector-s"></div>');
	var secf = $('<div class="sector-f"></div>');
	secs.css( percentToPie(s,h).second );
	secf.css( percentToPie(s,h).first );
	secf.append(secs);
	sec.append(secf);
	if(s.per>50&&s.per<=100) {
		var secft = $('<div class="sector-f"></div>');
		secft.append('<div class="sector-s" style="background-color:'+s.color+'"></div>');
		secft.css({"clip": "rect("+0+"px, "+h+"px, "+h+"px, "+(h/2)+"px)"});
		sec.append(secft);
	}
}

function hoverState() {
	$(this).parents('.sector').toggleClass('hover');
}
function clickState() {
	var sector = $(this).parents('.sector');
	var pieHole = sector.parents('.piechart-flatmin').find('.piehole').find('.piehole-text');
	var value = sector.parents('.piechart-flatmin').data('value');
	var key = sector.parents('.piechart-flatmin').data('key');
	pieHole.find('.flatmin-value').text(sector.data('val')+' '+value);
	pieHole.find('.flatmin-percentage').text(Math.round(sector.data('per')*100)/100);
	pieHole.find('.flatmin-title').text(sector.data('title'));
	pieHole.fadeIn();
}
function resizeEvent() {
	$(".piechart-flatmin").each(function() {
		var t = $(this);
		resp(t.width(),t);
	});
	$(".piechart-flatmin").find('.sector').each(function() {
		var e = $(this);
		var p = {per: e.data('per')};
		var h = e.width();
		e.find('.sector-f').eq(0).css( percentToPie(p,h).first).find('.sector-s').css( percentToPie(p,h).second );
		if(p.per>50&&p.per<=100) {
			e.find('.sector-f').eq(1).css({"clip": "rect("+0+"px, "+h+"px, "+h+"px, "+h/2+"px)"})
		}
	});
}

function offset(o) {
	var s = {
		"transform": "rotate("+o+"deg)",
		"-ms-transform": "rotate("+o+"deg)",
		"-webkit-transform": "rotate("+o+"deg)"
	};
	return s;
}
function percentToPie(s,h) {
	var deg;
	var o;
	var cssopt = {};
	if(s.per<=25) {
		s.per += 0.5;
		cssopt.scliptop = 0;
		cssopt.sclipright = h;
		cssopt.sclipbottom = h/2;
		cssopt.sclipleft = h/2;
		cssopt.srotate = -90+(360*(s.per/100));
		cssopt.fcliptop = 0;
		cssopt.fclipright = h;
		cssopt.fclipbottom = h/2;
		cssopt.fclipleft = h/2;
	} else if(s.per>25&&s.per<=50) {
		s.per += 0.5;
		cssopt.scliptop = 0;
		cssopt.sclipright = h;
		cssopt.sclipbottom = h;
		cssopt.sclipleft = h/2;
		cssopt.srotate = -180+(360*(s.per/100));
		cssopt.fcliptop = 0;
		cssopt.fclipright = h;
		cssopt.fclipbottom = h;
		cssopt.fclipleft = h/2;
	} else if(s.per>50&&s.per<=75) {
		s.per += 0.5;
		cssopt.scliptop = 0;
		cssopt.sclipright = h;
		cssopt.sclipbottom = h;
		cssopt.sclipleft = h/2;
		cssopt.srotate = -180+(360*((s.per-50)/100));
		cssopt.fcliptop = 0;
		cssopt.fclipright = h;
		cssopt.fclipbottom = h;
		cssopt.fclipleft = h/2;
		cssopt.frotate = 179;
	} else if(s.per>75&&s.per<=100) {
		s.per += 0.5;
		cssopt.scliptop = 0;
		cssopt.sclipright = h;
		cssopt.sclipbottom = h;
		cssopt.sclipleft = h/2;
		cssopt.srotate = -360+(360*(s.per/100));
		cssopt.fcliptop = 0;
		cssopt.fclipright = h;
		cssopt.fclipbottom = h;
		cssopt.fclipleft = h/2;
		cssopt.frotate = 179;
	}

	o = {
		second: {
			"clip": "rect("+cssopt.scliptop+"px, "+cssopt.sclipright+"px, "+cssopt.sclipbottom+"px, "+cssopt.sclipleft+"px)",
			"transform": "rotate("+cssopt.srotate+"deg)",
			"-ms-transform": "rotate("+cssopt.srotate+"deg)",
			"-webkit-transform": "rotate("+cssopt.srotate+"deg)",
			background: s.color
		}, first: {
			"clip": "rect("+cssopt.fcliptop+"px, "+cssopt.fclipright+"px, "+cssopt.fclipbottom+"px, "+cssopt.fclipleft+"px)"
		}
	};
	if(s.per>50&&s.per<=100) {
		o.first = {
			"clip": "rect("+cssopt.fcliptop+"px, "+cssopt.fclipright+"px, "+cssopt.fclipbottom+"px, "+cssopt.fclipleft+"px)",
			"transform": "rotate("+cssopt.frotate+"deg)",
			"-ms-transform": "rotate("+cssopt.frotate+"deg)",
			"-webkit-transform": "rotate("+cssopt.frotate+"deg)"
		}
	}
	return o;
}


function totalValue(a) {
	var u = 0;
	$.each(a, function(v,k) {
		if (typeof k[1] == 'number') u += k[1];
	});
	return u;
}

function get_random_color() {
	var color = [
	"#2ecc71",
	"#3498db",
	"#9b59b6",
	"#e74c3c",
	"#e67e22",
	"#34495e",
	"#8e44ad",
	"#27ae60"];
	ci++;
	if(ci>color.length-1) {
		ci = 0;
	}
	console.log(ci);
	return color[ci];
}

