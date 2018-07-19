var mymap = L.map('mapid').setView([39.73887, -104.98432], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
  maxZoom: 18,
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
    '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    'Imagery © <a href="http://mapbox.com">Mapbox</a>',
  id: 'mapbox.streets'
}).addTo(mymap);


//
// L.circle([51.508, -0.11], 500, {
// 	color: 'red',
// 	fillColor: '#f03',
// 	fillOpacity: 0.5
// }).addTo(mymap).bindPopup("I am a circle.");
//
// L.polygon([
// 	[51.509, -0.08],
// 	[51.503, -0.06],
// 	[51.51, -0.047]
// ]).addTo(mymap).bindPopup("I am a polygon.");
//
//
 var popup = L.popup();

$.ajax({
  type: "GET",
  url: "/reports",
  success: function(data, textStatus, jqXHR){
    for (var i = 0; i < data.length; i++) {
      var point = data[i];
      addMarker(point.lat, point.lng, point.description);
    }
  },
  error: function(jqXHR, textStatus, errorThrown){
    console.error(jqXHR);
  }
});

function onMapClick(e) {
  popup
    .setLatLng(e.latlng)
    .setContent("You clicked the map at " + e.latlng.toString())
    .openOn(mymap);
}

function addMarker(lat,long,description) {
  console.log(lat);
  console.log(long);
  L.marker([lat,long]).addTo(mymap).bindPopup(description);
}

mymap.on('click', onMapClick);
