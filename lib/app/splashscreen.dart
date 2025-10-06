import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    print("Splash started");

    _initialData();
  }

  Future<void> _initialData() async {
    // print("Initial Data");
    // await Future.delayed((Duration(seconds: 3)));
    // _getData();
    // await Future.delayed((Duration(seconds: 3)));
    // _getImageData();

    await Future.delayed((Duration(seconds: 5)));
    Get.offNamed('/weather');
  }

  // Future<void> _getData() async {
  //   print("Initial Get Data");
  // }

  // Future<void> _getImageData() async {
  //   print("Initial image Data");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/weather_image.png",
          fit: BoxFit.cover,
        ),
        //transition: Transition.leftToRight,
      ),
      backgroundColor: Colors.black,
    );
  }
}
