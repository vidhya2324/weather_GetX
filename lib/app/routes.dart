import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_two/app/splashscreen.dart';
import 'package:statemanagement_two/views/about/about_page.dart';
import 'package:statemanagement_two/views/home/home_page.dart';
import 'package:statemanagement_two/views/weather/weather_controller.dart';
import 'package:statemanagement_two/views/weather/weather_page.dart';

List<GetPage> appRoutes() => [
  GetPage(
    name: '/home',
    page: () => HomePage(),
    transition: Transition.upToDown,
  ),
    GetPage(
    name: '/about',
    page: () => AboutPage(),
    transition: Transition.leftToRight,
  ),
   GetPage(
    name: '/splash',
    page: () => Splashscreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(name: '/weather', page: ()=> WeatherPage(),transition: Transition.rightToLeft)
];
