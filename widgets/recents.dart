import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/startile.dart';
import '../workflow/settings.dart';

class Recents extends StatefulWidget {
  Recents({super.key, required this.presentImages,required this.deviceId}); 

  List<List<String>>? presentImages;
  final String deviceId;

  @override
  State<StatefulWidget> createState() {
    return _RecentsState();
  }
}

class _RecentsState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                'Recents...',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w300,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () async{
                      final List<List<String>> retryPresentImages = await fetchPresentImages(widget.deviceId);
                      setState(() {
                        widget.presentImages = retryPresentImages;
                      });
                    },
                    icon: const Icon(Icons.autorenew_rounded)))
          ],
        ),


        //present images are is of type List<List<String>>, the first list would be the preporcessed images
        //the second list would be the processedimages.


        if (widget.presentImages != null && widget.presentImages!.length > 1)
          for (final imagePath in widget.presentImages![1])
            StarTile(
              imagePath: imagePath,
              llmQuote: "testing",
              location: "Yerpedu",
              date: "30/01/2023",
              time: "11:28pm",
            ),
      ],
    );
  }
}
