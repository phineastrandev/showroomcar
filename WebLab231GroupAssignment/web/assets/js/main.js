if (typeof $ == 'undefined') {
	var $ = jQuery;
}
/*** Global Class ***/
var CLASS = {
	_active: 'js-active',
	_show: 'js-show',
	_hide: 'js-hide',
	_navbarOpen: 'navbar-open',
	_modalOpen: 'modal-open',
	_modalHide: 'modal-hide',
	_modalScroll: 'modal-scroll',
};

const VF_ModalForm = 'VF_Modal_Form';

var BODY = $('body'),
	DOCUMENT = $(document),
	WINDOW = $(window),
	DOC_WIDTH = DOCUMENT.width(),
	DOC_HEIGHT = DOCUMENT.height(),
	WIN_WIDTH = WINDOW.width(),
	WIN_HEIGHT = WINDOW.height();

/*** APP ***/
var APP = {
	_html: {},
	_body: {},
	_overlay: {},
	_pageID: '',

	init: function () {
		this._html = $('html');
		this._body = $('body');
		this._overlay = $('#overlay');
		APP.detectDevice();
		APP.resize(APP.detectDevice);
		form();
		this.Modal.init();
		this.home.init();
		this.footer.init();
		this.product.init();
		this.header.init();
		this.dealer.init();
		this.plugins.init();
		this.faqs.init();
		this.station.init();
		this.specs.init();
		this.brochure.init();
		this.newsroom.init();
		this.promotion.init();
		this.maintenance.init();
		this.president.init();

		APP.waypoint();
	},

	detectDevice: function () {
		function init() {
			BODY.removeClass('mobile tablet landscape desktop');

			isFireFox();
			if (isIE()) {
				BODY.addClass('IE11');
			}
			if (isLandscape()) {
				BODY.addClass('landscape');
			}
			if (isMobile()) {
				BODY.addClass('mobile');
			} else if (isTablet()) {
				BODY.addClass('tablet');
			} else {
				BODY.addClass('desktop');
			}
		}

		function isMobile() {
			if (navigator.userAgent.match(/Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i)) return true;
			else return false;
		}

		function isTablet() {
			if (navigator.userAgent.match(/Tablet|iPad/i)) return true;
			else return false;
		}

		function isLandscape() {
			APP.getResize();
			if (WIN_HEIGHT < WIN_WIDTH) return true;
			else return false;
		}

		function isFireFox() {
			navigator.userAgent.toLowerCase().indexOf('firefox') > -1 && $('body').addClass('firefox');
		}

		function isIE() {
			if (!!window.MSInputMethodContext && !!document.documentMode) return true;
			else return false

			// var version = detectIE();

			// if (version >= 12) {
			// 	BODY.addClass('Edge' + version);
			// } else {
			// 	BODY.addClass('IE' + version);
			// }
		}

		function detectIE() {
			var ua = window.navigator.userAgent;

			// Test values; Uncomment to check result …

			// IE 10
			// ua = 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)';

			// IE 11
			// ua = 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko';

			// Edge 12 (Spartan)
			// ua = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36 Edge/12.0';

			// Edge 13
			// ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586';

			var msie = ua.indexOf('MSIE ');
			if (msie > 0) {
				// IE 10 or older => return version number
				return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
			}

			var trident = ua.indexOf('Trident/');
			if (trident > 0) {
				// IE 11 => return version number
				var rv = ua.indexOf('rv:');
				return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
			}

			var edge = ua.indexOf('Edge/');
			if (edge > 0) {
				// Edge (IE 12+) => return version number
				return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
			}

			// other browser
			return false;
		}

		init();
	},

	setCookie: function (key, value, day) {
		var expires = new Date();
		expires.setTime(expires.getTime() + (day * 24 * 60 * 60 * 1000));
		document.cookie = key + '=' + value + ';path=/' + ';expires=' + expires.toUTCString();
	},

	getCookie: function (key) {
		var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
		return keyValue ? keyValue[2] : null;
	},

	removeCookie: function (name) {
		document.cookie = name + '=; Max-Age=-99999999;';
	},

	getResize: function () {
		WIN_WIDTH = WINDOW.width();
		WIN_HEIGHT = WINDOW.height();
		DOC_WIDTH = DOCUMENT.width();
		DOC_HEIGHT = DOCUMENT.height();
	},

	getScrollTop: function () {
		return WINDOW.scrollTop();
	},

	scroll: function (offset, time) {
		$('html, body').animate({
			scrollTop: offset
		}, time);
	},

	resize: function (name, timer) {
		var resizeTimer = 0;

		if (timer === undefined) {
			timer = 300;
		}

		WINDOW.on('resize', function () {
			clearTimeout(resizeTimer);
			resizeTimer = setTimeout(name, timer);
		});
	},

	waypoint: function (options) {

		var options = jQuery.extend({
			offset: '95%',
			delay: '0s',
			animateClass: '.way-animate',
			animateGroupClass: '.way-animate-group'
		}, options);

		var initAnimate = function (items, container) {
			var containerOffset = container ? container.data('animate-offset') || options.offset : null;
			items.each(function () {
				var element = $(this),
					animateClass = element.data('animate'),
					animateDelay = element.data('animate-delay') || options.delay,
					animateOffset = element.data('animate-offset') || options.offset;

				TweenMax.set(element, {
					animationDelay: animateDelay,
					alpha: 0
				});

				var trigger = container ? container : element;
				trigger.waypoint(function (direction) {
					if (direction === 'down') {
						TweenMax.set(element, {
							alpha: 1
						});
						element.addClass('animated').addClass(animateClass);
					} else {
						TweenMax.to(element, 0.45, {
							alpha: 0,
							ease: Power0.easeOut
						});
						element.removeClass('animated').removeClass(animateClass);
					}

				}, {
					triggerOnce: true,
					offset: containerOffset || animateOffset
				});
			});
		}

		$(options.animateGroupClass).each(function (index, group) {
			var container = $(group);
			var items = $(group).find(options.animateClass);
			initAnimate(items, container);
		});

		$(options.animateClass)
			.filter(function (index, element) {
				return $(element).parents(options.animateGroupClass).length === 0;
			})
			.each(function (index, element) {
				initAnimate($(element), null);
			});
	},
}

WINDOW.on('scroll', function () {
	var scrollTop = WINDOW.scrollTop();

	if (scrollTop <= 0) {
		$('.backtop').removeClass(CLASS._active);
	}

	if (scrollTop >= 500) {
		$('.backtop').addClass(CLASS._active);
	}
});

$('.backtop').on('click', function () {
	$('html, body').stop().animate({
		scrollTop: 0
	}, 500, 'swing');
});
$(document).ready(function () {
	APP.init();
});

$(window).on('load', function () {
	getCar();
});
var accordion = function(element) {
  var el = jQuery(element),
    accordion = el.find(".accordion"),
    icon = accordion.find(".icon "),
    item = accordion.find(".accordion-header"),
    content = accordion.find(".accordion-body");

  function init() {
    setup();
    item.each(function() {
      if(item.length != 0) {
        handleClick(jQuery(this));
      }
    })
  }

  function handleClick(elm) {
    elm.on("click", function(e) {
      var _this = jQuery(this);
      if(_this.hasClass(CLASS._active)) {
        _this.removeClass(CLASS._active);
        _this.siblings('.accordion-body').slideUp();
      } else {
        item.removeClass(CLASS._active);
        content.slideUp();
        _this.addClass(CLASS._active);
        _this.siblings('.accordion-body').slideDown();
      }
    });
  }

  function setup() {
    content.hide();
  }

  init();
  return;
};

const Carousel = () => {
  let option = {
    slidesToShow: 1,
    slidesToScroll: 1,
    variableWidth: true,
    responsive: [
      {
        breakpoint: 1025,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          variableWidth: false
        }
      }
    ]
  }; 

  $('.vf-carousel-watch .related-content .carousel__container').slick(option);
};
var configureTab = function(element) {
  var el = jQuery(element),
    tab = el.find(".tab"),
    item = tab.find("a"),
    content = el.find(".content");

  function init() {
    setup();
    content.eq(0).show().addClass("active");
    item.eq(0).addClass("active");

    handleClick();
  }

  function handleClick() {
    item.on("click", function(e) {
      e.preventDefault();
      if (jQuery(this).parent().hasClass("active"))  return;

      setup();
      jQuery(this).parent().addClass("active");
      jQuery(this).parent().siblings().removeClass("active");

      target = jQuery(this).attr("href");
      jQuery(".tab-content > div").not(target).hide().removeClass("active");

      jQuery(target).fadeIn(600).addClass("active");
    });
  }

  function setup() {
    content.hide();
    item.removeClass("active");
  }

  init();
  return;
};

var chooseColor = function(element) {
  var el = element,
    colors = el.find(".color-list"),
    color = colors.find("> *");

  color.each(function() {
    var item = jQuery(this);
    item.on("click", function() {
      var parents = item.parents(".content"),
        name = parents.find('.configure-name .name'),
        imgs = parents.find(".configure-img"),
        img = imgs.find("> *"),
        cl = parents.find('.color-list li'),
        dataName = jQuery(this).data("name"),
        dataImage = jQuery(this).data("image");

      if(jQuery(this).hasClass('active')) return;
      cl.removeClass('active');
      jQuery(this).addClass('active');
      name.text(dataName);
      img.attr('src', dataImage);

    });
  });
};

var getCar = function() {
  let colors = document.querySelectorAll('.vf-configure .color-list li')

  colors.forEach((color) => {
    let carUrl = color.dataset.color;

    let im = new Image();
    im.src = carUrl;
  })
}

