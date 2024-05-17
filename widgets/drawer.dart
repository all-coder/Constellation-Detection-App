import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/aboutus.dart';
import '../workflow/settings.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  //final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {

    return Drawer(

      //backgroundColor: const Color(0xff355070),
        child: Column(
          children: [
             DrawerHeader(
              decoration: const BoxDecoration(color:  Color(0xff355070),borderRadius: BorderRadius.all(Radius.circular(15)) ),
                padding: const EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   // gradient: LinearGradient(
                //   //   colors: [
                //   //     Theme.of(context).colorScheme.primaryContainer,
                //   //     Theme.of(context)
                //   //         .colorScheme
                //   //         .primaryContainer
                //   //         .withOpacity(0.8),
                //   //   ],
                //   //   begin: Alignment.topLeft,
                //   //   end: Alignment.bottomRight,
                //   // ),
                // ),
                
                child: Row(
                  children: [
                    Row(
                      children: [
                        // Icon(
                        //   Icons.people,
                        //   size: 48,
                        //   color: Colors.white,
                        // ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "'Search the Stars'",
                          style: GoogleFonts.juliusSansOne(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      color: Colors.white),
                          //style: ,
                        )
                      ],
                    )
                  ],
                )
              
                ),
            ListTile(
              leading: const Icon(
                Icons.bubble_chart,
                size: 26,
                color: Color(0xff355070),
              ),
              title: Text(
                'Tips',
                style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const About(data: dummyData)));
              },
              leading: const Icon(
                Icons.people,
                size: 26,
                color:  Color(0xff355070),
              ),
              title: Text(
                'About Us',
                style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black),
              ),
            ),
          ],
        ),
      );
  }
}
