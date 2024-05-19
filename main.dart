import 'package:flutter/material.dart';
//import 'package:proj_9p/screens/astroguide.dart';
import './screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:weather/weather.dart';
import './workflow/settings.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:device_info_plus/device_info_plus.dart';
//import './screens/astroguide.dart';

//import 'package:google_fonts/google_fonts.dart';
const key =""; //enter your openweathermap api key
final WeatherFactory wf = WeatherFactory(key);

void main() async {
  
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final String deviceInfo = await fetchDeviceInfo();  
  final Position position = await fetchCurrentLocation();
  final items = await fetchPresentImages(deviceInfo);
  print(items);
  print("This is the latitude: ${position.latitude}");
  print("The longitude is : ${position.longitude}");
  final Weather weather = await loadWeather(wf,position.latitude,position.longitude);
  // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  runApp(MyApp(weather: weather,deviceId:deviceInfo ,presentImages: items,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.weather,required this.deviceId,required this.presentImages});
  final Weather weather;
  final String deviceId;
  final List<List<String>> presentImages;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home(weather: weather,deviceId: deviceId,presentImages: presentImages,),
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
