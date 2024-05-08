import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/Views/screens/onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(225, 255, 153, 0)])),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Nimbus',
            //       style: GoogleFonts.poppins(
            //           color: const Color(0xFFFFFFFF),
            //           fontWeight: FontWeight.w400,
            //           fontSize: 60),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 120,
            ),
            Center(
              child: SizedBox(
                child: Text(
                  'Let’s Check\nThe current⭐\nWeather\nAround you',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF0C1823),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherScreen()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(225, 255, 153, 0),
                      Colors.blue
                    ])),
                child: Center(
                  child: Text("Let's check",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