var countNumber = function(num, time) {
  jQuery('.numbers').each(function () {
    jQuery(this).prop('Counter', num).animate({
      Counter: jQuery(this).text()
    }, {
        duration: time,
        easing: 'linear',
        step: function (now) {
          jQuery(this).text(Math.ceil(now).valueOf());
        }
      })
  })
}
var dealerVinfast = {
  "Hà Nội": {
    "1": [{
      name: "VinFast Royal City",
      address: "Tầng B2, TTTM Vincom Mega Mall Royal City - 72A Nguyễn Trãi, Thượng Đình, Thanh Xuân, Hà Nội",
      phone: "0987558585",
      email: "han.royalcity@vinfast.vn",
      city: "Hà Nội",
      dealer: "showroom"
    }],
    "2": [{
      name: "VinFast Phạm Ngọc Thạch",
      address: "Tầng L1, TTTM Vincom Centre Phạm Ngọc Thạch - 2 Phạm Ngọc Thạch, Kim Liên, Đống Đa, Hà Nội",
      phone: "0902391866",
      email: "han.phamngocthach@vinfast.vn",
      city: "Hà Nội",
      dealer: "showroom"
    }],
    "3": [{
      name: "VinFast Times City",
      address: "Tầng B1, TTTM Vincom Mega Mall Times City - 458 Minh Khai, Vĩnh Tuy, Hai Bà Trưng, Hà Nội",
      phone: "0915379700",
      email: "han.timescity@vinfast.vn",
      city: "Hà Nội",
      dealer: "showroom"
    }],
    "4": [{
      name: "VinFast Long Biên",
      address: "Tầng 1, TTTM Vincom Plaza Long Biên - Khu đô thị Vinhomes Riverside, Phường Phúc Lợi, Quận Long Biên, Hà Nội",
      phone: "0982481199",
      email: "han.longbien@vinfast.vn",
      city: "Hà Nội",
      dealer: "showroom"
    }],
    "5": [{
      name: "VinFast Việt Group",
      address: "138 Phạm Văn Đồng, P. Xuân Đỉnh, Q. Bắc Từ Liêm, Hà Nội",
      phone: "0904675566",
      email: "",
      city: "Hà Nội",
      dealer: "agency"
    }],
    "6": [{
      name: "VinFast Tràng An",
      address: "68 Lê Văn Lương, P. Nhân Chính, Q. Thanh Xuân, Hà Nội",
      phone: "0941243355",
      email: "",
      city: "Hà Nội",
      dealer: "agency"
    }]
  },
  "Bắc Ninh": {
    "1": [{
      name: "VinFast Lý Thái Tổ",
      address: "Tầng 1, TTTM Vincom Plaza Lý Thái Tổ  - Ngã 6 TP. Bắc Ninh, mặt đường Lý Thái Tổ và Trần Hưng Đạo, Bắc Ninh",
      phone: "0945956886",
      email: "bni.lythaito@vinfast.vn",
      city: "Bắc Ninh",
      dealer: "showroom"
    }]
  },
  "Hải Phòng": {
    "1": [{
      name: "VinFast Imperia Hải Phòng",
      address: "Tầng 1, TTTM Vincom Plaza Hạ Long - Khu Cột Đồng Hồ, Bạch Đằng, TP. Hạ Long, Quảng Ninh",
      phone: "0936783458",
      email: "hpg.imperia@vinfast.vn",
      city: "Hải Phòng",
      dealer: "showroom"
    }]
  },
  "Quảng Ninh": {
    "1": [{
      name: "VinFast Hạ Long",
      address: "Tầng L1, TTTM Vincom Plaza Imperia Hải Phòng - Số 1 Bạch Đằng, Thượng Lý, Hồng Bàng, Hải Phòng",
      phone: "0933251222 / 0974100385",
      email: "qni.halong@vinfast.vn",
      city: "Hạ Long",
      dealer: "showroom"
    }]
  },
  "Hà Tĩnh": {
    "1": [{
      name: "VinFast Hà Tĩnh",
      address: "Tầng 1, TTTM Vincom Plaza Hà Tĩnh - Góc Ngã tư đường Hà Huy Tập và đường Hàm Nghi, Phường Hà Huy Tập, Hà Tĩnh",
      phone: "0916164675",
      email: "hti.hahuytap@vinfast.vn",
      city: "Hà Tĩnh",
      dealer: "showroom"
    }]
  },
  "Đà Nẵng": {
    "1": [{
      name: "VinFast Đà Nẵng",
      address: "Tầng 1, TTTM Vincom Plaza Đà Nẵng - Số 910A Ngô Quyền, Quận Sơn Trà, Đà Nẵng",
      phone: "0935112171",
      email: "dng.ngoquyen@vinfast.vn",
      city: "Đà Nẵng",
      dealer: "showroom"
    }]
  },
  "Khánh Hòa": {
    "1": [{
      name: "VinFast Nha Trang - Trần Phú",
      address: "Tầng L1, TTTM Vincom Plaza Trần Phú  - Ngã tư Trần Phú và Trần Quang Khải, TP. Nha Trang, Khánh Hòa",
      phone: "0933010325",
      email: "ntg.tranphu@vinfast.vn",
      city: "Nha Trang",
      dealer: "showroom"
    }],
    "2": [{
      name: "VinFast Hưng Thịnh",
      address: "20 Yết Kiêu, Phường Vạn Thắng, Nha Trang, Khánh Hòa",
      phone: "0935229226",
      email: "",
      city: "Nha Trang",
      dealer: "agency"
    }]
  },
  "Hồ Chí Minh": {
    "1": [{
      name: "VinFast Landmark 81",
      address: "Tầng L1, TTTM Vincom Centre Landmark 81 - Khu đô thị Central Park, 208 đường Nguyễn Hữu Cảnh, Quận Bình Thạnh, Tp Hồ Chí Minh",
      phone: "0913797948",
      email: "hcm.landmark81@vinfast.vn",
      city: "Hồ Chí Minh",
      dealer: "showroom"
    }],
    "2": [{
      name: "VinFast Thảo Điền",
      address: "Tầng L1, TTTM Vincom Mega Mall Thảo Điền - 159 Xa lộ Hà Nội, Thảo Điền, Quận 2, Tp Hồ Chí Minh",
      phone: "0982019050",
      email: "hcm.thaodien@vinfast.vn",
      city: "Hồ Chí Minh",
      dealer: "showroom"
    }],
    "3": [{
      name: "VinFast Lê Văn Việt",
      address: "Tầng 1, TTTM Vincom Plaza Lê Văn Việt - 50 Lê Văn Việt, Hiệp Phú, Quận 9, Tp Hồ Chí Minh",
      phone: "0933806222",
      email: "hcm.levanviet@vinfast.vn",
      city: "Hồ Chí Minh",
      dealer: "showroom"
    }],
    "4": [{
      name: "VinFast Quang Trung",
      address: "190 Quang Trung, Phường 10, Gò Vấp, Hồ Chí Minh",
      phone: "0981335521",
      email: "hcm.quangtrung@vinfast.vn",
      city: "Hồ Chí Minh",
      dealer: "showroom"
    }],
    "5": [{
      name: "VinFast SKYTT",
      address: "214 Nguyễn Oanh, phường 17, quận Gò Vấp, TP. HCM",
      phone: "02873032689",
      email: "hotro@gmail.com",
      city: "Hồ Chí Minh",
      dealer: "agency"
    }],
    "6": [{
      name: "VinFast MAX MOTO",
      address: "410 - 412 An Dương Vương, Phường 4, Quận 5, TPHCM",
      phone: "02822336666 - 02862868555",
      email: "hotro@gmail.com",
      city: "Hồ Chí Minh",
      dealer: "agency"
    }],
    "7": [{
      name: "VinFast Lộc Phát",
      address: "336 - 338 - 340 Huỳnh Tấn Phát, P. Bình Thuận, Quận 7, TP. HCM",
      phone: "0908246801",
      email: "",
      city: "Hồ Chí Minh",
      dealer: "agency"
    }],
    "8": [{
      name: "VinFast SKYTT 2",
      address: "19-21 Cách Mạng Tháng Tám , Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh",
      phone: "02873032689",
      email: "",
      city: "Hồ Chí Minh",
      dealer: "agency"
    }]
  },
  "Lâm Đồng": {
    "1": [{
      name: "VinFast Bảo Lộc",
      address: "Tầng L1, TTTM Vincom Plaza Bảo Lộc - Đường Lê Hồng Phong (cắt ngõ 183 Lê Hồng Phong), TP. Bảo Lộc, Lâm Đồng",
      phone: "0917173949",
      email: "ldg.baoloc@vinfast.vn",
      city: "Bảo Lộc",
      dealer: "showroom"
    }]
  },
  "Cần Thơ": {
    "1": [{
      name: "VinFast Hùng Vương",
      address: "Tầng L1, TTTM Vincom Plaza Hùng Vương - Số 2, đường Hùng Vương, P. Thới Bình, Quận Ninh Kiều, Cần Thơ",
      phone: "0907667333",
      email: "cto.hungvuong@vinfast.vn",
      city: "Cần Thơ",
      dealer: "showroom"
    }],
    "2": [{
      name: "VinFast Thành Danh 2",
      address: "229, Đường 3/2, Phường Hưng Lợi, Quận Ninh Kiều, TP. Cần Thơ",
      phone: "0918768616",
      email: "",
      city: "Cần Thơ",
      dealer: "agency"
    }]
  },
  "An Giang": {
    "1": [{
      name: "VinFast Tài Phát",
      address: "19/6C Trần Hưng Đạo, Khóm Mỹ Thọ, Phường Mỹ Quý, TP. Long Xuyên",
      phone: "0869676767",
      email: "",
      city: "Long Xuyên",
      dealer: "agency"
    }]
  },
  "Bà Rịa Vũng Tàu": {
    "1": [{
      name: "VinFast Bạch Ngân",
      address: "297 Cách Mạng Tháng 8, TP. Bà Rịa, Tỉnh Bà Rịa Vũng Tàu",
      phone: "0913152652",
      email: "",
      city: "Vũng Tàu",
      dealer: "agency"
    }]
  },
  "Bắc Giang": {
    "1": [{
      name: "VinFast Quang Tuấn",
      address: "Dãy 1, Nguyễn Thị Minh Khai, TP Bắc Giang",
      phone: "0899229898",
      email: "",
      city: "Bắc Giang",
      dealer: "agency"
    }],
    "2": [{
      name: "VinFast Hưng Thành Đạt",
      address: "Số 57 Quang Trung, Bắc Giang ",
      phone: "02043845737",
      email: "",
      city: "Bắc Giang",
      dealer: "agency"
    }]
  },
  "Bình Phước": {
    "1": [{
      name: "VinFast Thành Phát 1",
      address: "Vòng xoay Hùng Vương, đường Phú Riềng Đỏ, Phường Tân Bình, TP. Đồng Xoài, Tỉnh Bình Phước",
      phone: "0905055758",
      email: "",
      city: "Đồng Xoài",
      dealer: "agency"
    }]
  },
  "Cà Mau": {
    "1": [{
      name: "VinFast Nam Bình 1",
      address: "139 Nguyễn Tất Thành, phường 8, thành phố Cà Mau, tỉnh Cà Mau",
      phone: "0915191122",
      email: "",
      city: "Cà Mau",
      dealer: "agency"
    }]
  },
  "Đồng Nai": {
    "1": [{
      name: "VinFast Ngọc Phát Motor",
      address: "226-236 Phạm Văn Thuận, Phường Thống Nhất, TP. Biên Hòa, Tỉnh Đồng Nai",
      phone: "0909485511",
      email: "",
      city: "Biên Hòa",
      dealer: "agency"
    }]
  },
  "Hưng Yên": {
    "1": [{
      name: "VinFast Phúc Khánh",
      address: "155-157 Tô Hiệu, Hiến Nam, TP Hưng Yên",
      phone: "0913226685",
      email: "",
      city: "Hưng Yên",
      dealer: "agency"
    }]
  },
  "Kiên Giang": {
    "1": [{
      name: "VinFast Nam Bình 2",
      address: "636 Nguyễn Trung Trực, P. Vĩnh Lạc, TP Rạch Giá, Kiên Giang",
      phone: "0915271122",
      email: "",
      city: "Rạch Gía",
      dealer: "agency"
    }]
  },
  "Lào Cai": {
    "1": [{
      name: "VinFast Mai Long",
      address: "001, Đại Lộ Trần Hưng Đạo, Tổ 54, Phường Kim Tân, TP Lào Cai, Tỉnh Lào Cai",
      phone: "0985595705",
      email: "",
      city: "Lào Cai",
      dealer: "agency"
    }]
  },
  "Nghệ An": {
    "1": [{
      name: "VinFast Trần Hùng",
      address: "146 Nguyễn Sỹ Sách, TP Vinh, Nghệ An",
      phone: "0943735888",
      email: "",
      city: "Nghệ An",
      dealer: "agency"
    }],
    "2": [{
      name: "VinFast An Đô",
      address: "Số 76 Minh Khai, TP Vinh, Nghệ An",
      phone: "0973443322",
      email: "",
      city: "Nghệ An",
      dealer: "agency"
    }]
  },
  "Phú Thọ": {
    "1": [{
      name: "VinFast Minh Đức",
      address: "Khu 11, xã Phú Lộc, huyện Phù Ninh, Phú Thọ",
      phone: "02103829743",
      email: "",
      city: "Phù Ninh",
      dealer: "agency"
    }]
  },
  "Quảng Bình": {
    "1": [{
      name: "VinFast Đại Hoàng Phát",
      address: "306 Lý Thường Kiệt, P. Đồng Phú, TP Đồng Hới, Quảng Bình",
      phone: "02323833686",
      email: "",
      city: "Đồng Hới",
      dealer: "agency"
    }]
  },
  "Quảng Trị": {
    "1": [{
      name: "VinFast Việt Hồng Chinh",
      address: "27 Lê Duẩn, thị xã Quảng Trị, Quảng Trị",
      phone: "0935571555",
      email: "",
      city: "Quảng Trị",
      dealer: "agency"
    }]
  },
  "Tây Ninh": {
    "1": [{
      name: "VinFast Khương Huê",
      address: "582 Cách mạng Tháng 8, phường 3, tp Tây Ninh, tỉnh Tây Ninh",
      phone: "02763745678",
      email: "",
      city: "Tây Ninh",
      dealer: "agency"
    }]
  },
  "Thái Bình": {
    "1": [{
      name: "VinFast Hưng Thịnh Phát",
      address: "Ngã 3  Đông La, QL10, Huyện Đông Hưng, Thái Bình",
      phone: "18001509",
      email: "",
      city: "Thái Bình",
      dealer: "agency"
    }],
    "2": [{
      name: "VinFast Thăng Long",
      address: "61 Lê Lợi, Phường Đề Thám, TP Thái Bình, Tỉnh Thái Bình",
      phone: "1900988909",
      email: "",
      city: "Thái Bình",
      dealer: "agency"
    }]
  },
  "Thừa Thiên Huế": {
    "1": [{
      name: "VinFast Phước Lộc",
      address: "27 Bà Triệu, TP Huế, tỉnh Thừa Thiên Huế",
      phone: "0969335777",
      email: "",
      city: "Thừa Thiên Huế",
      dealer: "agency"
    }]
  },
  "Vĩnh Long": {
    "1": [{
      name: "VinFast Thành Danh",
      address: "162A Nguyễn Huệ, phường 8, thành phố Vĩnh Long, tỉnh Vĩnh Long",
      phone: "0944496969",
      email: "",
      city: "Vĩnh Long",
      dealer: "agency"
    }]
  },
}
var stationVinfast = {
  "Hà Nội": {
    "1": [{
      name: "VM+ HNI 210 Bis Đội Cấn",
      address: "Số 210 Bis phố Đội Cấn, phường Đội Cấn, quận Ba Đình, Hà Nội",
      province: "Hà Nội",
      district: "Ba Đình"
    }],
	"2": [{
      name: "VM+ HNI 18B Ng Biểu",
      address: "Số 18B Nguyễn Biểu, phường Quán Thánh, quận Ba Đình, Hà Nội",
      province: "Hà Nội",
      district: "Ba Đình"
    }],
	"3": [{
      name: "VM+ HNI 31 Tân Ấp",
      address: "Số 31 Tân Ấp, phường Phúc Xá, quận Ba Đình, Hà Nội",
      province: "Hà Nội",
      district: "Ba Đình"
    }],
	"4": [{
      name: "VM+ HNI 91 Đốc Ngữ",
      address: "Số 91 Đốc Ngữ, phường Liễu Giai, quận Ba Đình, Hà Nội",
      province: "Hà Nội",
      district: "Ba Đình"
    }],
    "5": [{
      name: "VM+ HNI 5 Nhật Tảo",
      address: "Số 5 Nhật Tảo, Phường Đông Ngạc, Quận Bắc Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Bắc Từ Liêm"
    }],
	"6": [{
      name: "VM+ HNI 212 Cổ Nhuế",
      address: "212 đường Cổ Nhuế, phường Cổ Nhuế 2, quận Bắc Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Bắc Từ Liêm"
    }],
	"7": [{
      name: "VM+ HNI Số 6 Phố Viên",
      address: "Số 6 Phố Viên, phường Cổ Nhuế 2, quận Bắc Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Bắc Từ Liêm"
    }],
	"8": [{
      name: "VM+ HNI 36  Đức Thắng",
      address: "36 Đức Thắng, phường Đức Thắng, quận Bắc Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Bắc Từ Liêm"
    }],
	"9": [{
      name: "VM+ HNI TDP Viên 5 Cổ Nhuế",
      address: "TDP Viên 5, phường Cổ Nhuế 2, quận Bắc Từ Liêm, Tp. Hà Nội ",
      province: "Hà Nội",
      district: "Bắc Từ Liêm"
    }],
    "10": [{
      name: "VM+ HNI 2/1 Nghĩa Tân",
      address: "Số 2 - Nhà B20, Phường Nghĩa Tân, Quận Cầu Giấy, Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"11": [{
      name: "VM+ HNI 18 Tr Đăng Ninh",
      address: "Lô B2/D7 Khu đô thị mới Cầu Giấy, phường Dịch Vọng, quận Cầu Giấy, TP Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"12": [{
      name: "VM+ HNI 3/55 Đỗ Quang",
      address: "Số 3 ngõ 55 Đỗ Quang, phường Trung Hòa, quận Cầu Giấy, Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"13": [{
      name: "VM+ HNI 28 Trần Tử Bình ",
      address: "Số 28 Trần Tử Bình, phường Nghĩa Tân, quận Cầu Giấy, Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"14": [{
      name: "VM+ HNI 269 Nguyễn Khang",
      address: "Số 269 Nguyễn Khang, Tổ 17, P. Yên Hòa, Q. Cầu Giấy, Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"15": [{
      name: "VM+ HNI 23-25 Nguyễn Khả Trạc",
      address: "Số 23-25 đường Nguyễn Khả Trạc, phường Mai Dịch, Quận Cầu Giấy, Hà Nội",
      province: "Hà Nội",
      district: "Cầu Giấy"
    }],
	"16": [{
      name: "VM+ HNI 38 Đào Cam Mộc",
      address: "38 Đào Cam Mộc, xã Việt Hùng, huyện Đông Anh, Tp. Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"17": [{
      name: "VM+ HNI 44 Lâm Tiên",
      address: "44 tổ 12 phố Lâm Tiên, thị trấn Đông Anh, huyện Đông Anh, Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"18": [{
      name: "VM+ HNI 19 tổ 22 TT Đông Anh",
      address: "VM+ số 19, tổ 22, thị trấn Đông Anh. Huyện Đông Anh, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"19": [{
      name: "VM+ HNI Tổ 25 TT Đông Anh",
      address: "Tổ dân phố 25, Thị trấn Đông Anh, huyện Đông Anh, Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"20": [{
      name: "VM+ HNI Cổ Điển",
      address: "Xóm 3, Thôn Cổ Điển, Xã Hải Bối, Đông Anh, Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"21": [{
      name: "VM+ HNI Hà Phong",
      address: "Thôn Hà Phong, xã Liên Hà, huyện Đông Anh, Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"22": [{
      name: "VM+ HNI 11 Dốc Vân, Mai Lâm",
      address: "11 Dốc Vân, Thôn Du Ngoại, xã Mai Lâm, huyện Đông Anh, Hà Nội",
      province: "Hà Nội",
      district: "Đông Anh"
    }],
	"23": [{
      name: "VM+ HNI 230 Văn Chương",
      address: "Số 230 ngõ Văn Chương, phường Văn Chương, quận Đống Đa, Hà Nội",
      province: "Hà Nội",
      district: "Đống Đa"
    }],
	"24": [{
      name: "VM+ HNI 105 Ngô Xuân Quảng",
      address: "Số 105 Ngô Xuân Quảng, Thị trấn Trâu Quỳ, Huyện Gia Lâm, Tp. Hà Nội",
      province: "Hà Nội",
      district: "Gia Lâm"
    }],
	"25": [{
      name: "VM+ HNI Đào Xuyên",
      address: "Thôn Đào Xuyên, xã Đa Tốn, Huyện Gia Lâm, Hà Nội",
      province: "Hà Nội",
      district: "Gia Lâm"
    }],
	"26": [{
      name: "VM+ HNI 173 Hà Huy Tập",
      address: "173 Hà Huy Tập  , TT Yên Viên, huyện Gia Lâm, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Gia Lâm"
    }],
	"27": [{
      name: "VM+ HNI 23 Vạn Phúc",
      address: "Địa chỉ mới Số 26 Vạn Phúc, phường Vạn Phúc, quận Hà Đông, Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"28": [{
      name: "VM+ HNI 37 Lê Lợi",
      address: "Số 37 Lê Lợi, phường Nguyễn Trãi, quận Hà Đông, Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"29": [{
      name: "VM+ HNI 12 Ngô Thì Nhậm",
      address: "12 Ngô Thì Nhậm, phường Quang Trung, quận Hà Đông, Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"30": [{
      name: "VM+ HNI 70 Lê Trọng Tấn",
      address: "70 Lê Trọng Tấn, phường Dương Nội, quận Hà Đông, Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"31": [{
      name: "VM+ HNI TT18-25 Văn Phú, Hà Đông",
      address: "TT18-25, khu đô thị mới Văn Phú, phường Phú La, Quận Hà Đông, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"32": [{
      name: "VM+ HNI 204 Thanh Bình",
      address: "Khu nhà ở Công ty Xây dựng Phát triển hạ tầng và SXVLXD, số 204 đường Thanh Bình, phường Mộ Lao, quận Hà Đông, Hà Nội",
      province: "Hà Nội",
      district: "Hà Đông"
    }],
	"33": [{
      name: "VM+ HNI 227 Thanh Nhàn",
      address: "227 Thanh Nhàn, Phường Thanh Nhàn, Quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"34": [{
      name: "VM+ HNI 242 Lê Thanh Nghị",
      address: "Số 242 Lê Thanh Nghị, phường Đồng Tâm, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"35": [{
      name: "VM+ HNI 47/187 Hồng Mai",
      address: "Số 47 ngõ 187 Hồng Mai, phường Quỳnh Lôi, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"36": [{
      name: "VM+ HNI 69 Hồng Mai",
      address: "Số 69 Hồng Mai, phường Bạch Mai, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"37": [{
      name: "VM+ HNI 35B Ng Bỉnh Khiêm",
      address: "35B Nguyễn Bỉnh Khiêm, phường Lê Đại Hành, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"38": [{
      name: "VM+ HNI 150 Bạch Mai",
      address: "150 Bạch Mai, P Cầu Dền, Q Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"39": [{
      name: "VM+ HNI 17 Hòa Mã",
      address: "Số 17 Hòa Mã, phường Ngô Thì Nhậm, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"40": [{
      name: "VM+ HNI 145 Lò Đúc",
      address: "Số 145 phố Lò Đúc, phường Đống Mác, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"41": [{
      name: "VM+ HNI 27 Ngô Thì Nhậm",
      address: "Số 27 Ngô Thì Nhậm, phường Ngô Thì Nhậm, quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"42": [{
      name: "VM+ HNI 562 Tr Khát Chân",
      address: "562 Trần Khát Chân, Phường Phố Huế, Quận Hai Bà Trưng, Hà Nội",
      province: "Hà Nội",
      district: "Hai Bà Trưng"
    }],
	"43": [{
      name: "VM+ HNI An Trai",
      address: "VM+ Xóm 1, thôn An Trai, xã Vân Canh, huyện Hoài Đức, Hà Nội",
      province: "Hà Nội",
      district: "Hoài Đức"
    }],
	"44": [{
      name: "VM+ HNI 95 Lý Nam Đế",
      address: "Căn hộ 95, biệt thự 95 phố Lý Nam Đế, phường Cửa Đông, quận Hoàn Kiếm, Hà Nội",
      province: "Hà Nội",
      district: "Hoàn Kiếm"
    }],
	"45": [{
      name: "VM+ HNI Số 1 Đường Thành",
      address: "Số 1 Đường Thành, phường Cửa Đông, quận Hoàn Kiếm, Hà Nội",
      province: "Hà Nội",
      district: "Hoàn Kiếm"
    }],
	"46": [{
      name: "VM+ HNI 384 Bạch Đằng",
      address: "Số 384 Bạch Đằng, phường Chương Dương, quận Hoàn Kiếm, Hà Nội",
      province: "Hà Nội",
      district: "Hoàn Kiếm"
    }],
	"47": [{
      name: "VM+ HNI 453 Bạch Đằng",
      address: "453 Bạch Đằng, phường Chương Dương, quận Hoàn Kiếm, Hà Nội",
      province: "Hà Nội",
      district: "Hoàn Kiếm"
    }],
	"48": [{
      name: "VM+ 22 Trần Nhật Duật - Hà Nội",
      address: "Số 22 Trần Nhật Duật, phường Đồng Xuân, quận Hoàn Kiếm, Hà Nội",
      province: "Hà Nội",
      district: "Hoàn Kiếm"
    }],
	"49": [{
      name: "VM+ HNI 15/163 Ngọc Hồi",
      address: "Số 15 ngõ 163 Ngọc Hồi, phường Hoàng Liệt, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"50": [{
      name: "VM+ HNI 345 Bùi Xương Trạch",
      address: "Số 345 Bùi Xương Trạch, phường Định Công, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"51": [{
      name: "VM+ HNI 86 Thanh Lân",
      address: "86 Thanh Lân, phường Thanh Trì, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"52": [{
      name: "VM+ HNI 261 Tân Mai",
      address: "Số 261 Tân Mai, phường Tân Mai, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"53": [{
      name: "VM+ HNI 74 Vĩnh Hưng",
      address: "Số 74, đường Vĩnh Hưng, Tổ 25 phường Vĩnh Hưng, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"54": [{
      name: "VM+ HNI Lô BT3- Ô 24 KDT Pháp Vân",
      address: "Lô BT3- ô số 24, KDT mới Pháp vân – Tứ Hiệp, phường Hoàng Liệt, quận Hoàng Mai, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"55": [{
      name: "VM+ HNI 182 Đại Từ",
      address: "Số 182 Đại Từ, phường Đại Kim, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"56": [{
      name: "VM+ HNI 12 Lô B Đại Kim",
      address: "Ô số 12 Lô B, khu đô thị mới Đại Kim - Định Công, phường Đại Kim, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"57": [{
      name: "VM+ HNI 228 Vĩnh Hưng",
      address: "Số 228 đường Vĩnh Hưng, phường Vĩnh Hưng, quận Hoàng Mai, Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"58": [{
      name: "VM+ HNI Lô N2C khu TĐC X2A",
      address: "Lô N2C khu tái định cư X2A, phường Yên Sở, quận Hoàng Mai, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Hoàng Mai"
    }],
	"59": [{
      name: "VM+ HNI A21-BT7 Việt Hưng",
      address: "Ô số 21 Lô A Biệt Thự BT7, Khu đô thị mới Việt Hưng, Phường Giang Biên, Quận Long Biên, Thành phố Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"60": [{
      name: "VM+ HNI 11 Ng Sơn",
      address: "Số 11 Nguyễn Sơn, phường Ngọc Lâm, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"61": [{
      name: "VM+ HNI 70 Phố Trạm",
      address: "70 Phố Trạm, phường Long Biên, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"62": [{
      name: "VM+ HNI 227 Ngọc Lâm",
      address: "227 Ngọc Lâm, phường Ngọc Lâm, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"63": [{
      name: "VM+ HNI 38 Trường Lâm",
      address: "Số 38 Trường Lâm, phường Đức Giang, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"64": [{
      name: "VM+ HNI 10 Đức Giang",
      address: "Số 10 phố Đức Giang, phường Đức Giang, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"65": [{
      name: "VM+ HNI 211 Thạch Bàn",
      address: "Số 211 đường Thạch Bàn, phường Thạch Bàn, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"66": [{
      name: "VM+ HNI 97 Sài Đồng",
      address: "97 Sài Đồng, phường Sài Đồng, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"67": [{
      name: "VM+ HNI 195 Hoa Lâm",
      address: "Số 195 Hoa Lâm, phường Việt Hưng, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"68": [{
      name: "VM+ HNI 18 Lệ Mật",
      address: "Số 18 Lệ Mật, phường Việt Hưng, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"69": [{
      name: "VM+ 12 ngõ 253 Nguyễn Văn Linh",
      address: "Số 12 ngõ 253 Nguyễn Văn Linh, phường Phúc Đồng, quận Long Biên, thành phố Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"70": [{
      name: "VM+ HNI 140-142 Nguyễn Sơn",
      address: "Số 140-142 Nguyễn Sơn, phường Bồ Đề, Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"71": [{
      name: "VM+ HNI 68 Hoàng Như Tiếp",
      address: "Số 68 Hoàng Như Tiếp, phường Bồ Đề, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"72": [{
      name: "VM+ HNI 69 Bắc Cầu",
      address: "Số 69 Bắc Cầu, phường Ngọc Thụy, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"73": [{
      name: "VM+ HNI 21 tổ 7 Giang Biên",
      address: "Số 21 tổ 7 phường Giang Biên, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"74": [{
      name: "VM+ HNI Số 1, Tổ 7 Phúc Lợi",
      address: "Số 1 tổ 7 Phúc Lợi, quận Long Biên, Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"75": [{
      name: "VM+ HNI 79 Bát Khối",
      address: "Số 79 , Đường Bát Khối , Phường Long Biên , Quận Long Biên , Thành Phố Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"76": [{
      name: "VM+ HNI Lô BT1-18 Phúc Lợi",
      address: "Lô BT1-18 Đường Phúc Lợi , Phường Phúc Lợi, Quận Long Biên , Thành Phố Hà Nội",
      province: "Hà Nội",
      district: "Long Biên"
    }],
	"77": [{
      name: "VM+ HNI 2 Đình Thôn",
      address: "Số 2 Đình Thôn, Quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"78": [{
      name: "VM+ HNI 156 Trần Bình",
      address: "156 Đường Trần Bình, Mỹ Đình 2, Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"79": [{
      name: "VM+ HNI 29 Tây Mỗ",
      address: "Số 29 Tây Mỗ, phường Tây Mỗ, quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"80": [{
      name: "VM+ HNI NV36 KĐT Mới Trung Văn",
      address: "NV36, Khu đô thị mới Trung Văn, phường Trung Văn, quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"81": [{
      name: "VM+ HNI 153 Hữu Hưng",
      address: "Số 153 Hữu Hưng, Phường Tây Mỗ, Quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"82": [{
      name: "VM+ HNI BT1 Lô 8 Mễ Trì Hạ",
      address: "BT1- Lô 8, Khu đô thị Mễ Trì Hạ, đường Mễ Trì Hạ, Phường Mễ Trì, quận Nam Từ Liêm, TP Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"83": [{
      name: "VM+ HNI TDP 5 Mễ Trì Hạ",
      address: "TDP số 5 Mễ Trì Hạ, phường Mễ Trì, quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"84": [{
      name: "VM+ HNI BT1.D8 KĐT Trung Văn",
      address: "BT1.D8, Khu đô thị mới Trung Văn, đường Trung Văn, Phường Trung Văn, Quận Nam Từ Liêm, TP Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"85": [{
      name: "VM+ HNI 354-356 Mỹ Đình",
      address: "Số 354-356 Mỹ Đình, phường Mỹ Đình 1, quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"86": [{
      name: "VM+ HNI 44 Ng Hoàng",
      address: "Số 44 Nguyễn Hoàng, phường Mỹ Đình 2, quận Nam Từ Liêm, Hà Nội",
      province: "Hà Nội",
      district: "Nam Từ Liêm"
    }],
	"87": [{
      name: "VM+ HNI 151 Trích Sài",
      address: "Số 7 khu tập thể Quân đội Trích Sài, phường Bưởi, Quận Tây Hồ, Hà Nội",
      province: "Hà Nội",
      district: "Tây Hồ"
    }],
	"88": [{
      name: "VM+ HNI 688 Lạc Long Quân",
      address: "688 Lạc Long Quân, Tổ 13 cụm 2 phường Nhật Tân, quận Tây Hồ, Hà Nội",
      province: "Hà Nội",
      district: "Tây Hồ"
    }],
	"89": [{
      name: "VM+ HNI 612A Lạc Long Quân",
      address: "Số 612A Lạc Long Quân, tổ 10 cụm 2, phường Nhật Tân, quận Tây Hồ, Hà Nội",
      province: "Hà Nội",
      district: "Tây Hồ"
    }],
	"90": [{
      name: "VM+ HNI Lô 2-628 Hoàng Hoa Thám",
      address: "Lô số 2-628, đường Hoàng Hoa Thám, phường Bưởi, quận Tây Hồ, Hà Nội",
      province: "Hà Nội",
      district: "Tây Hồ"
    }],
	"91": [{
      name: "VM+ HNI 18 Cầu Dậu",
      address: "Số 18 Cầu Dậu, xã Thanh Liệt, huyện Thanh Trì, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Trì"
    }],
	"92": [{
      name: "VM+ HNI 139 Chiến Thắng",
      address: "Số 139 đường Chiến Thắng, phường Tân Triều, huyện Thanh Trì, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Trì"
    }],
	"93": [{
      name: "VM+ HNI 70-72 Tựu Liệt",
      address: "Số 70-72 đường Tựu Liệt, thị trấn Văn Điển, huyện Thanh Trì, Hà Nôi",
      province: "Hà Nội",
      district: "Thanh Trì"
    }],
	"94": [{
      name: "VM+ HNI E13 KĐG Tân Triều",
      address: "E13, Khu đấu giá quyền sử dụng đất, xã Tân Triều, Thanh Trì, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Trì"
    }],
	"95": [{
      name: "VM+ HNI TT3 40-41 KĐG Tứ Hiệp",
      address: "TT3 40-41, Khu đấu giá quyền sử dụng đất, xã Ngũ Hiệp – Tứ Hiệp, Thanh Trì , Hà Nội",
      province: "Hà Nội",
      district: "Thanh Trì"
    }],
	"96": [{
      name: "VM+ HNI 268 Lê Trọng Tấn",
      address: "Số 268 Lê Trọng Tấn, phường Khương Mai, quận Thanh Xuân, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Xuân"
    }],
	"97": [{
      name: "VM+ HNI 147 Hg Văn Thái",
      address: "Số 147 đường Hoàng Văn Thái, tổ 72, phường Khương Trung, quận Thanh Xuân, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Xuân"
    }],
	"98": [{
      name: "VM+ HNI 3 Tô Vĩnh Diện",
      address: "Số nhà 3, phố Tô Vĩnh Diện, phường Khương Trung, quận Thanh Xuân, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Xuân"
    }],
	"99": [{
      name: "VM+ HNI 101-A1 Th Xuân Bắc",
      address: "Số 101-A1 Tập thể Thanh Xuân Bắc, Quận Thanh Xuân, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Xuân"
    }],
	"100": [{
      name: "VM+ HNI 639 Vũ Tông Phan",
      address: "Số 639 Vũ Tông Phan, phường Khương Đình, quận Thanh Xuân, Hà Nội",
      province: "Hà Nội",
      district: "Thanh Xuân"
    }]
  },
  "Hồ Chí Minh": {
    "1": [{
      name: "VM+ HCM 331C Trần Hưng Đạo ",
      address: "331C Trần Hưng Đạo, Phường Cô Giang, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"2": [{
      name: "VM+ HCM 91 Điện Biên Phủ",
      address: "91 Điện Biên Phủ, P. Đa Kao, Q.1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"3": [{
      name: "VM+ HCM 13 Trần Khắc Chân",
      address: "13 Trần Khắc Chân ,Phường Tân Định, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"4": [{
      name: "VM+ HCM 156 Lê Lai",
      address: "156 Lê Lai , Phường Bến Thành, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"5": [{
      name: "VM+ HCM Ng Cảnh Chân",
      address: "TK26/13-14 Nguyễn Cảnh Chân, Phường Cầu Kho, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"6": [{
      name: "VM+ HCM 95C Nguyễn Văn Thủ",
      address: "95C Nguyễn Văn Thủ, Phường DaKao, Quận 1, TPHCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"7": [{
      name: "VM+ HCM 176 Bùi Viện",
      address: "176 Bùi Viện, Phường Phạm Ngũ Lão, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
	"8": [{
      name: "VM+ HCM 51 Ng Trãi",
      address: "51 Nguyễn Trãi, Phường Bến Thành, Quận 1, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 1"
    }],
    "9": [{
      name: "VM+ HCM 11 Ng Quý Đức ",
      address: "11 Nguyễn Quý Đức ,Phường An Phú, Quận 2, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 2"
	}],
	"10": [{
      name: "VM+ HCM 316 Ng Thị Định",
      address: "316, Nguyễn Thị Định , Phường Thạnh Mỹ Lợi, Quận 2, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 2"
	}],
	"11": [{
      name: "VM+ HCM 41 Lê Văn Thịnh",
      address: "41, Lê Văn Thịnh, Phường Cát Lái, Quận 2, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 2"
	}],
	"12": [{
      name: "VM+ HCM 109 Đường 39",
      address: "109 đường 39 ấp Trung 2, Phường Bình Trưng Tây, Quận 2, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 2"
	}],
	"13": [{
      name: "VM+ HCM 403 Hai Bà Trưng",
      address: "403 Hai Bà Trưng, Phường 8, Quận 3, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 3"
	}],
	"14": [{
      name: "VM+ HCM 86 Trần Quang Diệu",
      address: "86 Trần Quang Diệu, Phường 14, Quận 3, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 3"
	}],
	"15": [{
      name: "VM+ HCM 148EF Lý Chính Thắng",
      address: "148EF Lý Chính Thắng, Phường 7, Quận 3, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 3"
	}],
	"16": [{
      name: "VM+ HCM 107A Vườn Chuối",
      address: "107A, Vườn Chuối, Phường 4, Quận 3, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 3"
	}],
	"17": [{
      name: "VM+ HCM 24-24B Tôn Đản",
      address: "Số 24-24B đường Tôn Đản, Phường 13, Quận 4, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 4"
	}],
	"18": [{
      name: "VM+ HCM 1980 Xóm Chiếu",
      address: "1980 Xóm Chiếu, Phường 14, Quận 4, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 4"
	}],
	"19": [{
      name: "VM+ HCM Ng Hữu Hào",
      address: " Nguyễn Hữu Hào ,Phường 6, Quận 4, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 4"
	}],
	"20": [{
      name: "VM+ HCM 134 Xóm Chiếu",
      address: "134 Xóm Chiếu, Phường 14, Quận 4, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 4"
	}],
	"21": [{
      name: "VM+ HCM 232 Tôn Thất Thuyết",
      address: "232 Tôn Thất Thuyết, Phường 3, Quận 4, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 4"
	}],
	"22": [{
      name: "VM+ HCM 771-773 Ng Trãi",
      address: "771-773 Nguyễn Trãi ,Phường 11, Quận 5, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 5"
	}],
	"23": [{
      name: "VM+ HCM 113 Bùi Hữu Nghĩa",
      address: "113, Bùi Hữu Nghĩa, Phường 7, Quận 5, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 5"
	}],
	"24": [{
      name: "VM+ HCM 988 Nguyễn Trãi",
      address: "988 Nguyễn Trãi, Phường 14, Quận 5, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 5"
	}],
	"25": [{
      name: "VM+ HCM 38 Huỳnh Mẫn Đạt",
      address: "38, Huỳnh Mẫn Đạt, Phường 2, Quận 5, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 5"
	}],
	"26": [{
      name: "VM+ HCM 67 Ngô Quyền",
      address: "67, Ngô Quyền, PHƯỜNG 11, Quận 5, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 5"
	}],
	"27": [{
      name: "VM+ HCM 43 Lô V Cư xá Phú Lâm D",
      address: "43 Lô V Cư Xá Phú Lâm D, Phường 10, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"28": [{
      name: "VM+ HCM 212-213 Phan Văn Khỏe",
      address: "43 Lô V Cư Xá Phú Lâm D, Phường 10, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"29": [{
      name: "VM+ HCM 41A Tân Hòa Đông",
      address: "41 A Tân Hòa Đông, Phường 14, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"30": [{
      name: "VM+ HCM 336/55 Nguyễn Văn Luông",
      address: "336/55 Nguyễn Văn Luông, Phường 12, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"31": [{
      name: "VM+ HCM 117-119 Trần Văn Kiểu",
      address: "117-119 Trần Văn Kiểu, Phường 10, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"32": [{
      name: "VM+ HCM 36/27 Kinh Dương Vương",
      address: "36/27 Kinh Dương Vương, Phường 13, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"33": [{
      name: "VM+ HCM 217 Bà Hom",
      address: "217 Bà Hom,P.13, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"34": [{
      name: "VM+ HCM 56-58 Đường số 23",
      address: "56-58 Đường Số 23, Phường 10, Quận 6, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 6"
	}],
	"35": [{
      name: "VM+ HCM 84 Ng Thị Thập",
      address: "84 Nguyễn Thị Thập, P. Bình Thuận, Quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"36": [{
      name: "VM+ HCM 202 Lâm Văn Bền",
      address: "202 Lâm Văn Bền, phường Tân Quy, quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"37": [{
      name: "VM+ HCM 97 Trần Trọng Cung",
      address: "97 Trần Trọng Cung, Phường Tân Thuận Đông, Quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"38": [{
      name: "VM+ HCM 1112 Huỳnh Tấn Phát",
      address: "1112 Huỳnh Tấn Phát , Khu phố 4, Phường Tân Phú, Quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"39": [{
      name: "VM+ HCM 54 Phạm Hữu Lầu",
      address: "54 Phạm Hữu Lầu, KP 2, Phường Phú Mỹ, Quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"40": [{
      name: "VM+ HCM 27 Bùi Văn Ba",
      address: "27 Bùi Văn Ba, Phường Tân Thuận Đông, Quận 7, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 7"
	}],
	"41": [{
      name: "VM+ HCM 32-34 Cao Lỗ",
      address: "32-34 Cao Lỗ, Phường 4, Quận 8, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 8"
	}],
	"42": [{
      name: "VM+ HCM 419 Ba Đình",
      address: "419 Ba Đình, Phường 9, Quận 8 , TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận 8"
	}],
	"43": [{
      name: "VM+ HCM 268 Bùi Minh Trực",
      address: "268 Bùi Minh Trực, Phường 6, Quận 8, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 8"
	}],
	"44": [{
      name: "VM+ HCM 58 Man Thiện",
      address: "58-60 Man Thiện, Phường Tăng Nhơn Phú A, Quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"45": [{
      name: "VM+ HCM 66 Tây Hòa",
      address: "66 Tây Hòa, Khu Phố 4, Phường Phước Long A, quận 9 TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"46": [{
      name: "VM+ HCM 57 Quang Trung",
      address: "57 Quang Trung, phường Hiệp Phú, quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"47": [{
      name: "VM+ HCM 199 Nguyễn Văn Tăng",
      address: "199 Nguyễn Văn Tăng, Phường Long Thạnh Mỹ, Quận 9, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"48": [{
      name: "VM+ HCM 77A Dương Đình Hội",
      address: "77 A Dương Đình Hội, Phước Long B, Quận 9, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"49": [{
      name: "VM+ HCM 206 Đình Phong Phú",
      address: "206 Đình Phong Phú, KP3, Phường Tăng Nhơn Phú B, Quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"50": [{
      name: "VM+ HCM 411 Nguyễn Văn Tăng",
      address: "411 Nguyễn Văn Tăng, Phường Long Thạnh Mỹ, Quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"51": [{
      name: "VM+ HCM 355A  Đỗ Xuân Hợp",
      address: "355A Đường Đỗ Xuân Hợp, KP5, Phường Phước Long B, Quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"52": [{
      name: "VM+ HCM 72 Nguyễn Văn Tăng",
      address: "72 Nguyễn Văn Tăng, KP Chân Phúc Cẩm, Phường Long Thạnh Mỹ, Quận 9, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 9"
	}],
	"53": [{
      name: "VM+ HCM 4 Ng Ngọc Lộc",
      address: "4 Nguyễn Ngọc Lộc Phường 14 Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"54": [{
      name: "VM+ HCM 95 Hòa Hưng",
      address: "95 Hòa Hưng ,Phường 12 ,Quận 10 ,TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"55": [{
      name: "VM+ HCM 145 Vĩnh Viễn",
      address: "145 Vĩnh Viễn, Phường 4, Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"56": [{
      name: "VM+ HCM 25 Lô A Trường Sơn",
      address: "25 Lô A Trường Sơn, Phường 15, Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"57": [{
      name: "VM+ HCM 458 Lý Thái Tổ",
      address: "458 Lý Thái Tổ, Phường 10, Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"58": [{
      name: "VM+ HCM 662 Điện Biên Phủ",
      address: "662 Điện Biên Phủ, Phường 11, Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"59": [{
      name: "VM+ HCM 79 Đào Duy Từ",
      address: "79 Đào Duy Từ, Phường 5, Quận 10, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 10"
	}],
	"60": [{
      name: "VM+ HCM 182A -184  Lạc Long Quân",
      address: "182A -184 Lạc Long Quân, Phường 3, Quận 11, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 11"
	}],
	"61": [{
      name: "VM+ HCM 94/54-56 Hoà Bình",
      address: "94/54-94/56 Hoà Bình, Phường 5, Quận 11, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 11"
	}],
	"62": [{
      name: "VM+ HCM 39A-41 Đường Đội Cung",
      address: "39A-41 Đường Đội Cung, Phường 11, Quận 11, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 11"
	}],
	"63": [{
      name: "VM+ HCM 1044 Nguyễn Văn Quá",
      address: "1044 Nguyễn Văn Quá, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"64": [{
      name: "VM+ HCM 596/2 Tô Ký́",
      address: "596/2 Tô Ký, Phường Tân Chánh Hiệp, Quận 12 , TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"65": [{
      name: "VM+ HCM 108 đường ĐHT02",
      address: "108 đường ĐHT02, Phường Đông Hưng Thuận, Quận 12 ,TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"66": [{
      name: "VM+ HCM 25 Bùi Công Trừng",
      address: "25 Bùi Công Trừng, Phường Thạnh Xuân, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"67": [{
      name: "VM+ HCM 241 Trần Thị Cờ",
      address: "241 Trần Thị Cờ, KP3, Phường Thới An, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"68": [{
      name: "VM+ HCM 101 Bùi Văn Ngữ́",
      address: "101 Bùi Văn Ngữ, Phường Tân Chánh Hiệp, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"69": [{
      name: "VM+ HCM 911 A-B Nguyễn Ảnh Thủ",
      address: "911 A-B Nguyễn Ảnh Thủ, Phường Tân Chánh Hiệp, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"70": [{
      name: "VM+ HCM 38 Đường TTN02",
      address: "38 Đường TTN02, Khu Phố 7, Phường Tân Thới Nhất, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"71": [{
      name: "VM+ HCM 40B Nguyễn Thị Tràng",
      address: "40B Nguyễn Thị Tràng, Khu Phố 2, Phường Hiệp Thành, Quận 12, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận 12"
	}],
	"72": [{
      name: "VM+ HCM 744-746-748 Hương lộ 2",
      address: "744-746-748 ,Hương Lộ 2, KP 6, Phường Bình Trị Đông A, Quận Bình Tân, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Tân"
	}],
	"73": [{
      name: "VM+ HCM 273 Tân Hòa Đông",
      address: "273 Đường Tân Hòa Đông, KP 14 , Phường Bình Trị Đông, Quận Bình Tân, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Tân"
	}],
	"74": [{
      name: "VM+ HCM 193 Chiến Lược",
      address: "193 Chiến Lược, KP 16, Phường Bình Trị Đông, Quận Bình Tân, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Tân"
	}],
	"75": [{
      name: "VM+ HCM 602/52 Điện Biên Phủ",
      address: "602/52 Điện Biên Phủ, P.22, Bình Thạnh, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Thạnh"
	}],
	"76": [{
      name: "VM+ HCM 860/80/22 Xô Viết Nghệ Tĩnh",
      address: "HCM 860/80/22 Xô Viết Nghệ Tĩnh, Phường 25, Quận Bình Thạnh, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Thạnh"
	}],
	"77": [{
      name: "VM+ HCM 1/54 Thanh Đa",
      address: "1/54 Thanh Đa, Phường 27, Quận Bình Thạnh, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Thạnh"
	}],
	"78": [{
      name: "VM+ HCM 121 Nguyễn Văn Đậu",
      address: "121 Nguyễn Văn Đậu, Phường 5, Quận Bình Thạnh, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Bình Thạnh"
	}],
	"79": [{
      name: "VM+ HCM 793 Nguyễn Kiệm",
      address: "793 Nguyễn Kiệm, Phường 3, Quận Gò Vấp, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Gò Vấp"
	}],
	"80": [{
      name: "VM+ HCM 6 Trần Thị Nghỉ",
      address: "6 Trần Thị Nghỉ, Phường 7, Quận Gò Vấp, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Gò Vấp"
	}],
	"81": [{
      name: "VM+ HCM 1298 Lê Đức Thọ",
      address: "1298 Lê Đức Thọ, Phường 13, Quận Gò Vấp,TPHCM(Địa chỉ 1374 Lê Đức Thọ , Quận Gò Vấp, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Gò Vấp"
	}],
	"82": [{
      name: "VM+ HCM 1189-1191 Phạm Văn Bạch",
      address: "1189-1191 Phạm Văn Bạch, Phường 12, Quận Gò Vấp, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Gò Vấp"
	}],
	"83": [{
      name: "VM+ HCM 117 Dương Quảng Hàm",
      address: "117 Dương Quảng Hàm, Phường 5, Quận Gò Vấp, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Gò Vấp"
	}],
	"84": [{
      name: "VM+ HCM 103 Trần Huy Liệu",
      address: "103 Trần Huy Liệu, Phường 12, Quận Phú Nhuận, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Phú Nhuận"
	}],
	"85": [{
      name: "VM+ HCM 476 Phan Xích Long",
      address: "Số 476 Phan Xích Long, Phường 3, Quận Phú Nhuận, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Phú Nhuận"
	}],
	"86": [{
      name: "VM+ HCM 70 Đặng Văn Ngữ",
      address: "70, Đặng Văn Ngữ, P. 1, Q. Phú Nhuận, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Phú Nhuận"
	}],
	"87": [{
      name: "VM+ HCM 63 Phan Đình Phùng",
      address: " 63 Phan Đình Phùng, Phường 17, Quận Phú Nhuận, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Phú Nhuận"
	}],
	"88": [{
      name: "VM+ HCM 10B-10C Lê Minh Xuân",
      address: "10B -10C Lê Minh Xuân, Phường 7, Quận Tân Bình, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Bình"
	}],
	"89": [{
      name: "VM+ HCM 24 Lê Bình",
      address: "24 Lê Bình, phường 04, quận Tân Bình, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Bình"
	}],
	"90": [{
      name: "VM+ HCM 89-91 Phạm Phú Thứ",
      address: "89-91 Phạm Phú Thứ, Phường 11, Quận Tân Bình, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Bình"
	}],
	"91": [{
      name: "VM+ HCM 323-325 Võ Thành Trang",
      address: "323 và 325 Võ Thành Trang, Phường 11, Quận Tân Bình, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Bình"
	}],
	"92": [{
      name: "VM+ HCM 68 Huỳnh Văn Nghệ",
      address: "68 Huỳnh Văn Nghệ, Phường 15, Quận Tân Bình, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Bình"
	}],
	"93": [{
      name: "VM+ HCM 62 Tân Thành",
      address: "62 Tân Thành, P. Tân Thành, Q. Tân Phú, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Phú"
	}],
	"94": [{
      name: "VM+ HCM 47-49-51 Trần Văn Ơn",
      address: "47-49-51 Trần Văn Ơn, Phường Tân Sơn Nhì, Quận Tân Phú, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Phú"
	}],
	"95": [{
      name: "VM+ HCM 20 Sơn Kỳ",
      address: "20 Đường Sơn Kỳ, Phường Sơn Kỳ, Quận Tân Phú, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Phú"
	}],
	"96": [{
      name: "VM+ HCM 68-70 Đường CN1",
      address: "68-70 Đường CN1, Phường Sơn Kỳ, Quận Tân Phú, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Tân Phú"
	}],
	"97": [{
      name: "VM+ HCM 24 Đoàn Kết",
      address: "24 Đoàn kết, Khu Phố 2, Phường Bình Thọ, Quận Thủ Đức, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Thủ Đức"
	}],
	"98": [{
      name: "VM+ HCM 744 Tỉnh lộ 43",
      address: "744 Tỉnh lộ 43, KP3, Phường Bình Chiểu, Quận Thủ Đức, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Thủ Đức"
	}],
	"99": [{
      name: "VM+ HCM 71 đường số 6",
      address: "71 đường số 6, KP1, Phường Linh Xuân, Quận Thủ Đức, TP.HCM",
      province: "Hồ Chí Minh",
      district: "Quận Thủ Đức"
	}],
	"100": [{
      name: "VM+ HCM 60 Lê Văn Chí (2)",
      address: "60 Lê Văn Chí, Khu Phố 3, Phường Linh Trung, Quận Thủ Đức, TP. HCM",
      province: "Hồ Chí Minh",
      district: "Quận Thủ Đức"
    }],
  }
}
var loading = function() {
  var timing = performance.timing,
    timeLoad = timing.loadEventEnd - timing.responseEnd,
    per = 0;

  interval_load = setInterval(function() {
    per += (timing.responseEnd / timing.loadEventEnd - per) / 5;
    setPercent(per);

    if (per >= 100) {
      clearInterval(interval_load);
      // document.getElementById("preloader").style.display = "none";
      // setTimeout(function() {
      //   window.showCanvas();
      // }, 500);
      // document.getElementById("bar_wrap").style.display = "block";
    }
  }, 36 / 1000);
};

function setPercent(percentTime) {
  jQuery("#loading .bar-item").css({
    width: Math.round(percentTime*100) + "%"
  });
  jQuery("#loading .bar-item").text(Math.round(percentTime*100) + "%");
}

APP.Modal = {
  _el: {},
  _btnModal: {},
  _btnClose:{},
  _overlay:{},
  _data: {},
  _id: {},
  _modalOverlay: {},
  _html : {},

	init: function() {
    var self = this;
    self._el = jQuery('.modal');
    self._body = jQuery('body');
    self._btnModal = jQuery('[data-modal]');
    self._btnClose = self._el.find('.modal-close');
    self._overlay = jQuery('#overlay');
    self._modalOverlay = self._el.find('.modal-overlay');

    self.initEvent();
  },
  initEvent: function() {
    var self = this;
    self._btnModal.on('click', function(e) {
      e.preventDefault();
      self.show(jQuery(this));
    });

    self._btnClose.on('click', function(e) {
      e.preventDefault();
      self.close();
    });
    self._modalOverlay.on('click', self.close);
  },
  show: function(elm) {
    var self = this;
    self._el = jQuery('.modal');
    self._body = jQuery('body');
    self._data = elm.data('modal');
    self._id = jQuery('#'+self._data);

    if(self._el.hasClass(CLASS._modalOpen)) {
      TweenMax.to(self._el, 0.3, {
        alpha: 0,
        display: 'none',
        ease: Power2.easeIn,
        onComplete: function() {
          self._el.removeClass(CLASS._modalOpen);
        }
      })
      TweenMax.to(self._id, 0.3, {
        alpha: 1,
        display: 'block',
        ease: Power2.easeIn,
        onComplete: function() {
          self._id.addClass(CLASS._modalOpen);
          self._body.addClass(CLASS._modalOpen);
        }
      })
    } else {
      TweenMax.to(self._id, 0.3, {
        alpha: 1,
        display: 'block',
        ease: Power2.easeIn,
        onComplete: function() {
          self._id.addClass(CLASS._modalOpen);
          self._body.addClass(CLASS._modalOpen);
        }
      })
    }
  },
  close: function() {
    var self = this;
    self._el = jQuery('.modal');
    self._body = jQuery('body');

    TweenMax.to(self._el, 0.3, {
      alpha: 0,
      display: 'none',
      ease: Power2.easeIn,
      onComplete: function() {
        self._el.removeClass(CLASS._modalOpen);
        self._body.removeClass(CLASS._modalOpen);
      }
    })
  }
}

var Modal = function(element) {
  var elm = jQuery(element),
    body = jQuery('body'),
    btnClose = elm.find('.btn-close');

  this.show = function() {
    TweenMax.to(elm, 0.5, {
      alpha: 1,
      display: 'block',
      ease: Power2.easeIn,
      onComplete: function() {
        elm.addClass(CLASS._modalOpen);
        body.addClass(CLASS._modalOpen);
      }
    })
  }

  this.close = function() {
    TweenMax.to(elm, 0.3, {
      alpha: 0,
      display: 'none',
      ease: Power2.easeIn,
      onComplete: function() {
        elm.removeClass(CLASS._modalOpen);
        body.removeClass(CLASS._modalOpen);
      }
    })
  }

  return this;
}

var alert = function(text) {
  var elm = jQuery('#modal-alert'),
    body = jQuery('body'),
    text = text;

  this.show = function() {
    TweenMax.to(elm, 0.01, {
      display: 'block',
      ease: Power2.easeIn,
      onComplete: function() {
        TweenMax.to(elm, 0.5, {
          alpha : 1,
        })
        elm.addClass(CLASS._modalOpen);
        body.addClass(CLASS._modalOpen);
        initDOM(elm, text);
      }
    })
  }

  this.close = function() {
    btnClose.trigger('click');
  }

  function initDOM(id,txt) {
    var idModal = jQuery(id),
      text = idModal.find('p');

    text.html(txt);
  }

  show();

	return this;
}

var modalContact = function() {
  var elm = jQuery('#modal-contact'),
    body = jQuery('body');

  this.show = function() {
    TweenMax.to(elm, 0.5, {
      alpha: 1,
      display: 'block',
      ease: Power2.easeIn,
      onComplete: function() {
        var id = Math.random();
        elm.find('#captchaImage').attr('src', 'captcha.php?id='+id);
        elm.addClass(CLASS._modalOpen);
        body.addClass(CLASS._modalOpen);
      }
    })
  }

  this.close = function() {
    TweenMax.to(elm, 0.3, {
      alpha: 0,
      display: 'none',
      ease: Power2.easeIn,
      onComplete: function() {
        elm.removeClass(CLASS._modalOpen);
        body.removeClass(CLASS._modalOpen);
      }
    })
  }

  return this;
}
var niceSelect = function(el) {

	var el = $(el),
			currentSelect = el.find('.current'),
			list = el.find('.list'),
			option = el.find('.option'),
			input = el.find('input'),
			selected = el.find('.selected'),
			nameOfSelected = selected.text(),
      nameDefaultOption = option.first().text(),
			valueOfOption,
			nameOfOption,
			overlay = $('.nice-select-overlay');

  function init() {
		el.addClass('nice-select');

  	if(option.hasClass('selected')) {
  		currentSelect.text(nameOfSelected);
  	} else {
      currentSelect.text(nameDefaultOption);
    }

  	el.click(function(e) {
      e.stopPropagation();
  		if(el.hasClass('open')) {
				list.hasClass('has-overlay') && overlay.addClass('hidden');
				el.removeClass('open');
  			list.slideUp(300)
  		} else {
				list.hasClass('has-overlay') && overlay.removeClass('hidden');
				el.addClass('open');
	  		list.slideDown(300);
  		}
  	});

    APP._html.click(function(){
      list.slideUp(300, function() {
          el.removeClass('open');
					list.hasClass('has-overlay') && overlay.addClass('hidden');
        })
    });

  	option.click(function() {
  		nameOfOption = $(this).text();
  		valueOfOption = $(this).attr('data-value');
  		currentSelect.text(nameOfOption);
  		input.val(valueOfOption);
      input.trigger("change");
			list.find('.option.selected').removeClass('selected');
			$(this).addClass('selected');
  	});
  }

  function initCss() {
    var widthList = list.width();
    option.outerWidth(widthList);
  }

  function initResize() {
    $(window).resize(function() {
      initCss();
    })
  }

  init();
  initCss();
  initResize();
}
APP.plugins = {
  init: function() {
    var self = this;
    self.selectric();
  },

  selectric: function() {
    jQuery('.selectric-select').selectric({
			disableOnMobile: false,
			nativeOnMobile: false
		});
  }
}
var provinceVN = {"1":{"name":"Cần Thơ","districts":{"66":"Cờ Đỏ","67":"Phong Điền","68":"Thới Lai","69":"Vĩnh Thạnh","70":"Bình Thủy","71":"Cái Răng","72":"Ninh Kiều","73":"Ô Môn","74":"Thốt Nốt"}},"2":{"name":"Đà Nẵng","districts":{"76":"Hòa Vang","77":"Hoàng Sa","78":"Cẩm Lệ","79":"Hải Châu","80":"Liên Chiểu","81":"Ngũ Hành Sơn","82":"Sơn Trà","83":"Thanh Khê"}},"3":{"name":"Hà Nội","districts":{"85":"Ba Vì","86":"Chương Mỹ","87":"Đan Phượng","88":"Đông Anh","89":"Gia Lâm","90":"Hoài Đức","91":"Mê Linh","92":"Mỹ Đức","93":"Phú Xuyên","94":"Phúc Thọ","95":"Quốc Oai","96":"Sóc Sơn","97":"Thạch Thất","98":"Thanh Oai","99":"Thanh Trì","100":"Thường Tín","101":"Từ Liêm","102":"ứng Hòa","103":"Ba Đình","104":"Cầu Giấy","105":"Đống Đa","106":"Hà Đông","107":"Hai Bà Trưng","108":"Hoàn Kiếm","109":"Hoàng Mai","110":"Long Biên","111":"Tây Hồ","112":"Thanh Xuân","113":"Thị xã Sơn Tây"}},"4":{"name":"Hải Phòng","districts":{"115":"An Dương","116":"An Lão","117":"Bạch Long Vĩ","118":"Cát Hải","119":"Kiến Thụy","120":"Thủy Nguyên","121":"Tiên Lãng","122":"Vĩnh Bảo","123":"Đồ Sơn","124":"Dương Kinh","125":"Hải An","126":"Hồng Bàng","127":"Kiến An","128":"Lê Chân","129":"Ngô Quyền"}},"5":{"name":"Hồ Chí Minh","districts":{"131":"Bình Chánh","132":"Cần Giờ","133":"Củ Chi","134":"Hóc Môn","135":"Nhà Bè","136":"1","137":"10","138":"11","139":"12","140":"2","141":"3","142":"4","143":"5","144":"6","145":"7","146":"8","147":"9","148":"Bình Tân","149":"Bình Thạnh","150":"Gò Vấp","151":"Phú Nhuận","152":"Tân Bình","153":"Tân Phú","154":"Thủ Đức"}},"6":{"name":"An Giang","districts":{"155":"An Phú","156":"Châu Phú","157":"Châu Thành","158":"Chợ Mới","159":"Phú Tân","160":"Thoại Sơn","161":"Tịnh Biên","162":"Tri Tôn","163":"Long Xuyên","164":"Thị xã Châu Đốc","165":"Thị xã Tân Châu"}},"7":{"name":"Bà Rịa-Vũng Tàu","districts":{"166":"Châu Đức","167":"Côn Đảo","168":"Đất Đỏ","169":"Long Điền","170":"Tân Thành","171":"Xuyên Mộc","172":"Vũng Tàu","173":"Thị xã Bà Rịa"}},"8":{"name":"Bắc Giang","districts":{"174":"Hiệp Hòa","175":"Lạng Giang","176":"Lục Nam","177":"Lục Ngạn","178":"Sơn Động","179":"Tân Yên","180":"Việt Yên","181":"Yên Dũng","182":"Yên Thế","183":"Bắc Giang"}},"9":{"name":"Bắc Kạn","districts":{"184":"Ba Bể","185":"Bạch Thông","186":"Chợ Đồn","187":"Chợ Mới","188":"Na Rì","189":"Ngân Sơn","190":"Pác Nặm","191":"Thị xã Bắc Kạn"}},"10":{"name":"Bạc Liêu","districts":{"192":"Đông Hải","193":"Giá Rai","194":"Hòa Bình","195":"Hồng Dân","196":"Phước Long","197":"Vĩnh Lợi","198":"Bạc Liêu"}},"11":{"name":"Bắc Ninh","districts":{"199":"Gia Bình","200":"Lương Tài","201":"Quế Võ","202":"Thuận Thành","203":"Tiên Du","204":"Yên Phong","205":"Bắc Ninh","206":"Thị xã Từ Sơn"}},"12":{"name":"Bến Tre","districts":{"207":"Ba Tri","208":"Bình Đại","209":"Châu Thành","210":"Chợ Lách","211":"Giồng Trôm","212":"Mỏ Cày Bắc","213":"Mỏ Cày Nam","214":"Thạnh Phú","215":"Bến Tre"}},"13":{"name":"Bình Định","districts":{"216":"An Lão","217":"An Nhơn","218":"Hoài  Ân","219":"Hoài Nhơn","220":"Phù Mỹ","221":"Phù cát","222":"Tây Sơn","223":"Tuy Phước","224":"Vân Canh","225":"Vĩnh Thạnh","226":"Quy Nhơn"}},"14":{"name":"Bình Dương","districts":{"227":"Bến Cát","228":"Dầu Tiếng","229":"Dĩ An","230":"Phú Giáo","231":"Tân Uyên","232":"Thuận An","233":"Thị xã Thủ Dầu Một"}},"15":{"name":"Bình Phước","districts":{"234":"Bù Đăng","235":"Bù Đốp","236":"Bù Gia Mập","237":"Chơn Thành","238":"Đồng Phú","239":"Hớn Quản","240":"Lộc Ninh","241":"Thị xã Bình Long","242":"Thị xã Đồng Xoài","243":"Thị xã Phước Long"}},"16":{"name":"Bình Thuận","districts":{"244":" Đức Linh","245":"Bắc Bình","246":"Hàm Tân","247":"Hàm Thuận Bắc","248":"Hàm Thuận Nam","249":"Phú Qúi","250":"Tánh Linh","251":"Tuy Phong","252":"Phan Thiết","253":"Thị xã La Gi"}},"17":{"name":"Cà Mau","districts":{"254":"Cái Nước","255":"Đầm Dơi","256":"Năm Căn","257":"Ngọc Hiển","258":"Phú Tân","259":"Thới Bình","260":"Trần Văn Thời","261":"U Minh","262":"Cà Mau"}},"18":{"name":"Cao Bằng","districts":{"263":"Bảo Lạc","264":"Bảo Lâm","265":"Hạ Lang","266":"Hà Quảng","267":"Hòa An","268":"Nguyên Bình","269":"Phục Hòa","270":"Quảng Uyên","271":"Thạch An","272":"Thông Nông","273":"Trà Lĩnh","274":"Trùng Khánh","275":"Thị xã Cao Bằng"}},"19":{"name":"Đắk Lắk","districts":{"276":"Buôn Đôn","277":"Cư Kuin","278":"Cư MGar","279":"Ea Kar","280":"Ea Súp","281":"EaHLeo","282":"Krông Ana","283":"Krông Bông","284":"Krông Búk","285":"Krông Năng","286":"Krông Pắc","287":"Lắk","288":"MDrắk","289":"Buôn Ma Thuột","290":"Thị xã Buôn Hồ"}},"20":{"name":"Đắk Nông","districts":{"291":"Cư Jút","292":"Đắk GLong","293":"Đắk Mil","294":"Đắk RLấp","295":"Đắk Song","296":"KRông Nô","297":"Tuy Đức","298":"Thị xã Gia Nghĩa"}},"21":{"name":"Điện Biên","districts":{"299":"Điện Biên","300":"Điện Biên Đông","301":"Mường Chà","302":"Mương Nhé","303":"Mường ảng","304":"Tủa Chùa","305":"Tuần Giáo","306":"Điện Biên phủ","307":"Thị xã Mường Lay"}},"22":{"name":"Đồng Nai","districts":{"308":"Cẩm Mỹ","309":"Định Quán","310":"Long Thành","311":"Nhơn Trạch","312":"Tân Phú","313":"Thống Nhất","314":"Trảng Bom","315":"Vĩnh Cửu","316":"Xuân Lộc","317":"Biên Hòa","318":"Thị xã Long Khánh"}},"23":{"name":"Đồng Tháp","districts":{"319":"Cao Lãnh","320":"Châu Thành","321":"Hồng Ngự","322":"Lai Vung","323":"Lấp Vò","324":"Tam Nông","325":"Tân Hồng","326":"Thanh Bình","327":"Tháp Mười","328":"Cao Lãnh","329":"Thị xã Hồng Ngự","330":"Thị xã Sa Đéc"}},"24":{"name":"Gia Lai","districts":{"331":"Chư Păh","332":"Chư Pưh","333":"Chư Sê","334":"ChưPRông","335":"Đăk Đoa","336":"Đăk Pơ","337":"Đức Cơ","338":"Ia Grai","339":"Ia Pa","340":"KBang","341":"KBang","342":"Kông Chro","343":"Krông Pa","344":"Mang Yang","345":"Phú Thiện","346":"Plei Ku","347":"Thị xã AYun Pa","348":"Thị xã An Khê"}},"25":{"name":"Hà Giang","districts":{"349":"Bắc Mê","350":"Bắc Quang","351":"Đồng Văn","352":"Hoàng Su Phì","353":"Mèo Vạc","354":"Quản Bạ","355":"Quang Bình","356":"Vị Xuyên","357":"Xín Mần","358":"Yên Minh","359":"Hà Giang"}},"26":{"name":"Hà Nam","districts":{"360":"Bình Lục","361":"Duy Tiên","362":"Kim Bảng","363":"Lý Nhân","364":"Thanh Liêm","365":"Phủ Lý"}},"27":{"name":"Hà Tĩnh","districts":{"366":"Cẩm Xuyên","367":"Can Lộc","368":"Đức Thọ","369":"Hương Khê","370":"Hương Sơn","371":"Kỳ Anh","372":"Lộc Hà","373":"Nghi Xuân","374":"Thạch Hà","375":"Vũ Quang","376":"Hà Tĩnh","377":"Thị xã Hồng Lĩnh"}},"28":{"name":"Hải Dương","districts":{"378":"Bình Giang","379":"Cẩm Giàng","380":"Gia Lộc","381":"Kim Thành","382":"Kinh Môn","383":"Nam Sách","384":"Ninh Giang","385":"Thanh Hà","386":"Thanh Miện","387":"Tứ Kỳ","388":"Hải Dương","389":"Thị xã Chí Linh"}},"29":{"name":"Hậu Giang","districts":{"390":"Châu Thành","391":"Châu Thành A","392":"Long Mỹ","393":"Phụng Hiệp","394":"Vị Thủy","395":"Vị Thanh","396":"Thị xã Ngã Bảy"}},"30":{"name":"Hòa Bình","districts":{"397":"Cao Phong","398":"Đà Bắc","399":"Kim Bôi","400":"Kỳ Sơn","401":"Lạc Sơn","402":"Lạc Thủy","403":"Lương Sơn","404":"Mai Châu","405":"Tân Lạc","406":"Yên Thủy","407":"Hòa Bình"}},"31":{"name":"Hưng Yên","districts":{"408":"Ân Thi","409":"Khoái Châu","410":"Kim Động","411":"Mỹ Hào","412":"Phù Cừ","413":"Tiên Lữ","414":"Văn Giang","415":"Văn Lâm","416":"Yên Mỹ","417":"Hưng Yên"}},"32":{"name":"Khánh Hòa","districts":{"418":"Cam Lâm","419":"Diên Khánh","420":"Khánh Sơn","421":"Khánh Vĩnh","422":"Ninh Hòa","423":"Trường Sa","424":"Vạn Ninh","425":"Nha Trang","426":"Thị xã Cam Ranh"}},"33":{"name":"Kiên Giang","districts":{"427":"An Biên","428":"An Minh","429":"Châu Thành","430":"Giang Thành","431":"Giồng Riềng","432":"Gò Quao","433":"Hòn Đất","434":"Kiên Hải","435":"Kiên Lương","436":"Phú Quốc","437":"Tân Hiệp","438":"U Minh Thượng","439":"Vĩnh Thuận","440":"Rạch Giá","441":"Thị xã Hà Tiên"}},"34":{"name":"Kon Tum","districts":{"442":"Đắk Glei","443":"Đắk Hà","444":"Đắk Tô","445":"Kon Plông","446":"Kon Rẫy","447":"Ngọc Hồi","448":"Sa Thầy","449":"Tu Mơ Rông","450":"Kon Tum"}},"35":{"name":"Lai Châu","districts":{"451":"Mường Tè","452":"Phong Thổ","453":"Sìn Hồ","454":"Tam Đường","455":"Tân Uyên","456":"Than Uyên","457":"Thị xã Lai Châu"}},"36":{"name":"Lâm Đồng","districts":{"458":"Bảo Lâm","459":"Cát Tiên","460":"Đạ Huoai","461":"Đạ Tẻh","462":"Đam Rông","463":"Di Linh","464":"Đơn Dương","465":"Đức Trọng","466":"Lạc Dương","467":"Lâm Hà","468":"Bảo Lộc","469":"Đà Lạt"}},"37":{"name":"Lạng Sơn","districts":{"470":"Bắc Sơn","471":"Bình Gia","472":"Cao Lộc","473":"Chi Lăng","474":"Đình Lập","475":"Hữu Lũng","476":"Lộc Bình","477":"Tràng Định","478":"Văn Lãng","479":"Văn Quan","480":"Lạng Sơn"}},"38":{"name":"Lào Cai","districts":{"481":"Bắc Hà","482":"Bảo Thắng","483":"Bảo Yên","484":"Bát Xát","485":"Mường Khương","486":"Sa Pa","487":"Si Ma Cai","488":"Văn Bàn","489":"Lào Cai"}},"39":{"name":"Long An","districts":{"490":"Bến Lức","491":"Cần Đước","492":"Cần Giuộc","493":"Châu Thành","494":"Đức Hòa","495":"Đức Huệ","496":"Mộc Hóa","497":"Tân Hưng","498":"Tân Thạnh","499":"Tân Trụ","500":"Thạnh Hóa","501":"Thủ Thừa","502":"Vĩnh Hưng","503":"Tân An"}},"40":{"name":"Nam Định","districts":{"504":"Giao Thủy","505":"Hải Hậu","506":"Mỹ Lộc","507":"Nam Trực","508":"Nghĩa Hưng","509":"Trực Ninh","510":"Vụ Bản","511":"Xuân Trường","512":"ý Yên","513":"Nam Định"}},"41":{"name":"Nghệ An","districts":{"514":"Anh Sơn","515":"Con Cuông","516":"Diễn Châu","517":"Đô Lương","518":"Hưng Nguyên","519":"Kỳ Sơn","520":"Nam Đàn","521":"Nghi Lộc","522":"Nghĩa Đàn","523":"Quế Phong","524":"Quỳ Châu","525":"Quỳ Hợp","526":"Quỳnh Lưu","527":"Tân Kỳ","528":"Thanh Chương","529":"Tương Dương","530":"Yên Thành","531":"Vinh","532":"Thị xã Cửa Lò","533":"Thị xã Thái Hòa"}},"42":{"name":"Ninh Bình","districts":{"534":"Gia Viễn","535":"Hoa Lư","536":"Kim Sơn","537":"Nho Quan","538":"Yên Khánh","539":"Yên Mô","540":"Ninh Bình","541":"Thị xã Tam Điệp"}},"43":{"name":"Ninh Thuận","districts":{"542":"Huyên Bác ái","543":"Ninh Hải","544":"Ninh Phước","545":"Ninh Sơn","546":"Thuận Bắc","547":"Thuận Nam","548":"Phan Rang-Tháp Chàm"}},"44":{"name":"Phú Thọ","districts":{"549":"Cẩm Khê","550":"Đoan Hùng","551":"Hạ Hòa","552":"Lâm Thao","553":"Phù Ninh","554":"Tam Nông","555":"Tân Sơn","556":"Thanh Ba","557":"Thanh Sơn","558":"Thanh Thủy","559":"Yên Lập","560":"Việt Trì","561":"Thị xã Phú Thọ"}},"45":{"name":"Phú Yên","districts":{"562":"Đông Hòa","563":"Đồng Xuân","564":"Phú Hòa","565":"Sơn Hòa","566":"Sông Hinh","567":"Tây Hòa","568":"Tuy An","569":"Tuy Hòa","570":"Thị xã Sông Cầu"}},"46":{"name":"Quảng Bình","districts":{"571":"Bố Trạch","572":"Lệ Thủy","573":"MinhHoá","574":"Quảng Ninh","575":"Quảng Trạch","576":"Tuyên Hoá","577":"Đồng Hới"}},"47":{"name":"Quảng Nam","districts":{"578":"Bắc Trà My","579":"Đại Lộc","580":"Điện Bàn","581":"Đông Giang","582":"Duy Xuyên","583":"Hiệp Đức","584":"Nam Giang","585":"Nam Trà My","586":"Nông Sơn","587":"Núi Thành","588":"Phú Ninh","589":"Phước Sơn","590":"Quế Sơn","591":"Tây Giang","592":"Thăng Bình","593":"Tiên Phước","594":"Hội An","595":"Tam Kỳ"}},"48":{"name":"Quảng Ngãi","districts":{"596":"Ba Tơ","597":"Bình Sơn","598":"Đức Phổ","599":"Lý sơn","600":"Minh Long","601":"Mộ Đức","602":"Nghĩa Hành","603":"Sơn Hà","604":"Sơn Tây","605":"Sơn Tịnh","606":"Tây Trà","607":"Trà Bồng","608":"Tư Nghĩa","609":"Quảng Ngãi"}},"49":{"name":"Quảng Ninh","districts":{"610":"Ba Chẽ","611":"Bình Liêu","612":"Cô Tô","613":"Đầm Hà","614":"Đông Triều","615":"Hải Hà","616":"Hoành Bồ","617":"Tiên Yên","618":"Vân Đồn","619":"Yên Hưng","620":"Hạ Long","621":"Móng Cái","622":"Thị xã Cẩm Phả","623":"Thị xã Uông Bí"}},"50":{"name":"Quảng Trị","districts":{"624":"Cam Lộ","625":"Cồn Cỏ","626":"Đa Krông","627":"Gio Linh","628":"Hải Lăng","629":"Hướng Hóa","630":"Triệu Phong","631":"Vính Linh","632":"Đông Hà","633":"Thị xã Quảng Trị"}},"51":{"name":"Sóc Trăng","districts":{"634":"Châu Thành","635":"Cù Lao Dung","636":"Kế Sách","637":"Long Phú","638":"Mỹ Tú","639":"Mỹ Xuyên","640":"Ngã Năm","641":"Thạnh Trị","642":"Trần Đề","643":"Vĩnh Châu","644":"Sóc Trăng"}},"52":{"name":"Sơn La","districts":{"645":"Bắc Yên","646":"Mai Sơn","647":"Mộc Châu","648":"Mường La","649":"Phù Yên","650":"Quỳnh Nhai","651":"Sông Mã","652":"Sốp Cộp","653":"Thuận Châu","654":"Yên Châu","655":"Sơn La"}},"53":{"name":"Tây Ninh","districts":{"656":"Bến Cầu","657":"Châu Thành","658":"Dương Minh Châu","659":"Gò Dầu","660":"Hòa Thành","661":"Tân Biên","662":"Tân Châu","663":"Trảng Bàng","664":"Thị xã Tây Ninh"}},"54":{"name":"Thái Bình","districts":{"665":"Đông Hưng","666":"Hưng Hà","667":"Kiến Xương","668":"Quỳnh Phụ","669":"Thái Thụy","670":"Tiền Hải","671":"Vũ Thư","672":"Thái Bình"}},"55":{"name":"Thái Nguyên","districts":{"673":"Đại Từ","674":"Định Hóa","675":"Đồng Hỷ","676":"Phổ Yên","677":"Phú Bình","678":"Phú Lương","679":"Võ Nhai","680":"Thái Nguyên","681":"Thị xã Sông Công"}},"56":{"name":"Thanh Hóa","districts":{"682":"Bá Thước","683":"Cẩm Thủy","684":"Đông Sơn","685":"Hà Trung","686":"Hậu Lộc","687":"Hoằng Hóa","688":"Lang Chánh","689":"Mường Lát","690":"Nga Sơn","691":"Ngọc Lặc","692":"Như Thanh","693":"Như Xuân","694":"Nông Cống","695":"Quan Hóa","696":"Quan Sơn","697":"Quảng Xương","698":"Thạch Thành","699":"Thiệu Hóa","700":"Thọ Xuân","701":"Thường Xuân","702":"Tĩnh Gia","703":"Triệu Sơn","704":"Vĩnh Lộc","705":"Yên Định","706":"Thanh Hóa","707":"Thị xã Bỉm Sơn","708":"Thị xã Sầm Sơn"}},"57":{"name":"Thừa Thiên Huế","districts":{"709":"A Lưới","710":"Hương Trà","711":"Nam Dông","712":"Phong Điền","713":"Phú Lộc","714":"Phú Vang","715":"Quảng Điền","716":"Huế","717":"thị xã Hương Thủy"}},"58":{"name":"Tiền Giang","districts":{"718":"Cái Bè","719":"Cai Lậy","720":"Châu Thành","721":"Chợ Gạo","722":"Gò Công Đông","723":"Gò Công Tây","724":"Tân Phú Đông","725":"Tân Phước","726":"Mỹ Tho","727":"Thị xã Gò Công"}},"59":{"name":"Trà Vinh","districts":{"728":"Càng Long","729":"Cầu Kè","730":"Cầu Ngang","731":"Châu Thành","732":"Duyên Hải","733":"Tiểu Cần","734":"Trà Cú","735":"Trà Vinh"}},"60":{"name":"Tuyên Quang","districts":{"736":"Chiêm Hóa","737":"Hàm Yên","738":"Na hang","739":"Sơn Dương","740":"Yên Sơn","741":"Tuyên Quang"}},"61":{"name":"Vĩnh Long","districts":{"742":"Bình Minh","743":"Bình Tân","744":"Long Hồ","745":"Mang Thít","746":"Tam Bình","747":"Trà Ôn","748":"Vũng Liêm","749":"Vĩnh Long"}},"62":{"name":"Vĩnh Phúc","districts":{"750":"Bình Xuyên","751":"Lập Thạch","752":"Sông Lô","753":"Tam Đảo","754":"Tam Dương","755":"Vĩnh Tường","756":"Yên Lạc","757":"Vĩnh Yên","758":"Thị xã Phúc Yên"}},"63":{"name":"Yên Bái","districts":{"759":"Lục Yên","760":"Mù Cang Chải","761":"Trạm Tấu","762":"Trấn Yên","763":"Văn Chấn","764":"Văn Yên","765":"Yên Bình","766":"Yên Bái","767":"Thị xã Nghĩa Lộ"}}};
var sliderBanner = function(element, autoplay, timeauto) {

  var elm = jQuery(element),
    listImg = elm.find(".banner-img"),
    imgs = listImg.find("> *"),
		listCopy = elm.find('.banner-copy'),
		hasCopy = listCopy.length >= 1,
    dots = elm.find(".slick-dots"),
    dot = dots.find("> *"),
    total = imgs.length,
    percentTime= 0,
    tick,
    time = 1,
    isProgress = false,
    progressBarIndex = 0;

  function init() {
    createSlick();
    setUp();

    progressBanner();
  }

  function createSlick() {
    listImg.not(".slick-initialized").slick({
      dots: true,
      arrows: !autoplay,
      slidesToShow: 1,
      slidesToScroll: 1,
      fade: true,
      cssEase: 'cubic-bezier(0.87, 0.03, 0.41, 0.9)',
      lazyLoad: 'progressive',
      asNavFor: hasCopy ? listCopy : undefined,
      speed: 1000,
      autoplay: autoplay,
			autoplaySpeed: timeauto * 1000
    });

    hasCopy && listCopy.not('.slick-initialized').slick({
      dots: false,
      arrows: false,
      slidesToShow: 1,
      slidesToScroll: 1,
			fade: true,
			adaptiveHeight: true,
      autoplay: autoplay,
      autoplaySpeed: timeauto * 1000,
      asNavFor: listImg,
    }).slickAnimation();
  }

  function setUp() {
    if (total < 2) {
      listImg.addClass("dotted-hide");
    }

    listImg.on('beforeChange', function (evt, slick, currentSlide, nextSlide) {
			isProgress = false;
      startProgressbar();
		});
  }

  function progressBanner() {
    var dot = elm.find('.slick-dots li');

		dot.each(function (index) {
			var progress = "<button class='inProgress inProgress" + index + "'></button>";
			jQuery(this).html(progress);
		});

		dot.click(function () {
			isProgress = false;
			clearInterval(tick);
			var goToThisIndex = jQuery(this).index();
			listImg.slick('slickGoTo', goToThisIndex, false);
			startProgressbar();
		});

	  startProgressbar();
  }

  function intervalBanner() {

		if (jQuery('[data-slick-index="' + progressBarIndex + '"]').attr('aria-hidden') === 'true') {
			progressBarIndex = jQuery('[aria-hidden="false"]').data('slick-index');
			startProgressbar();
		} else {
			const bufferTime = 0.05; // this buffer time is to make slide progress bar look smoother 
			percentTime = (autoplay || timeauto == 0 ) 
				? 100
				: percentTime + 1 / (timeauto) - bufferTime;
			jQuery('.inProgress' + progressBarIndex).css({
				width: percentTime + '%'
			});
			if (percentTime >= 100) {
        isProgress = true;
        
				if (isProgress) {
					clearTimeout(tick);
					return;
				}
				listImg.slick('slickNext');
				progressBarIndex++;
				if (progressBarIndex > 2) {
					progressBarIndex = 0;
				}
				startProgressbar();
			}
		}
  }

  function startProgressbar() {
		resetProgressbar();
		percentTime = 0;
		tick = setInterval(intervalBanner, 10);
	}

	function resetProgressbar() {
		jQuery('.inProgress').css({
			width: '0%'
		});
		clearInterval(tick);
	}

  init();
  return this;
};

var newsEvents = function(element) {
	var elm = jQuery(element),
		item = elm.find(".newevent");

  function init() {
		setup();
		createSlick();
  }

  function createSlick() {
    elm.not('.slick-initialized').slick({
      dots: false,
      arrows: false,
      slidesToShow: 3,
      slidesToScroll: 1,
			focusOnSelect: true,
			responsive: [
				{
					breakpoint: 1120,
					settings: {
						arrows: false,
						dots: true
					}
				},
				{
					breakpoint: 640,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 1,
						dots: true
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						dots: true
					}
				}
			]
    })
	}
	
	function setup() {
		if(item.length < 4) {
			elm.addClass('dotted-hide');
		}
	}

  init();
  return this;
}

var sliderSpecs = function() {
  var crs,
      crsElm = document.querySelector(".vf-specs .specs"),
      divider = jQuery('.vf-specs .divider');
      
		if (!crsElm) return;

		function specs() {
			var w = Math.max(
				document.documentElement.clientWidth,
				window.innerWidth || 0
			);

			if (w < 767 && !crs) {
				
				crs = jQuery(crsElm).not('.slick-initialized').slick({
					infinite: true,
					slidesToShow: 1,
					slidesToScroll: 1,
					dots: true,
					arrows: false,
				});
			} else if (w > 767 && crs) {
				jQuery(crsElm).slick('unslick');
				crs = null;
			}
		}

		specs();

		jQuery(window).resize(function () {
			specs();
		})
}

var sliderTechnology = function() {
  var crs,
      crsElm = document.querySelector(".vf-technology .technology-list");

		if (!crsElm) return;

		function technology() {
			var w = Math.max(
				document.documentElement.clientWidth,
				window.innerWidth || 0
			);

			if (w < 767 && !crs) {
				crs = jQuery(crsElm).not('.slick-initialized').slick({
					infinite: true,
					slidesToShow: 1,
					slidesToScroll: 1,
					dots: true,
          arrows: false,
          adaptiveHeight: true
				});
			} else if (w > 767 && crs) {
				jQuery(crsElm).slick('unslick');
				crs = null;
			}
		}

		technology();

		jQuery(window).resize(function () {
			technology();
		})
}

var hastags = function(element) {
	var elm = jQuery(element),
	item = elm.find(".hastag");

  function init() {
		setup();
    createSlick();
  }

  function createSlick() {
    elm.not('.slick-initialized').slick({
      dots: false,
      arrows: true,
      slidesToShow: 3,
      slidesToScroll: 1,
			focusOnSelect: true,
			responsive: [
				{
					breakpoint: 1120,
					settings: {
						arrows: false,
						dots: true
					}
				},
				{
					breakpoint: 640,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 1,
						dots: true
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						dots: true
					}
				}
			]
    })
	}
	
	function setup() {
		if(item.length < 4) {
			elm.addClass('dotted-hide');
		}
	}

  init();
  return this;
}
var tabEvent = function(element) {
  var el = jQuery(element),
    tab = el.find(".tab"),
    item = tab.find("a"),
    select = el.find('select'),
    content = el.find(".content");

  function init() {
    setup();
    content.eq(0).show().addClass("active");
    item.eq(0).addClass("active");

    handleClick();
    handleSelect();
  }

  function handleClick() {
    item.on("click", function(e) {
      e.preventDefault();
      if (jQuery(this).parent().hasClass("active"))  return;

      setup();
      jQuery(this).parent().addClass("active");
      jQuery(this).parent().siblings().removeClass("active");

      target = jQuery(this).attr("href");
      jQuery(".tab-content > div").not(target).hide().removeClass("active");

      jQuery(target).fadeIn(600).addClass("active");
    });
  }

  function handleSelect() {
    select.on('change', function() {
      var val = jQuery(this).val();
      setup();
      jQuery(".tab-content > div").not('#' + val).hide().removeClass("active");

      jQuery('#' + val).fadeIn(600).addClass("active");
    })
  }

  function setup() {
    content.hide();
    item.removeClass("active");
  }

  init();
  return;
};
var watchVideo = function (element) {
  var videos = jQuery('.videos video');

  function init() {
    $(window).on('resize scroll', function () {
      videos.each(function () {
        jQuery(this).attr('controlsList', 'nodownload');
        if (jQuery(this).isInViewport()) {
          jQuery(this)[0].play();
        } else {
          jQuery(this)[0].pause();
        }
      })
    });
  }

  init();
  return;
};

