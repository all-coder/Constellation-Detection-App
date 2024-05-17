import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:proj_9p/screens/astroguide.dart';
import '../widgets/weatherforecast.dart';
//import '../widgets/startile.dart';
import '../widgets/drawer.dart';
import 'package:weather/weather.dart';
import '../widgets/recents.dart';
//import '../screens/astroguide.dart';
//import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.weather, required this.deviceId,required this.presentImages});
  final Weather weather;
  final String deviceId;
  final List<List<String>> presentImages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AstroGuide(deviceId: deviceId),
                ),
              );
            },
            icon: const Icon(CommunityMaterialIcons.telescope,
                color: Colors.white),
            iconSize: 35,
          )
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_sharp,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        elevation: 30,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: const Color(0xff355070),
        title: Text(
          "GAGAN VEDHI",
          style: GoogleFonts.juliusSansOne(color: Colors.white, fontSize: 28),
          // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //     fontSize: 30, color: Colors.white, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //elevation: 10,
            Container(
              margin: const EdgeInsets.fromLTRB(2, 10, 10, 1),
              padding: const EdgeInsets.fromLTRB(2, 5, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // gradient: const LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xff3e1f47),
                //     Color(0xff4d194d),
                //     Color(0xff065a60),
                //     Color(0xff0b525b),
                //     Color(0xff0b525b)
                //   ],
                // ),
              ),
              //color: Colors.amber,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: Stack(
                children: [
                  const Positioned(
                    left: 2,
                    //top: 1,
                    child: Icon(
                      Icons.location_pin,
                      size: 95,
                      color: Color(0xff355070),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    //top: 1,
                    child: Text(
                      'Currently In,',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        // color:const Color(0xff5e6572),
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 21,
                    child: Text(
                      weather.areaName!,
                      style: GoogleFonts.roboto(
                        letterSpacing: 0.05,
                        color: Colors.black,
                        fontSize: 55,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            WeatherWidget(weather: weather),
            //
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 90,
              //margin: const EdgeInsets.only(left: 8),
              child: Stack(
                children: [
                  Positioned(
                    left: 12,
                    child: Text(
                      'The Skies Are Clear.',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 15,
                    child: Text(
                      'Time To Discover Your Stars',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            Recents(presentImages: presentImages,deviceId: deviceId,)

            //dummy data is being presented over here
            // const StarTile(
            //   imagePath: "lib/assets/images/IMG_20240224_193826.jpg",
            //   llmQuote: "When Orion Found You",
            //   location: "Chennai",
            //   date: "30/01/2023",
            //   time: "11:28pm",
            // ),
            // const StarTile(
            //   imagePath: "lib/assets/images/image2.jpg",
            //   llmQuote: "Aries is Calling Out to You",
            //   location: "Yerpedu",
            //   date: "17/03/2023",
            //   time: "11:56pm",
            // ),
            // const StarTile(
            //   imagePath: "lib/assets/images/image3.jpg",
            //   llmQuote: "Cannis is here",
            //   location: "Mumbai",
            //   date: "30/01/2023",
            //   time: "11:30pm",
            // ),
          ],
        ),
      ),
    );
  }
}
