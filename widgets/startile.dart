import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_9p/models/startilemodel.dart';
import 'package:proj_9p/screens/reminisce.dart';

class StarTile extends StatelessWidget {
  const StarTile(
      {required this.imagePath,
      required this.llmQuote,
      required this.location,
      this.date,
      this.time,
      super.key});

  final String imagePath;
  final String llmQuote;
  final String location;
  final String? date;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Reminisce(
            star: StarTileModel(
                date: date!,
                time: time!,
                location: location,
                llmQuote: llmQuote,
                imagePathPre: imagePath),
          );
        }));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        //color: Colors.amberAccent,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amber),
        margin: const EdgeInsets.fromLTRB(15, 8, 15, 5),
        height: 175,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              //  height: double.infinity,
              child: Image.network(imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 120,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.grey,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  //child: const Text("Hello World"),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 10,
              child: Text(
                llmQuote,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            Positioned(
              top: 145,
              left: 10,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 20,
                    color: Colors.black,
                  ),
                  Text(
                    location,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.date_range,
                    size: 20,
                    color: Colors.black,
                  ),
                  Text(
                    date!,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.access_time_filled_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  Text(
                    time!,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
