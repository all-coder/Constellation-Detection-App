import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import '../workflow/settings.dart';

class AstroGuide extends StatefulWidget {
  // const AstroGuide({super.key}) : super(key: key);
  const AstroGuide({super.key,required this.deviceId});
  final String deviceId;

  @override
  _AstroGuideState createState() => _AstroGuideState();
}

class _AstroGuideState extends State<AstroGuide> {

  var procesedfinalImage = "hello there";
  //final String user_name = "me";
  int index = 0;
  File? _image;
  final picker = ImagePicker();
  

  @override
  Widget build(BuildContext context) {
   // final String id = await fetchDeviceInfo();
    Future<Map<String, dynamic>> fetchData(String curl) async {
      http.Response response = await http.get(Uri.parse(curl));
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    Future fetchImage(String totalUrl,String imageName) async {
      final curl = "http://10.0.2.2:5000/api?query="+totalUrl+"&filename=${imageName}";
      Map<String,dynamic> finalUrl = await fetchData(curl);
      setState(() {
        index = 2;
      });
      return finalUrl;
    }

    Future<String> uploadImage() async {
      //procesedfinalImage = "hello there";
      var processedImage;
      try {
        final imageName = "${widget.deviceId}/${(DateTime.now().microsecondsSinceEpoch).toString()}.jpg";
        final path = 'images/$imageName';
        final file = File(_image!.path);
        final storageRef = FirebaseStorage.instance.ref().child(path);
        final uploadTask = storageRef.putFile(file);
        final snapshot = await uploadTask.whenComplete(() => null);
        final url = await snapshot.ref.getDownloadURL();
        final totalUrl = url.toString();
        processedImage = await fetchImage(totalUrl,imageName);
        print(processedImage['processed_image']);
        print(processedImage['filename']);
        setState(() {
          procesedfinalImage = processedImage['processed_image'];
        });
        
      } on FirebaseException catch (e) {
        print('Error uploading image: $e');
      }
      return procesedfinalImage;
    }

    Future<void> getImagefCamera() async {
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = File(image!.path);
        index = 1;
      });
    }

    Future<void> getImagefGallery() async {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image!.path);
        index = 1;
      });
    }

    final getImage = Opacity(
      opacity: 0.96,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffc9ada7),
              Color(0xff9a8c98),
              Color(0xff4a4e69),
              Color(0xff22223b),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(20),
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: InkWell(
                onTap: getImagefCamera,
                child: Opacity(
                  opacity: 0.96,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    height: 100,
                    width: 100,
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 220,
              child: InkWell(
                onTap: getImagefGallery,
                child: Opacity(
                  opacity: 0.96,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.photo_library_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final finalizeImage = Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          child: _image != null ? Image.file(_image!) : const SizedBox(),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 5),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 10),
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Text(
                  'Do it again',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, elevation: 10),
                onPressed: uploadImage,
                child: Text(
                  "It's fine",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final finalizedPoster = Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                child: _image != null ? Image.file(_image!) : const SizedBox(),
              ),
              const Divider(
                color: Colors.white,
                endIndent: 20,
                indent: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                height: 200,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(procesedfinalImage),
                ),
              ),
            ],
          );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            opacity: 0.8,
            image: AssetImage('lib/assets/images/background_4.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          bottomOpacity: 0.8,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 3, 3, 3),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Text(
            "ASTRO GUIDE",
            style: GoogleFonts.juliusSansOne(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            if (index == 0)
              getImage
            else if (index == 1)
              finalizeImage
            else if (index == 2)
              finalizedPoster
          ],
        ),
      ),
    );
  }
}
