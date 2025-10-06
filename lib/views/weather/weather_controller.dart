import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherController extends GetxController {
  var selectedDistrict = 'Tanjore'.obs;
  var data = {}.obs;
   final List<String> district = [
    'Chennai',
    'Tanjore',
    'Bangalore',
    'Mumbai',
    'Delhi',
  ];

  @override
  void onInit() {
    super.onInit();
    getdata(selectedDistrict.value);
  }

  Future<void> getdata(String district) async {
    final res = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=85372f8077f512f59a3bf4419fdb9a3f&mode=json&units=imperial",
      ),
    );
    print(res.body.toString());
    if (res.statusCode == 200) {
      data.value = jsonDecode(res.body);

      //convert fahrentheit to celsius
      var tempfran = data['main']['temp'];
      var tempcelsius = (tempfran - 32) * 5 / 9;
      data['main']['tempcelsius'] = tempcelsius.toStringAsFixed(2);

      print(tempcelsius);
      print(tempfran);

      //sunrise
      var sunrise = DateTime.fromMillisecondsSinceEpoch(
        data['sys']['sunrise'] * 1000,
      );

      var formatsunrise = DateFormat('hh:mm a').format(sunrise);

      data['sys']['sunrise'] = formatsunrise;

      //sunset
      var sunset = DateTime.fromMillisecondsSinceEpoch(
        data['sys']['sunset'] * 1000,
      );

      var formatsunset = DateFormat('hh:mm a').format(sunset);

      data['sys']['sunset'] = formatsunset;

      // print(sunrise);
      // print(data['sys']['sunset']);
      print(formatsunrise);
      print(formatsunset);
    } else {
      print("Address not found");
    }
  }
}
