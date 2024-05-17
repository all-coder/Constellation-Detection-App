import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/aboutus_model.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key, required this.data});

  final AboutModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff355070),
        title: Text(
          "About Us",
          style: GoogleFonts.juliusSansOne(color: Colors.white, fontSize: 28),
          // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //     fontSize: 30, color: Colors.white, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 25, 10, 5),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/images/IMG_20240224_193826.jpg",
                    ),
                    fit: BoxFit.cover,
                    opacity:0.9,
                  ),
                  //color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              height: 480,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.transparent,
                elevation: 20,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 130,
                      top: 20,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            //color: Colors.black,
                            shape: BoxShape.circle),
                        height: 120,
                        width: 120,
                        child: Image.asset(
                          data.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 160,
                      left: 130,
                      child: Text(
                        data.name,
                        style: GoogleFonts.juliusSansOne(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 23),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 20,
                      child: Row(
                        children: [
                          Text(
                            "Designation : ",
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            data.designation,
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      //height:300,
                      top: 250,
                      left: 10,
                      right: 10,
                      child: SizedBox(
                        // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        height: 150,
                        //height: double.infinity,
                        //color: Colors.amber,
                        child: Column(
                          children: [
                            Text(
                              data.shortDesc,
                              softWrap: true,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 400,
                      child: Row(
                        children: [
                          Text(
                            'Email: ',
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              final clipboard =
                                  ClipboardData(text: data.emailId);
                              Clipboard.setData(clipboard);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Email Address Copied!",
                                    style: GoogleFonts.robotoMono(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                ),
                              );
                            },
                            child: SelectableText(
                              data.emailId,
                              //softWrap: true,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.yellow,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
