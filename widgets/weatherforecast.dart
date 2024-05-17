import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../workflow/settings.dart';

//put your api key over here.
//for personal api key, visit openweather.org, and get the free api key.
//the free api can only retrieve a five day forecast,
//i have gone with a day's forecast
//if i were to do a five day forecast, you could do it something like this,
// final List<String> days = ['yesterday','today','tomorrow','#insert day","#insert day"]
//of course, this is just rough overview of how to do it.

const key = "openweathermap api key goes over here"; 

//this is the weather forecast widget
class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key,required this.weather});
  final Weather weather;
  @override
  State<WeatherWidget> createState() {
    return _WeatherWidgetState();
  }
}

class _WeatherWidgetState extends State<WeatherWidget> {
  // String? path;
  
  String _getImagePath(Weather weather) {
    String link = backgroundImage[weather.weatherDescription!.toLowerCase()] ?? '';// caused a null check error, hence the condition
    return link;
  }

  
  // final WeatherFactory wf = WeatherFactory(key);

  // Weather? weather;
 
  // void _getPosition() async {
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.bestForNavigation);
  //   setState(() {
  //     position = position;
  //     // print("longitude is $longitude");
  //     // print("latitude is $position.latitude");
  //   });
  // }
// void getImage(key){

// }

  @override
  // void initState() {
  //   // super.initState();
  //   // //_getPosition();
  //   // wf.currentWeatherByLocation(position!.latitude, position!.longitude).then((v) {
  //   //   setState(() {
  //   //     weather = v;
  //   //   });
  //   // });
  //   super.initState();
  //   wf.currentWeatherByCityName("Tirupati").then((item) {
  //     setState(() {
  //       weather = item;
  //       path = _getImagePath(weather!);
  //     });
  //   });
  @override
  Widget build(BuildContext context) { 
    final Weather weather = widget.weather;
    final String path = _getImagePath(weather);
    DateTime? now = weather.date;
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.5, fit: BoxFit.cover, image: AssetImage(path)),
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueGrey),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      //color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            child: Text(
              "${weather.temperature!.celsius!.toStringAsFixed(0)}°C",
              style: GoogleFonts.roboto(
                  fontSize: 60,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 80,
            left: 5,
            child: Text(
              DateFormat('EEEE').format(now!),
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w200,
                  fontSize: 50,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 170,
            top: 20,
            child: Text(
              "${weather.weatherDescription!.toLowerCase()}",
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 280,
            top: 70,
            child: Text(
              "${weather.tempMax!.celsius!.toStringAsFixed(0)}/${weather.tempMin!.celsius!.toStringAsFixed(0)}",
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          //The background will do the job

          // Positioned(
          //   top: 10,
          //   left: 220,
          //   child: Image(
          //     // height: 100,
          //     // width: 100,
          //     fit: BoxFit.cover,
          //     color: Colors.white,
          //     image: NetworkImage(
          //       "http://openweathermap.org/img/wn/${weather!.weatherIcon}@4x.png",
          //     ),
          //   ),
          // ),
        ],
      )
    );
  }
}
//Text(DateFromate("h:mm a").format(now))
//DateTime now = weather!.date!
