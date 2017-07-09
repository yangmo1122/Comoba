<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
#map {
	width: 100%;
	height: 600px;
	background-color: grey;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body onload="initialize()">


	<div id="map"></div>

<form action="">
	<p>

			
		주소 : <br/><input type="text" size="50" id="addr1" name="addr1" value="" width="40" /><br/>
			
		위도, 경도: <br/><input type="text" size="50" id="latlng" name="latlng" value="" width="40" /><br/><br/>	

		 <input name="submit" type="submit" value="전달하기" onclick='setParentText()' /><br/><br/>			
			
	</p>
	
	
</form>	
	





	<script type="text/javascript">
		var map;
		
		
		  function setParentText(){
			  
			  var addr1 = document.getElementById("addr1").value;
			  
			  var addr2 = addr1.split(" ");
				
			  var addr3 = "";
			  
			  var addr4 = "";
			  
	   //	  alert(addr2);
			  
	   //	  alert(addr2.length);
			  
	  // alert(addr2[2].substring(addr2[2].length-1));
	   
	   var addr2check = addr2[2].substring(addr2[2].length-1);
	   
	   if (addr2check == "동") {
		
		   addr3 = addr2[1];
		   
		   for (var i = 2; i <addr2.length; i++ ){
				  
				  addr4 += " " + addr2[i];
				  
		//		  alert(addr4);
			  }
		   
	} 
	   else {
		   
		   addr3 = addr2[1]+ " "+ addr2[2];
		   
		   for (var i = 3; i <addr2.length; i++ ){
				  
				  addr4 += " " + addr2[i];
				  
		//		  alert(addr4);
			  }
		   
	   }
	   //	  alert(addr2[0]+ " "+ addr2[1] );
		  
	   
	   //   alert(addr3);
	   //   alert(addr4); 
	  
			  addr3 = addr3.replace(/^ /gi, "");
			  
			 
			  addr4 = addr4.replace(/^ /gi, "");
		 
			  var latlng =  document.getElementById("latlng").value;
			  
			 latlng =  latlng.split(",")
			  
		//	alert( latlng[0].substring(1) );
			  
			 var latitude = latlng[0].substring(1)
			 
			 var longitude = latlng[1].substring(0, latlng[1].length -1 )	 
			  
			  longitude = longitude.replace(/^ /gi, "");
			 
		//	  alert (longitude);
		
		
		
		
			  opener.document.getElementById("addr1").value  = addr3;
			  
			  opener.document.getElementById("addr2").value  = addr4;
			  
			  opener.document.getElementById("latitude").value  = latitude;
			  
			  opener.document.getElementById("longitude").value  = longitude;


			  window.close();
			  
		  }

	//	var GreenIcon = new google.maps.MarkerImage(
	//			"http://labs.google.com/ridefinder/images/mm_20_green.png",
	//			new google.maps.Size(12, 20), new google.maps.Point(0, 0),
	//			new google.maps.Point(6, 20));
		// 녹색 마커 아이콘을 정의하는 부분

		function initialize() {

			var latlng = new google.maps.LatLng(37.53360290394845, 126.89734697341919);
			var myOptions = {
				 zoom : 13,
				center : latlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			map = new google.maps.Map(document.getElementById("map"), myOptions);
			geocoder = new google.maps.Geocoder();
			google.maps.event.addListener(map, 'click', codeCoordinate);
			/*아랫글에서 설명한 event를 이용 지도를 'click'하면 codeCoordinate함수를 실행합니다.
			   codeCoordinate함수는 클릭한 지점의 좌표를 가지고 주소를 찾는 함수입니다. */
		}

		function Setmarker(latLng) {

			// marker.length는 marker라는 배열의 원소의 개수입니다.
			// 만약 이 개수가 0이 아니라면 marker를 map에 표시되지 않게 합니다.
			// 이는 다른 지점을 클릭할 때 기존의 마커를 제거하기 위함입니다.

			var marker = [];
			marker.length = 0;
			// marker를 빈 배열로 만들고, marker 배열의 개수를 0개로 만들어 marker 배열을 초기화합니
			// 다.

			marker.push(new google.maps.Marker({
				position : latLng,
				map : map
			}));
			// marker 배열에 새 marker object를 push 함수로 추가합니다.

		}
		/*클릭한 지점에 마커를 표시하는 함수입니다.
		   그런데 이 함수를 잘 봐야 하는 것이 바로 marker를 생성하지 않고 marker라는 배열 안에 Marker 
		   obejct  원소를 계속 추가하고 있습니다. 이는 매번 클릭할 때마다 새로운 마커를 생성하기 위함입니
		   다. */

		//입력 받은 주소를 지오코딩 요청하고 결과를 마커로 지도에 표시합니다.
	/* 	function codeAddress(event) {

			if (geocodemarker.length > 0) {
				for (var i = 0; i < geocodemarker.length; i++) {
					geocodemarker[i].setMap(null);
				}
				geocodemarker = [];
				geocodemarker.length = 0;
			}
			//이 부분도 위와 같이 주소를 입력할 때 표시되는 marker가 매번 새로 나타나게 하기 위함입니
			//다.

			var address = document.getElementById("addr1").value;
			//아래의 주소 입력창에서 받은 정보를 address 변수에 저장합니다.

			//지오코딩하는 부분입니다.
		 	geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status == google.maps.GeocoderStatus.OK) //Geocoding이 성공적이라면,
								{
									alert(results.length + "개의 결과를 찾았습니다.");
									//결과의 개수를 표시하는 창을 띄웁니다. alert 함수는 알림창 함수입니다.
									for (var i = 0; i < results.length; i++) {
										map.setCenter(results[i].geometry.location);
										geocodemarker.push(new google.maps.Marker(
														{
															center : results[i].geometry.location,
															position : results[i].geometry.location,
															icon : GreenIcon,
															map : map
														}));
										
										
									}
									//결과가 여러 개일 수 있기 때문에 모든 결과를 지도에 marker에 표시합니다.
								} else {
									alert("Geocode was not successful for the following reason: "
											+ status);
								}
							}); 
		}
 */
		//클릭 이벤트 발생 시 그 좌표를 주소로 변환하는 함수입니다.
		function codeCoordinate(event) {

			
	        
			
		//	alert(event.latLng);
			
			
			document.getElementById("latlng").value = event.latLng;
			
			var addr = document.getElementById("addr1").value;
			
			var address = document.getElementById("addr1").value;
			
		//	alert("왜안되니"+ addr);
			
			
			marker = [];
			marker.length = 0;
			
			Setmarker(event.latLng);
			//이벤트 발생 시 그 좌표에 마커를 생성합니다.

			// 좌표를 받아 reverse geocoding(좌표를 주소로 바꾸기)를 실행합니다.
			geocoder.geocode({ "latLng" : event.latLng }, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[1]) {
					//	alert(event.latLng+"여기지?");
						
					//	alert(results[1].formatted_address);
						
						document.getElementById("addr1").value = results[1].formatted_address
						
					}
				}
			});
		}
		
		
		function deleteMarkers() {
			 
			  markers = [];
			}
		
	
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCANQaZ2FG-T4yKB13PKlnjYxhZPz7gT80&callback=initMap">
    </script>


</body>
</html>
