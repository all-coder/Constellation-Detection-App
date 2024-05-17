import 'package:flutter/material.dart';

import '../models/startilemodel.dart';
import 'package:google_fonts/google_fonts.dart';

class Reminisce extends StatelessWidget {
  const Reminisce({required this.star, super.key});
  final StarTileModel star;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: const Color(0xff355070),
        title: Text(
          "Reminisce",
          style: GoogleFonts.juliusSansOne(color: Colors.white, fontSize: 28),
          // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //     fontSize: 30, color: Colors.white, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Image.network(
              star.imagePathPre,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
