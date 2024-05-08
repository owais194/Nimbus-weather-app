import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/Controllers/weather_controller.dart';
import 'package:nimbus/helpers/shimmer_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherController>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(225, 255, 153, 0), Colors.blue])),
          child: FutureBuilder(
              future: provider.getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: TextField(
                                        controller: provider.searchInput,
                                        onEditingComplete: () {
                                          provider.searchCity();
                                        },
                                        autofocus: false,
                                        cursorColor: const Color(0xFF36424D),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: const SizedBox(
                                              width: 0,
                                              height: 0,
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .magnifyingGlass,
                                                color: Color(0xFF36424D),
                                              ),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                borderSide: BorderSide(
                                                    color: Colors.blue.shade900,
                                                    width: 1)))),
                                  )
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      'Feels Like A good\ntime to have a picnic',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF09151E),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Icon(FontAwesomeIcons.faceSmile))
                                ]),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 350,
                              width: 320,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff537895),
                                    Color(0xff09203F),
                                  ])),
                              child: Stack(children: [
                                Positioned(
                                    top: 25,
                                    left: 3,
                                    child:
                                        Image.asset('assets/images/cloud.png')),
                                Positioned(
                                    top: 25,
                                    right: 3,
                                    child: Image.asset(
                                        'assets/images/rainny.png')),
                                Positioned(
                                    bottom: 300,
                                    left: 110,
                                    child: Text(
                                      provider.model.city.toString(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 35),
                                    )),
                                Center(
                                    child: Stack(children: [
                                  Container(
                                      margin: const EdgeInsets.only(left: 8.0),
                                      child: Text("Today's Like",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16))),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 30.0, top: 15.0),
                                    child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Text(
                                              '   ${provider.model.feelsLike ?? ''} ',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30)),
                                          const Text(
                                            'o',
                                            style: TextStyle(fontFeatures: [
                                              FontFeature.subscripts()
                                            ], color: Colors.white),
                                          ),
                                          Text('C',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30)),
                                        ]),
                                  ),
                                  // Container(
                                  //     margin: const EdgeInsets.only(
                                  //         left: 35.0, top: 20.0),
                                  //     child: Text(provider.model.temperature
                                  //         .toString()))
                                ])),
                                Positioned(
                                    top: 120,
                                    bottom: 0,
                                    left: 190,
                                    child:
                                        Image.asset('assets/images/clear.png')),
                                Positioned(
                                    top: 120,
                                    bottom: 0,
                                    right: 180,
                                    child:
                                        Image.asset('assets/images/windy.png')),
                                Positioned(
                                    top: 140,
                                    left: 20,
                                    right: 0,
                                    child: Image.asset(
                                        'assets/images/thunder.png'))
                              ]),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.white
                                              ])),
                                      child: Column(
                                        children: [
                                          Text('Description',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Text(provider.model.description ?? '',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.orange
                                              ])),
                                      child: Column(
                                        children: [
                                          Text('Humidity',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Text(
                                              '${provider.model.humidity ?? ''} g/kg',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.white
                                              ])),
                                      child: Column(
                                        children: [
                                          Text('Wind Direction',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                    provider.model
                                                            .windDirection ??
                                                        '',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF09151E),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                    )),
                                                const Text(
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      fontFeatures: [
                                                        FontFeature
                                                            .superscripts()
                                                      ]),
                                                )
                                              ])
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.orange
                                              ])),
                                      child: Column(
                                        children: [
                                          Text('WindSpeed',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                          Text(
                                              '${provider.model.windSpeed} m/s',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF09151E),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                          ]),
                    ),
                  );
                }
                return ShimmerText();
              }),
        ));
  }
}
