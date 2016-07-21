$(document).ready(function(){
  'use strict';

var baseGeocodingUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=';
var keyConjunction = '&key=';
var apiKey = 'AIzaSyDf0KFq6P4NfjzPmkHlEVuExuuX1Ox_PP4';
var geocodedMarkers = [];
var map;
var shops;

$("#button-delete").on('click', function(){
$.ajax({
    url: '/delete',
    type: 'DELETE',
    success: function(result) {
    }
});

  alert('Worked');
});

function createBaseMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 39.7420, lng: -104.991531},
    zoom: 11
  });
}

function buildGeocodingUrl(address) {
  var encodedAddress = encodeURIComponent(address); 
  return baseGeocodingUrl + encodedAddress + keyConjunction + apiKey;
}

function formatInfoWindow(shop) {
  var header = '<h3>' + shop.name + '</h3>';
  var address = '<p>' + shop.address + '</p>';
  var website = '<p>' + shop.website + '</p>';
  var phone = '<p>' + shop.phone + '</p>';
  return header + address + website + phone;
}

function setMarker(shop) {
  var latLng = {
    lat: shop.lat,
    lng: shop.lng
  };
  var marker = new google.maps
    .Marker({
      position: latLng,
      map: map,
      title: shop.name,
      icon: '/images/pokemon_gym.png',
    });

  marker.infowindow = new google.maps.InfoWindow({
    content: formatInfoWindow(shop) 
  });
  marker.addListener('mouseover', function() {
   marker.infowindow.open(map, marker);
  });
  marker.addListener('mouseout', function() {
   marker.infowindow.close();
  });
}

function geocodeShops(shopsString) {
  var shops = JSON.parse(shopsString);
  if (shops.length) {
    shops.forEach(function(shop) {
      var geocodeUrl = buildGeocodingUrl(shop.address);
      $.ajax({
        url: geocodeUrl,
success: function(data) {
 var result = data.results[0];
          if (result) {
            shop.lat = result.geometry.location.lat;
   shop.lng = result.geometry.location.lng;
   setMarker(shop);
 }
}
      });
    });
  }
}
function fetchShops() {
  $.get('pokemon-gym', geocodeShops);
}
createBaseMap();
fetchShops();
});