$.fn.isInViewport = function () {
  var elementTop = $(this).offset().top;
  var elementBottom = elementTop + $(this).outerHeight();

  var viewportTop = $(window).scrollTop();
  var viewportBottom = viewportTop + $(window).height();

  return elementBottom > viewportTop && elementTop < viewportBottom;
};
APP.brochure = {
	_el: {},
  _sliderBanner: {},
  
  init: function() {
		self._el = jQuery('.vf-brochure-page');
		self._sliderBanner = self._el.find('.vf-banner');

    new sliderBanner(self._sliderBanner, true, 3);

    const loadCarousel = () => {
      // hide current item on carousel
      const availableItems = $('.vf-carousel-watch .carousel__data .carousel__item:not(.on-show)')
      
      $('.vf-carousel-watch .carousel__container').innerHTML = '';
      $('.vf-carousel-watch .carousel__container').removeClass().addClass('carousel__container').html(availableItems.clone());
      Carousel();
    };

    const updateCarousel = () => {
      const dataIndex = $('.vf-carousel-watch .player video').attr('data-index');

      $('.vf-carousel-watch .carousel__data .carousel__item.on-show').removeClass('on-show');
      $('.vf-carousel-watch .carousel__data .carousel__item[data-index="' + dataIndex + '"]').addClass('on-show');

      loadCarousel();
    };

    const initCarouselData = () => {
      const items = $('.vf-carousel-watch .carousel__data .carousel__item');
      items.each( (index, item) => {
        dataSrc = $(item).find('video source').attr('data-src');
        dataSrc && dataSrc.length > 0 && $(item).addClass('is-video');
      });

      updateCarousel();
    }

    const loadPlayerThumbnail = () => {
      const src = $('.vf-carousel-watch .player video source').attr('src');
      const thumbnail = $('.vf-carousel-watch .player .thumbnail');
      const video = $('.vf-carousel-watch .player video');
      if (src && src.length > 0) {
        thumbnail.hide();
        video.show();
      } else {
        thumbnail.show();
        video.hide();
      }
    };

    const loadMaintenanceItemPhoto = () => {
      let photo = $('.vf-maintenance .highlights .item.active').attr('data-src');
      let photoOnMobile = $('.vf-maintenance .highlights .item.active').attr('data-src-mb');

      $('.vf-maintenance .photo .img--dt').attr('src', photo);
      $('.vf-maintenance .photo .img--mb').attr('src', photoOnMobile);
    };

    initCarouselData();
    
    loadPlayerThumbnail();

    // click on an item - related content carousel
    $('.vf-carousel-watch .carousel').on('click', '.carousel__item', function() {
      // Carousel Item: 
      const dataSrc = $(this).find('video source').attr('data-src');
      const index = $(this).attr('data-index');
      const thumbnailSrc = $(this).find('.thumbnail .photo').css('background-image');

      // Player: 
      const player = $('.vf-carousel-watch .player video');
      const source = $('.vf-carousel-watch .player video source');
      const thumbnail = $('.vf-carousel-watch .player .thumbnail');

      // Update player
      source.attr('src', dataSrc)
      player.attr('data-index', index)
      thumbnail.css('background-image', thumbnailSrc);

      // Reload
      player[0].load();
      loadPlayerThumbnail();
      updateCarousel();
    });

    // click on nav tab 
    $('.vf-services .nav-tab .tab-item').click(function() { 
      const dataValue = $(this).attr('data-value');

      $('.vf-services .nav-tab .tab-item.active').removeClass('active');
      $(this).addClass('active');

      $('.vf-services .info .text.active').removeClass('active')
      $('.vf-services .info .text[data-value="' + dataValue + '"]').addClass('active')
    });

    // click on highlight items - maintenance block 
    $('.vf-maintenance .highlights .item').click(function() { 
      $('.vf-maintenance .highlights .current .item').html($(this).html());
      $('.vf-maintenance .highlights .current .item').attr('data-src', $(this).attr('data-src'));
      $('.vf-maintenance .highlights .current .item').attr('data-src-mb', $(this).attr('data-src-mb'));

      $('.vf-maintenance .highlights .item.active').removeClass('active');
      $(this).addClass('active');

      if ($('.vf-maintenance .highlights').hasClass('active')) {
        $('.vf-maintenance .highlights').removeClass('active');
      } else {
        $('.vf-maintenance .highlights').addClass('active');
      }

      loadMaintenanceItemPhoto()
    });
  }
}
/*** PAGE - DEALER ***/
APP.dealer = {
    _el: {},
  
      init: function() {
          var self = this;
          self._el = jQuery('.vf-dealers');
  
          new tabEvent(self._el);
      }
  };
