import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sendCurrentWeatherState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text("Weather App"),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (context) {
                return {'Setting', 'About Us'}.map((e) {
                  return PopupMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/img.jpg',
                    ))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: InkWell(
                            onTap: () {
                              print(textEditingController);
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: height / 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  hintText: "Your Country Name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Title View
                  Padding(
                    padding: EdgeInsets.only(top: height / 15),
                    child: Text(
                      "Magenta View",
                      style: TextStyle(
                          fontSize: height / 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  //Title weather
                  Padding(
                    padding: EdgeInsets.only(top: height / 40),
                    child: Text(
                      "Clear Sky",
                      style: TextStyle(
                          fontSize: height / 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: height / 10,
                  ),
                  //Tempreture Of Day
                  Text(
                    "14" + "\u00B0",
                    style: TextStyle(color: Colors.white, fontSize: height / 8),
                  ),
                  //Min - Max Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Min",
                            style: TextStyle(
                                color: Colors.white, fontSize: height / 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "15",
                              style: TextStyle(
                                  color: Colors.white, fontSize: height / 40),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      Column(
                        children: [
                          Text(
                            "Max",
                            style: TextStyle(
                                color: Colors.white, fontSize: height / 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "32",
                              style: TextStyle(
                                  color: Colors.white, fontSize: height / 40),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color.fromARGB(103, 158, 158, 158),
                  ),
                  //WeekDays Tempreture
                  Container(
                    width: double.infinity,
                    height: height / 6,
                    child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width / 4,
                            height: height / 40,
                            color: Colors.transparent,
                            child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Text(
                                    "Sun",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height / 40),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Icon(
                                      Icons.cloud_queue,
                                      color: Colors.white,
                                      size: height / 25,
                                    ),
                                  ),
                                  Text(
                                    "14" + "\u00B0",
                                    style: TextStyle(
                                        fontSize: height / 35,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //divider
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color.fromARGB(103, 158, 158, 158),
                  ),
                  //EndSection
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "wind speed",
                              style: TextStyle(
                                color: Color.fromARGB(167, 158, 158, 158),
                                fontSize: height / 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "4 / 73ms",
                                style: TextStyle(
                                  color: Color.fromARGB(167, 158, 158, 158),
                                  fontSize: height / 50,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Sunrise",
                                style: TextStyle(
                                  color: Color.fromARGB(167, 158, 158, 158),
                                  fontSize: height / 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "12:20",
                                  style: TextStyle(
                                    color: Color.fromARGB(167, 158, 158, 158),
                                    fontSize: height / 50,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Sunset",
                                style: TextStyle(
                                  color: Color.fromARGB(167, 158, 158, 158),
                                  fontSize: height / 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "08:00",
                                  style: TextStyle(
                                    color: Color.fromARGB(167, 158, 158, 158),
                                    fontSize: height / 50,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Humaditly",
                                style: TextStyle(
                                  color: Color.fromARGB(167, 158, 158, 158),
                                  fontSize: height / 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "84%",
                                  style: TextStyle(
                                    color: Color.fromARGB(167, 158, 158, 158),
                                    fontSize: height / 50,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendCurrentWeatherState() async {
    var apikey = "ea37f737bd4aa5995af41e20fec340b4";

    var cityname = "tehran";
    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {'q': cityname, 'appid': apikey, 'units': 'metric '});

    print(response.data);
    print(response.statusCode);
  }
}
