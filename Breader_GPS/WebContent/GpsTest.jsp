<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}
</style>
<title>Geolocation</title>
<link
	href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
<script type="text/javascript" src="</script">
	http: //code.jquery.com/jquery-1.6.4.min.js">
</script>
<script type="text/javascript" src="</script">
	http: //code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js">
</script>
<script type="text/javascript" src="</script">
	http:
	//maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">
	var fakeLatitude;
	var fakeLongitude;
	function requestCoord() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				mapServiceProvider(position.coords.latitude,
						position.coords.longitude);
			}, function(error) {
				switch (error.code) {
				case error.TIMEOUT:
					alert('Timeout');
					break;
				case error.POSITION_UNAVAILABLE:
					alert('Position unavailable');
					break;
				case error.PERMISSION_DENIED:
					alert('Permission denied');
					break;
				case error.UNKNOWN_ERROR:
					alert('Unknown error');
					break;
				}
			});
		} else {
			alert("위치정보를 사용 할 수 없습니다.");
			fakeLatitude = 37.564263;
			fakeLongitude = 126.974676;
			mapServiceProvider(fakeLatitude, fakeLongitude);
		}
	}
	var watchId;
	function watchPos() {
		if (navigator.geolocation) {
			watchId = navigator.geolocation.watchPosition(function(position) {
				mapServiceProvider(position.coords.latitude,
						position.coords.longitude);
			}, function(error) {
				switch (error.code) {
				case error.TIMEOUT:
					alert('Timeout');
					break;
				case error.POSITION_UNAVAILABLE:
					alert('Position unavailable');
					break;
				case error.PERMISSION_DENIED:
					alert('Permission denied');
					break;
				case error.UNKNOWN_ERROR:
					alert('Unknown error');
					break;
				}
			});
		} else {
			alert("위치정보를 사용 할 수 없습니다.");
			fakeLatitude = 37.564263;
			fakeLongitude = 126.974676;
			mapServiceProvider(fakeLatitude, fakeLongitude);
		}
	}

	function stopWatch() {
		navigator.geolocation.clearWatch(watchId);
	}
	var map;
	var maker;
	var markerArr = [];

	function initMap() {
		$("#map_canvas").height(
				$(window).height() - $("#main h1").outerHeight()
						- $("#footer").outerHeight() - 72);
		var centerCoord = new google.maps.LatLng(37.564263, 126.974676);
		var myOptions = {
			zoom : 16,
			center : centerCoord,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);
		maker = new google.maps.Marker({
			position : centerCoord,
			map : map,
		});
		google.maps.event.addListener(map, 'zoom_changed', function() {
		});
		google.maps.event.addListener(map, 'mouseup', function() {
		});
	}

	function mapServiceProvider(latitude, longitude) {
		var centerCoord = new google.maps.LatLng(latitude, longitude);
		map.setCenter(centerCoord);
		maker.setPosition(centerCoord);
	}
</script>
</head>
<body onload="initMap()">
	<section data-role="page">
		<header data-role="header">
			<h1>Geolocation</h1>
		</header>
		<div data-role="content" id="map_canvas"></div>
		<div data-role="footer" id="footer" align="center">
			<div>
				<button data-role="button" data-icon="star"
					onclick="requestCoord();">내 위치</button>
				<button data-role="button" data-icon="star" onclick="watchPos();">Start</button>
				<button data-role="button" data-icon="star" onclick="stopWatch();">Stop</button>
			</div>
			<div></div>
		</div>
	</section>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


	function xxx(){
		navigator.geolocation.getCurrentPosition(function(location) {
			console.log(location.coords.latitude);
			console.log(location.coords.longitude);
			console.log(location.coords.accuracy);
		});
	}
</script>
</head>
<body>
<button id="test" onclick="xxx()">눌러봐</button>
</body>
</html> --%>