/*** PAGE - FAQs ***/
APP.faqs = {
  _el: {},
  _accordion: {},

	init: function() {
		var self = this;
    self._el = jQuery('.vf-faqs');
    self._accordion = self._el.find('.accordions');

    new tabEvent(self._el);
    new accordion(self._accordion);
	}
};
APP.footer = {
    init: function () {
        var self = APP.footer;

        self._footer = $('.footer');
        self._menu = self._footer.find('.footer-menu');
        self._menuItem = self._menu.find('li');
        self._menuH4 = self._menu.find('h4');        

        self._menuH4.on('click', self.toggleMenuNav);
    },

    toggleMenuNav: function () {
        var self = APP.footer,
            obj = $(this),
            parent = obj.parents('li');

        if (parent.hasClass('js-active')) {
            parent.removeClass('js-active');
        } else {
            self._menuItem.removeClass('js-active');
            parent.addClass('js-active');
        }
    }
};
/*** FORM ***/

var form = function() {
  var country_id;
  var state_id;
  var city_id;

  $.each(provinceVN, function (index, value) {
    $(".js-province-select").append('<option rel="' + index + '" value="'+value.name+'">'+value.name+'</option>');
  });

  $(".js-province-select").on('change', function () {
    $(".js-city-select").find("option:gt(0)").remove();
      $(".js-city-select").find("option:first").text("Loading...");
      country_id = $(this).find('option:selected').attr('rel');
      $.each(provinceVN[country_id].districts, function (index1, value1) {
          $(".js-city-select").find("option:first").text("-Chọn quận huyện-");
          $(".js-city-select").append('<option rel="' + index1 + '" value="'+value1+'">'+value1+'</option>').selectric('refresh');
          $('.js-city-select').selectric('open');
      });
  });
};


