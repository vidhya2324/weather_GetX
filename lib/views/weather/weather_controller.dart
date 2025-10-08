import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherController extends GetxController {
  var selectedDistrict = 'Tanjore'.obs;
  var data = {}.obs;
  var district = <String>[].obs;

  final String apikey = "85372f8077f512f59a3bf4419fdb9a3f";

  @override
  void onInit() {
    super.onInit();
    fetchDistricts();
    //getdata(selectedDistrict.value);
  }

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(
        Uri.parse("https://countriesnow.space/api/v0.1/countries"),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData["error"] == false && jsonData["data"] != null) {
          //find the india in the list
          final List countries = jsonData["data"];
          final india = countries.firstWhere(
            (country) => country["country"] == "India",
            orElse: () => null,
          );
          if (india != null && india["cities"] != null) {
            List<String> cities = List<String>.from(india["cities"]);
            district.assignAll(cities);
            selectedDistrict.value = district.first; // set default
            getdata(selectedDistrict.value);
            print("✅ Fetched ${district.length} cities from API");
          } else {
            print("No cities found for india");
          }
        } else {
          print("⚠️ Unexpected response format");
        }
      } else {
        print("❌ Failed to fetch cities, status: ${response.statusCode}");
      }

      //   if(jsonData["error"]==false && jsonData["data"]!=null){
      //     List<String> cities =
      //   }

      //   //Extract the city name
      //   final List<String> names = jsonData
      //       .map((city) => city['name'].toString())
      //       .toSet()
      //       .toList();

      //   //Assign the district list
      //   district.assignAll(names);

      //   //if its empty
      //   if (district.isEmpty) {
      //     district.assignAll(['chennai', 'tanjore', 'madurai']);
      //   }
      // } else {
      //   print("Failed to load districts");
      // }
    } catch (e) {
      print("Error fetching districts: $e");
    }
  }

  Future<void> getdata(String district) async {
    final res = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$district&APPID=$apikey&mode=json&units=imperial",
      ),
    );
    print(res.body.toString());
    if (res.statusCode == 200) {
      data.value = jsonDecode(res.body);

      //convert fahrentheit to celsius
      var tempfran = data['main']['temp'];
      data['main']['tempfran'] = tempfran.toStringAsFixed(2);
      var tempcelsius = (tempfran - 32) * 5 / 9;
      data['main']['tempcelsius'] = tempcelsius.toStringAsFixed(2);

      //climate description
      data['weatherMain'] = data['weather'][0]['main'];
      data['weatherDesc'] = data['weather'][0]['description'];

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
      // print(formatsunrise);
      // print(formatsunset);
    } else {
      print("Address not found");
    }
  }
}
