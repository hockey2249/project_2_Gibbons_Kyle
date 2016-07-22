$(document).ready(function(){
  'use strict';

var baseGeocodingUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=';
var keyConjunction = '&key=';
var apiKey = 'AIzaSyDf0KFq6P4NfjzPmkHlEVuExuuX1Ox_PP4';
var geocodedMarkers = [];
var map;

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
  return header + address + website;
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
function kyleInfoWindow(data) {
  var name = '<h3>' + data.pokemon_name + '</h3>';
  var address = '<p>' + data.address + '</p>';
  var image = '<img src= "' + data.photo_url + '">';
  console.log(image);
  return name + address + image;
}

function setpokeMarker(data) {
  var latLng = {
    lat: data.lat,
    lng: data.lng
  };
  var marker = new google.maps
    .Marker({
      position: latLng,
      map: map,
      title: data.pokemon_name,
      icon: '/images/poke_balls.png',
    });

    marker.infowindow = new google.maps.InfoWindow({
    content: kyleInfoWindow(data) 
  });
    marker.addListener('mouseover', function() {
   marker.infowindow.open(map, marker);
  });
    marker.addListener('mouseout', function() {
    marker.infowindow.close();
  });
    kyleInfoWindow(data);
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
function pokeshops(pokeshops) {
  var pokemonshops = JSON.parse(pokeshops);
    if (pokemonshops.length) {
      pokemonshops.forEach(function(data) {
        var geocodeUrl = buildGeocodingUrl(data.address);
        $.ajax({
          url: geocodeUrl,
          success: function(evt) {
          var result = evt.results[0];
           if (result) {
              data.lat = result.geometry.location.lat;
              data.lng = result.geometry.location.lng;


            setpokeMarker(data);
          }
        }
      });
    });
  }
          console.log(pokemonshops);
          console.log(pokemonshops);
}
function fetchShops() {
  $.get('pokemon-gym', geocodeShops);
  $.get('pokemon-ad', pokeshops);
}
createBaseMap();
fetchShops();

var pokemonContainer = document.getElementById('pokemon-container');
  pokemonContainer.addEventListener('click', function (event) {
    var target = event.target;
     if (target.classList.contains('delete-pokemon')) {
       var pokemonId = target.getAttribute('data-pokemon-id');
          if (pokemonId) {
           $.ajax({
             method: 'delete',
             url: '/pokemons/' + pokemonId,
             success: function(data) {
             $(target).closest('.pokemon-row').remove();
             createBaseMap();
             fetchShops();
            }
        });
      }
    }
  });
});