/*** HEADER ***/
APP.header = {
    _el: {},
    _html: {},
    _body: {},
    _btnMenu: {},
    _menu: {},
    _arrow: {},
    _search: {},
    _navMobile: {},

    init: function () {
        var self = this;
        self._el = jQuery('.header');
        self._html = jQuery('html');
        self._body = jQuery('body');
        self._menu = self._el.find('.menu');
        self._btnMenu = self._el.find('.btn-menu');
        self._arrow = self._el.find('.js-sub');
        self._search = self._el.find('.search');
        self._navMobile = self._el.find('.header-mobile');

        self.search(self._search);
        self.menuMobile();
        self.submenuModile(self._navMobile);
        self.stickyHeader();

        $('select[name="nav-select"]').on('change', function () {
            var obj = $(this),
                value = obj.val();            

            window.open(value, '_blank');
        });
    },

    search: function (elm) {
        var self = this;

        var el = jQuery(elm),
            btn = el.find('.btn-search'),
            boxSearch = el.find('.box-search'),
            input = el.find('.form-input');

        $(document).on('click', function (e) {
            if (!el.is(e.target) && !el.find('*').is(e.target)) {
                boxSearch.removeClass(CLASS._active);
                input.val('');
            }
        })

        btn.on('click', function () {
            boxSearch.toggleClass(CLASS._active);
            setTimeout(function () {
                input.focus();
            }, 300)
        })
    },

    menuMobile: function () {
        var self = this;

        self._btnMenu.on('click', function () {
            self._html.toggleClass('no-scroll');
            self._body.toggleClass('navbar-open');
        })

        jQuery(window).resize(function () {
            if (jQuery(window).width() < 1023) {
                self._html.removeClass('no-scroll');
                self._body.removeClass('navbar-open');
            }
        })
    },

    submenuModile: function (elm) {
        var self = this;
        var that = jQuery(elm),
            btnArrowdown = that.find('.nav-sub-menu');

        btnArrowdown.on('click', function () {
            let submenu = jQuery(this).find('ul');

            if (jQuery(this).hasClass(CLASS._active)) {
                //jQuery('.icon-arrow-down').removeClass(CLASS._active);
                jQuery(this).removeClass(CLASS._active);
                submenu.slideUp();
            } else {
                //jQuery('.icon-arrow-down').addClass(CLASS._active);
                jQuery('.sub-menu').slideUp();
                btnArrowdown.removeClass(CLASS._active);
                jQuery(this).addClass(CLASS._active);
                submenu.slideDown();
            }
        });
    },

    stickyHeader: function() {
        var self = this;

        var offset = self._el.height();

        jQuery(window).resize(function() {
            offset = self._el.height();
        })

        jQuery(window).scroll(function() {
            if(APP.getScrollTop() > offset) {
                jQuery(self._el).addClass('js-sticky');
            } else {
                jQuery(self._el).removeClass('js-sticky');
            }
        })
    }
};
APP.home = {
	_el: {},
	_sliderBanner: {},
	_newsEvents: {},
	_configure: {},
	_watch: {},

	init: function() {
		var self = this;
		self._el = jQuery('.vf-home');
		self._sliderBanner = self._el.find('.vf-banner');
		self._newsEvents = self._el.find('.newevents-list');
		self._configure = self._el.find('.vf-configure');
		self._watch = self._el.find('.vf-watch');
		
		new sliderBanner(self._sliderBanner, true, 3);
		new newsEvents(self._newsEvents);
		new configureTab(self._configure);
		new chooseColor(self._configure);

		self.video();

		// if(jQuery('body').hasClass('mobile')) {
		// 	self.cookieModal();
		// }
	},

	video: function() {
		var self = this,
			nextEle = self._watch.next(),
			video = self._watch.find('video'),
			flag = true;
		
		self._watch.waypoint({
			handler: function (direction) {
				var source = video.find('source'),
						data = source.data('src');
				video.attr('controlsList', 'nodownload');
				if (direction == 'down' && flag) {
					flag = false;
					source.removeAttr('data-src');
					source.attr('src', data);

					video[0].load();
					video[0].play();
				} 

				if(direction == 'up') {
					video[0].pause();
				} else {
					video[0].play();
				}
			},
			offset: '90%'
		});

		nextEle.waypoint({
			handler: function(direction) {
				if (direction == 'down') {
					video[0].pause();
				} else {
					video[0].play();
				}
			}
		})
	},

	cookieModal: function() {
		var self = this;
		setTimeout(function() {
			new modalContact().show();
		}, 2000);
		// if (!APP.getCookie(VF_ModalForm)) {
		// 	setTimeout(function() {
		// 		new modalContact().show();
		// 	}, 2000);
		// 	APP.setCookie(VF_ModalForm, 1, 1);
		// }
	}
};
APP.maintenance = {
	_el: {},
  _sliderBanner: {},
  
  init: function() {
		self._el = jQuery('.vf-maintenance-page');
		self._sliderBanner = self._el.find('.vf-banner');

    new sliderBanner(self._sliderBanner, true, 3);
  }
}
/*** PAGE - NEWSROOM ***/
APP.newsroom = {
	_el: {},
	_sliderBanner: {},
	_newsEvents: {},
	_localnav: {},

	init: function() {
		var self = this;
		self._el = jQuery('.vf-newsrooms');
		self._sliderBanner = self._el.find('.vf-banner');
		self._newsEvents = self._el.find('.newevents-list');
		self._localnav = document.getElementById('vf-localnav');
		
		new sliderBanner(self._sliderBanner, true, 3);
		new newsEvents(self._newsEvents);
        self.stickyLocalnav();
        self.scrollOtherNews();
	},

	stickyLocalnav: function() {
		var self = this;
		if(self._localnav === null) return;

		var header = jQuery('.header'),
			page = jQuery('.page'),
			overlay = jQuery('#overlay'),
			offset = header.height(),
			actionArrow = jQuery(self._localnav).find('.localnav-content');

		header.addClass('stickynav');
		page.addClass('stickynav');

		jQuery(window).resize(function() {
			offset = header.height();
		})

		jQuery(window).scroll(function() {
			if(APP.getScrollTop() > offset) {
				jQuery(self._localnav).addClass('js-sticking');
			} else {
				overlay.removeClass(CLASS._show);
				jQuery(self._localnav).attr('class', '');
			}
		})

		actionArrow.on('click', function() {
			if (WINDOW.width() < 992) {
                jQuery(self._localnav).toggleClass(CLASS._show);
			    overlay.toggleClass(CLASS._show);
            }
		})

		overlay.on('click', function() {
			actionArrow.trigger('click');
		})
    },
    
    scrollOtherNews: function () {
        var self = APP.newsroom;
        var otherNews = jQuery('.vf-newsroom-other');
        var paging = otherNews.find('.paging');
        var pagingItem = paging.find('.item');

        pagingItem.on('click', function(evt) {
            evt.preventDefault();
            var offsetY = otherNews.offset().top - 50;

            jQuery('html, body').scrollTop(offsetY);
        });
    }
};
const mockPresidentCars = [{
  id: 1,
  title: "BRAHMINY WHITE",
  color: 1,
  roof: 1,
  lazang : 2,
  url : 'images/configure/luxsa2/silver.png',
}, {
  id: 2,
  title: "MYSTIQUE RED",
  color: 1,
  roof: 1,
  lazang : 3,
  url : 'images/configure/luxsa2/red.png',
}, {
  id: 3,
  title: "ACTION ORANGE",
  color: 1,
  roof: 2,
  lazang : 1,
  url : 'images/configure/luxsa2/orange.png',
}, {
  id: 4,
  title: "LUXURY BLUE",
  color: 1,
  roof: 2,
  lazang : 2,
  url : 'images/configure/luxsa2/blue.png',
}, {
  id: 5,
  title: "NEPTUNE GREY",
  color: 2,
  roof: 3,
  lazang : 1,
  url : 'images/configure/luxsa2/grey.png',
}, {
  id: 6,
  title: "JET",
  color: 2,
  roof: 3,
  lazang : 2,
  url : 'images/configure/luxsa2/black.png',
}, {
  id: 7,
  title: "LUXURY BLUE",
  color: 2,
  roof: 3,
  lazang : 3,
  url : 'images/configure/luxsa2/blue.png',
}, {
  id: 8,
  title: "CORMORANT BROWN",
  color: 3,
  roof: 2,
  lazang : 3,
  url : 'images/configure/luxsa2/brown.png',
}];

