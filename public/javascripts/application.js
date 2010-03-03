var map;
var centerLatitude = 38.802577;
var centerLongitude = -77.063448;
var startZoom = 15;
var markerHash={};
var currentFocus=false;


//Add Marker to Maps
function addMarker(latitude,longitude,id){
	var marker= new GMarker(new GLatLng(latitude,longitude));
	GEvent.addListener(marker,'click',
		function(){
			focusPoint(id);
		}
	);
	map.addOverlay(marker);
	return marker;
}

//Correct for Window Resizing
function windowHeight(){
	if (self.innerHeight)
		return self.innerHeight;
		return 0;
}

function handleResize(){
	var height=windowHeight();
	height -= document.getElementById('toolbar').offsetHeight-30;
	document.getElementById('map').style.height=height+'px';
	document.getElementById('sidebar').style.height=height+'px';
}


//Marker linked to Sidebar
function focusPoint(id){
  markerHash[id].marker.openInfoWindowHtml(markerHash[id].address);
}

//Run Initializing Script
function init() {

	handleResize();

	map = new GMap2(document.getElementById("map"));
	map.addControl(new GSmallMapControl());
	map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);

    //loop through each and tag.
	for(i=0; i<parrays.length; i++){
		var current = parrays[i];
		marker = addMarker(current.latitude, current.longitude, current.id);
		markerHash[current.id]={marker:marker,address:current.address,lotsize:current.lotsize, visible:true};
//markerHash[current.id]={marker:marker,lotsize:current.lotsize, visible:false};
		}
}


window.onresize=handleResize;
window.onload = init;
window.onunload = GUnload;
