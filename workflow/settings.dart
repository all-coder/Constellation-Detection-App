//ToDo
//need to work on reminisce
//need to fine tune the app further with animations(not a priority)
//setup a proper backend(preferably using firebase storage) - done
//need to properly extract exif data from the image - ongoing
//probably extract all info from the image's file name
//needs three things - location,orginaldate,originaltime
//preferably use a another symbol except '/', could cause some issues
//like this  - "${androidDeviceId}/${location}/${originaldatetime}.(jpeg or png or heic)"
//need to work on the drawer too, more finetuning required.
import 'package:exif/exif.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import '../models/aboutus_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/foundation.dart';
//list of backgroundImages(weatherforecast widget)

const AboutModel dummyData = AboutModel(
  imgPath: "lib/assets/images/image3.jpg",
  designation: "Full Stack Dev",
  shortDesc:
      "I am currently a mechanical undergrad at Indian Institude of Technology,Tirupati. I am  quite passionate about the intricate world of computers and networks",
  name: "Niranjan M",
  emailId: "me23b036@iittp.ac.in"
);
final Map<String, String> backgroundImage = {
  //no haze - have to load asset
  //no overcast clouds  -  have to load asset
  'haze': 'lib/assets/images/misty.jpg', //need to update the asset
  'mist': 'lib/assets/images/misty.jpg',
  'clear sky': "lib/assets/images/weather_code/clear.jpg",
  'few clouds': "lib/assets/images/weather_code/few clouds.jpg",
  'scattered clouds': "lib/assets/images/weather_code/scattered clouds.jpg",
  'broken clouds': "lib/assets/images/weather_code/broken clouds.jpg",
  'rain': "lib/assets/images/weather_code/rain.jpg",
  'thunderstorm': "lib/assets/images/weather_code/thunderstorm.jpg",
  'snow': "lib/assets/images/weather_code/snow.jpg",
};

Future getExif(File image) async {
  final bytes = image.readAsBytesSync();
  final data = await readExifFromBytes(bytes);
  for (final i in data.entries) {
    print("${i.key} and ${i.value}");
  }
  // StarTileModel? file;
  // file!.time = data['DateTimeOrginal'].toString() ?? "Nothing here";
  // print(file.time);
}

Future<ImageProvider> fetchImage(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final imageBytes = response.bodyBytes;
    return MemoryImage(imageBytes); // Use MemoryImage for in-memory data
  } else {
    throw Exception('Failed to load image: ${response.statusCode}');
  }
}

Future<Weather> loadWeather(WeatherFactory wf, double lat, double long) async {
  // Await the API call to ensure weather data is obtained
  // Weather weather = await wf.currentWeatherByCityName("Tirupati");
  Weather weather = await wf.currentWeatherByLocation(lat, long);
  return weather;
}

Future<Position> fetchCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location Services are disabled');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location servces are denied");
    }
  }

  return await Geolocator.getCurrentPosition();
}


Future<String> fetchDeviceInfo() async{
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
  final id = deviceInfo.id;
  return id;

}


Future <List<List<String>>> fetchPresentImages(String deviceId) async{
  final preprocessedImages=<String>[];
  final processedImages=  <String>[];
  final storageRef = FirebaseStorage.instance;
  final folder = storageRef.ref().child("images/${deviceId}");
  final items = await folder.listAll();
  for(var item in items.items){
    var url = await item.getDownloadURL();
    var filename = item.fullPath.split('/').last;
    if(filename.endsWith('_processed.jpg')){
      processedImages.add(url);
    }else{
      preprocessedImages.add(url);
    }
  }
  final combinedList = [preprocessedImages,processedImages]; //download urls
  


  return combinedList;
}