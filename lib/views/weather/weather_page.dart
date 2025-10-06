import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_two/views/weather/weather_controller.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  //Inject controller
  final WeatherController controller = Get.put(WeatherController());
  // List of cities

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Check Weather Condition",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 222, 216, 216),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.district.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Text(
                "Select District: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 231, 231, 1),

                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.black),
                ),
                child: DropdownButton<String>(
                  value: controller.selectedDistrict.value,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(), //remove the default line
                  onChanged: (String? newvalue) {
                    if (newvalue != null) {
                      controller.selectedDistrict.value = newvalue;
                      controller.getdata(newvalue);
                    }
                  },
                  items: controller.district.map<DropdownMenuItem<String>>((
                    String district,
                  ) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/images/weather_image.png",
                fit: BoxFit.contain,
                height: 450,
                width: 450,
              ),
            ],
          );
        }),
      ),
    );
  }
}