APP.president = {
  _el: {},
  _sliderBanner: {},
  // The data below is for self-testing
  _presidentCars: typeof drupalSettings !== 'undefined' && drupalSettings.president_car || mockPresidentCars,

  init: function () {
    const self = APP.president;

    self._el = $('.vf-president-page');
    self._sliderBanner = self._el.find('.vf-banner');

    self._gallery = self._el.find('.vf-president-gallery');
    self._galleryPhotoBlock = self._gallery.find('.gallery .block');
    self._galleryPhoto = self._gallery.find('.gallery .block figure');
    self._galleryMobileView = self._gallery.find('.gallery .content .view--mb');
    self._previewer = self._gallery.find('.gallery .content .previewer');
    self._previewerCloseBtn = self._previewer.find('.close');
    self._configure = self._el.find('.vf-configure');
    self._specsTab = self._el.find('.nav-tab');
    self._specsTabItem = self._specsTab.find('.item');
    self._specs = self._el.find('.vf-specification .specs');
    self._btnMore = self._specs.find('.btn-more');
    self._btnMoreMB = self._specs.find('.btn-more-mb');
    self._specsContent = self._specs.find('.content');
    self._specsContentHide = self._specs.find('.content-hide');

    self._modalSpecs = $('.modal-specs');
    self._modalSpecsContent = self._modalSpecs.find('.content');

    self._galleryPhoto.on('click', self.onOpenGalleryPreviewer);
    self._previewerCloseBtn.on('click', self.onCloseGalleryPreviewer);

    self._btnMore.on('click', self.onClickMore);
    self._btnMoreMB.on('click', self.onClickMoreMB);
    $('.specs-close').on('click', self.onClickClose);

    self._specsTabItem.on('click', self.onClickSpecsTab);

    new sliderBanner(self._sliderBanner, false, 0);
    self.initConfigure();

    $('.vf-president-gallery .nav-tab .item').click(function () {
      const dataValue = $(this).attr('data-value');

      $('.vf-president-gallery .nav-tab .item.active').removeClass('active');
      $(this).addClass('active');

      $('.vf-president-gallery .gallery .content.active').removeClass('active');
      $('.vf-president-gallery .gallery .content[data-value="' + dataValue + '"]').addClass('active');
      
      self.initGallery();
    });

    self.initGallery();
  },

  initGallery: function() {
    const self = APP.president;
    const activeGalleryTab = self._gallery.find('.content.active');
    const photoblocks = activeGalleryTab.find('.block');
    const photos = activeGalleryTab.find('.block figure');
    const mobileView = activeGalleryTab.find('.view--mb');
    const previewerSlider = activeGalleryTab.find('.previewer .slider');

    $(mobileView).children().length == 0 &&
      mobileView.html(photoblocks.clone()) &&
      activeGalleryTab.find('.block figure').on('click', self.onOpenGalleryPreviewer);
    $(previewerSlider).children().length == 0 && previewerSlider.html(photos.clone());
    // photos.on('click', self.onOpenGalleryPreviewer);
  },

  onOpenGalleryPreviewer: function () {
    var self = APP.president;
    const dataIndex = $(this).attr('data-index');
    const activePreviewer = self._gallery.find('.gallery .content.active .previewer');
    const slider = activePreviewer.find('.slider');


    $('body').css('overflow', 'hidden');
    activePreviewer.show();
    slider.slick({
      slidesToShow: 1,
      infinite: true
    });
    slider.slick('slickGoTo', dataIndex, true);
  },

  onCloseGalleryPreviewer: function () {
    var self = APP.president;
    const activePreviewer = self._gallery.find('.gallery .content.active .previewer');
    const slider = activePreviewer.find('.slider');

    $('body').css('overflow-y', 'auto');
    slider.slick('unslick');
    activePreviewer.hide();
  },

  onClickMore: function (event) {
    event.preventDefault();
    $('.modal-specs').addClass('active');
    $('body').addClass('is-modal');
  },

  onClickMoreMB: function (event) {
    event.preventDefault();
    var self = APP.specs,
      obj = $(this),
      span = obj.find('span'),
      text = obj.data('text'),
      textShow = obj.data('text-show'),
      posY = self._specs.offset().top - $('.header').height();


    obj.toggleClass('is-show');

    if (obj.hasClass('is-show')) {
      span.text(textShow);
      self._specsContentHide.addClass('active');
    } else {
      span.text(text);
      $('html, body').stop().animate({ scrollTop: posY }, 500, 'swing');
      setTimeout(function () {
        self._specsContentHide.removeClass('active');
      }, 150);
    }
  },

  onClickClose: function (event) {
    event.preventDefault();
    $('.modal-specs').removeClass('active');
    $('body').removeClass('is-modal');
  },

  onClickSpecsTab: function (event) {
    event.preventDefault();

    var self = APP.president,
      obj = $(this),
      index = obj.index();

    const dataValue = $(this).attr('data-value');

    self._specsTabItem.removeClass('active');
    self._specsTabItem.filter( '[data-value="' + dataValue + '"]' ).addClass('active');

    TweenMax.set(self._specsContent, {
      display: 'none'
    });

    TweenMax.set(self._specsContent.eq(index), {
      display: 'block',
      alpha: 0
    });

    TweenMax.to(self._specsContent.eq(index), 0.5, {
      alpha: 1,
      ease: Power1.easeOut
    });

    TweenMax.set(self._modalSpecsContent, {
      display: 'none'
    });

    TweenMax.set(self._modalSpecsContent.eq(index), {
      display: 'block',
      alpha: 0
    });

    TweenMax.to(self._modalSpecsContent.eq(index), 0.5, {
      alpha: 1,
      ease: Power1.easeOut
    });
  },

  initConfigure: function() {
    const self = APP.president;

    self.updateConfigureResult();

    self.initConfigureColor ();
    self.initConfigureRoof ();
    self.initConfigureLazang ();
  },

  initConfigureColor: function() {
    const self = APP.president;
    const el = self._configure;
    const colorConf = el.find(".color-list");
    const colors = colorConf.find("> li");

    colors.each(function() {
      var item = jQuery(this);
      item.on("click", function() {
        var parents = item.parents(".content"),
          name = parents.find('.configure-name .name'),
          imgs = parents.find(".configure-img"),
          img = imgs.find("> *"),
          cl = parents.find('.color-list li'),
          dataName = jQuery(this).data("name"),
          dataValue = jQuery(this).data("value");

        if(jQuery(this).hasClass('active')) return;
        cl.removeClass('active');
        jQuery(this).addClass('active');
        name.text(dataName);
        $(colorConf).attr('data-value', dataValue);

        self.updateConfigureResult();
      });
    });
  },

  initConfigureRoof: function() {
    const self = APP.president;

    niceSelect($('.configure-roof'));

    const roofConfValue = $('.configure-roof input')

    roofConfValue.on('change', function() {
      self.updateConfigureResult({changeRoof: true});
    });
  },

  initConfigureLazang: function() {
    const self = APP.president;

    niceSelect($('.configure-lazang'));

    const lazangConfValue = $('.configure-lazang input')

    lazangConfValue.on('change', function() {
      self.updateConfigureResult({changeLazang: true});
    });
  },

  updateConfigureResult: function({ changeRoof = false, changeLazang = false} = {}) {
    const self = APP.president;

    !changeLazang && self.updateConfigure(changeRoof);

    const configureImg = $(self._configure).find('.configure-img img');
    const title = $(self._configure).find('.configure-img .name');
    const el = $(self._configure).find('.choose-color');
    const color = $(el).find('.color-list').attr('data-value');
    const roof = $(el).find('.configure-roof input').val();
    const lazang = $(el).find('.configure-lazang input').val();
    const carData = self._presidentCars && self._presidentCars.find(car => car['color'] == color && car['roof'] == roof && car['lazang'] == lazang);
    const dataImg = carData && carData.url;
    const dataTitle = carData && carData.title;

    configureImg.attr('src', dataImg);
    title.text(dataTitle);
  },

  updateConfigure: function(changeRoof = false) {
    const self = APP.president;

    !changeRoof && self.updateConfigureRoof();
    self.updateConfigureLazang();
  },

  updateConfigureRoof: function() {
    const self = APP.president;
    const el = $(self._configure).find('.choose-color');
    const color = $(el).find('.color-list').attr('data-value');
    const roofConfigureValue = $(el).find('.configure-roof input');
    const roofs = $(el).find('.configure-roof .list .option');
    const roofCurrentSelect = $(el).find('.configure-roof .current');
    let initValue;
    
    const availableRoofs = [...new Set(self._presidentCars.filter(
      car => car['color']== color ).map( car => parseInt(car['roof']) )
    )];

    roofs.each(function(){
      let value = $(this).data('value');
      availableRoofs.includes(parseInt(value)) 
        ? $(this).removeClass('disabled') 
          && !initValue 
          && $(this).siblings('.selected').removeClass('selected') 
          && $(this).addClass('selected') 
          && (initValue = $(this))
        : $(this).addClass('disabled');
    });

    roofConfigureValue.val(initValue && initValue.data('value') || '');
    roofCurrentSelect.text(initValue && initValue.text() || '- No data -');
  },

  updateConfigureLazang: function() {
    const self = APP.president;
    const el = $(self._configure).find('.choose-color');
    const color = $(el).find('.color-list').attr('data-value');
    const roof = $(el).find('.configure-roof input').val();
    const lazangConfigureValue = $(el).find('.configure-lazang input');
    const lazangs = $(el).find('.configure-lazang .list .option');
    const lazangCurrentSelect = $(el).find('.configure-lazang .current');
    let initValue;

    const availableLazangs = [...new Set(self._presidentCars.filter(
      car => car['color']== color && car['roof'] == roof ).map( car => parseInt(car['lazang']) )
    )];

    lazangs.each(function(){
      let value = $(this).data('value');
      availableLazangs.includes(parseInt(value)) 
        ? $(this).removeClass('disabled') 
          && !initValue 
          && $(this).siblings('.selected').removeClass('selected') 
          && $(this).addClass('selected') 
          && (initValue = $(this))
        : $(this).addClass('disabled');
    })

    lazangConfigureValue.val(initValue && initValue.data('value') || '');
    lazangCurrentSelect.text(initValue && initValue.text() || '- No data -');
  },
}
/*** PAGE - PRODUCT ***/
APP.product = {
	_el: {},
	_configure: {},
	_model: {},

	init: function() {
		var self = this;
		self._el = jQuery('.vf-product');

		self._configure = self._el.find('.vf-configure');
		new chooseColor(self._configure);

		self._model = self._el.find('.vf-model');
		
		self.modelEvent();
		
		new watchVideo();
		new sliderTechnology();
		//new sliderSpecs();

		// if(jQuery('body').hasClass('mobile')) {
		// 	self.cookieModal();
		// }
	},

	modelEvent: function() {
		var self = this,
			model_list = self._model.find('.model-list');

			model_list.waypoint({
			handler: function (direction) {
				if (direction == 'down') {
					new countNumber(1500,900);
				} 
			},
			offset: '90%'
		});
	},

	cookieModal: function() {
		var self = this;
		setTimeout(function() {
			new modalContact().show();
		}, 2000);
		// if (!APP.getCookie(VF_ModalForm)) {
		// 	setTimeout(function() {
		// 		new modalContact().show();
		// 	}, 2000);
		// 	APP.setCookie(VF_ModalForm, 1, 1);
		// }
	}
};
APP.promotion = {
  _sliderBanner: {},
  
  init: function() {
		self._sliderBanner = $('.vf-promotion-page .vf-banner');

    new sliderBanner(self._sliderBanner, true, 3);
  }
}
APP.specs = {
    init: function () {
        var self = APP.specs;

        self._specs = $('.specs-desk');
        self._btnMore = self._specs.find('.btn-more');
        self._btnMoreMB = self._specs.find('.btn-more-mb');
        self._specsTab = self._specs.find('.specs-tab');
        self._specsTabItem = self._specsTab.find('.specs-tab-item');
        self._specsContent = self._specs.find('.content');
        self._specsContentHide = self._specs.find('.content-hide');

        self._modalSpecs = $('.modal-specs');
        self._modalSpecsContent = self._modalSpecs.find('.content');
        self._modalSpecsTab = self._modalSpecs.find('.specs-modal-tab');
        self._modalSpecsTabItem = self._modalSpecsTab.find('.specs-modal-tab-item');

        self._btnMore.on('click', self.onClickMore);
        self._btnMoreMB.on('click', self.onClickMoreMB);
        $('.specs-close').on('click', self.onClickClose);

        self._specsTabItem.on('click', self.onClickSpecsTab);
        self._modalSpecsTabItem.on('click', self.onClickSpecsModalTab);
    },

    onClickMore: function (event) {
        event.preventDefault();
        $('.modal-specs').addClass('is-active');
        $('body').addClass('is-modal');
    },

    onClickMoreMB: function (event) {
        event.preventDefault();
        var self = APP.specs,
            obj = $(this),
            span = obj.find('span'),
            text = obj.data('text'),
            textShow = obj.data('text-show'),
            posY = self._specs.offset().top - $('.header').height();
        

        obj.toggleClass('is-show');

        if (obj.hasClass('is-show')) {
            span.text(textShow);
            self._specsContentHide.addClass('is-active');
        } else {
            span.text(text);
            $('html, body').stop().animate({scrollTop: posY}, 500, 'swing');
            setTimeout(function () {
                self._specsContentHide.removeClass('is-active');
            }, 150);
        }
    },

    onClickClose: function (event) {
        event.preventDefault();
        $('.modal-specs').removeClass('is-active');
        $('body').removeClass('is-modal');
    },

    onClickSpecsTab: function (event) {
        event.preventDefault();

        var self = APP.specs,
            obj = $(this),
            index = obj.index();

        self._specsTabItem.removeClass('is-active');
        obj.addClass('is-active');

        TweenMax.set(self._specsContent, {
            display: 'none'
        });

        TweenMax.set(self._specsContent.eq(index), {
            display: 'block',
            alpha: 0
        });

        TweenMax.to(self._specsContent.eq(index), 0.5, {
            alpha: 1,
            ease: Power1.easeOut
        });
        
    },

    onClickSpecsModalTab: function (event) {
        event.preventDefault();

        var self = APP.specs,
            obj = $(this),
            index = obj.index();

        self._modalSpecsTabItem.removeClass('is-active');
        obj.addClass('is-active');

        TweenMax.set(self._modalSpecsContent, {
            display: 'none'
        });

        TweenMax.set(self._modalSpecsContent.eq(index), {
            display: 'block',
            alpha: 0
        });

        TweenMax.to(self._modalSpecsContent.eq(index), 0.5, {
            alpha: 1,
            ease: Power1.easeOut
        });
        
    }
};
/*** PAGE - STATION ***/
APP.station = {
	_el: {},
	_tableStation: {},

	init: function() {
		var self = this;
		self._el = jQuery('.vf-station');
		if(self._el.length === 0) return;
		self._tableStation = self._el.find('.table-station');

		self.initStation(self._tableStation);
	},

	initStation: function(elm) {
		var self = this,
				_this = jQuery(elm);

		let cities = [];

		$.each(stationVinfast, function (index, value) {
			$.each(stationVinfast[index], function (index1, value1) {
				let city = cities.find((city) => {
					return city.name === value1[0].province;
				})

				if (city === undefined && value1[0].province !== 'Hà Nội' && value1[0].province !== 'Hồ Chí Minh') {
					cities.push({name: value1[0].province, store: []});
				}
			})
		})

		let stationSort = [ { name:'Hà Nội', store: [] },
				{ name:'Hồ Chí Minh', store: [] },
				...cities.sort((a,b) => {
					return a.name.localeCompare(b.name);
				})
			];

		$.each(stationVinfast, function (index, value) {

			$.each(stationVinfast[index], function (index1, value1) {

				let city = stationSort.find((city) => {
					return city.name === value1[0].province;
				})

				if (city !== undefined) {
					city.store.push(value1[0]);
				}
			})
		})

		self.createTable(_this, stationSort);
		self.stationCity(_this);
	},
	createTable: function(elm, arr) {
		let el = jQuery(elm),
				station = jQuery('.station-list'),
				main = el.find('.table-main'),
				html= '',
				index = 1;

		station.fadeIn();

		$.each(arr, function(i,v) {
			$.each(arr[i].store, function(i2,v2) {
				html += `<div>
				<span>${index}</span>
				<span>${v2.name}</span>
				<span>${v2.district}</span>
				<span>${v2.address}</span>
				<div class=\"table-mb\">
				<div><label>Địa chỉ:</label><span>${v2.address}</span></div>
				<div><label>Quận/ Huyện:</label><span>${v2.district}</span></div>
				</div></div>`;
				index++;
			})
		})
		main.html(html);
	},
	stationCity: function(elm) {
		var self = this;

		let city_id;
		let el = jQuery(elm);
		let offset = self._el.offset().top;
		let h_header = jQuery('.header').outerHeight();

		$.each(stationVinfast, function (index, value) {
			$(".js-city-select").append('<option value="'+index+'">'+index+'</option>');
			$(".js-city-select").selectric({
				onChange: function() {
          city_id = $(this).find('option:selected').attr('value');

          $(".js-district-select").prop('disabled', false);
          $(".js-district-select").find("option:gt(0)").remove();
          $(".js-district-select").find("option:first").remove();
					$(".js-district-select").append('<option disabled="disabled" selected="selected" value="000">'+'Quận/ huyện'+'</option>');
					var temp = [];
          $.each(stationVinfast[city_id], function (index1, value1) {
						if (temp.indexOf(value1[0].district) <=-1){
							$(".js-district-select").append('<option value="'+value1[0].district+'">'+value1[0].district+'</option>').selectric('refresh');
							temp.push(value1[0].district);
						}
          });
					self.initDataTable(el,stationVinfast[city_id]);
					self.sortStation(el,stationVinfast[city_id]);
					jQuery('.station-list').fadeIn();
					APP.scroll(offset - h_header, 600);
				},
			})
		});
	},
	initDataTable: function(el, obj) {
		var self = this;

		let main = el.find('.table-main'),
				html= '';

		let items = Object.values(obj);

		$.each(items, function(index, value) {
			html += `<div>
			<span>${index+1}</span>
			<span>${value[0].name}</span>
			<span>${value[0].district}</span>
			<span>${value[0].address}</span>
      <div class=\"table-mb\">
      <div><label>Địa chỉ:</label><span>${value[0].address}</span></div>
			<div><label>Quận/ Huyện:</label><span>${value[0].district}</span></div>
			</div></div>`;
		})
		main.html(html);
	},
	sortStation: function(el, obj) {
		var self = this;

		$(".js-district-select").selectric({
      disableOnMobile: false,
			onChange: function() {
				let district_id = $(this).find('option:selected').attr('value'),
						main = el.find('.table-main'),
						html= '';

				let items = Object.values(obj);

				items = items.filter((item) => {
					return item[0].district === district_id;
				})

				if(items.length != 0) {
					$.each(items, function(index, value) {
						html += `<div>
						<span>${index+1}</span>
            <span>${value[0].name}</span>
            <span>${value[0].district}</span>
            <span>${value[0].address}</span>
            <div class=\"table-mb\">
            <div><label>Địa chỉ:</label><span>${value[0].address}</span></div>
            <div><label>Quận/ Huyện:</label><span>${value[0].district}</span></div>
            </div></div>`;
					})

					main.html(html);
				} else {
					html += `<div><p>Không có dữ liệu</p></div>`;
					main.html(html);
				}
			}
		})
	},
};