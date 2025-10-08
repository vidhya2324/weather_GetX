import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
            print("district fetch started");
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
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
                  child: DropdownSearch<String>(
                    // asyncItems: (String? filter) async {
                    //   return controller.district.toList();
                    // },
                    items: (filter, InfiniteScrollProps) =>
                        controller.district.toList(),
                    selectedItem: controller.selectedDistrict.value,
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Search a district...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    // value: controller.selectedDistrict.value,
                    // isExpanded: true,
                    // icon: Icon(Icons.arrow_drop_down),
                    // underline: SizedBox(), //remove the default line
                    onChanged: (String? newvalue) {
                      if (newvalue != null) {
                        controller.selectedDistrict.value = newvalue;
                        controller.getdata(newvalue);
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/weather_image.png",
                  fit: BoxFit.contain,
                  height: 330,
                  width: 450,
                ),

                //SizedBox(height: 10),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "City: ",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 39,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextSpan(
                          text: controller.selectedDistrict.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.data.isEmpty) return SizedBox();
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "${controller.data['weatherMain']} (${controller.data['weatherDesc']})",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 17),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.data['main']['tempcelsius']} °C",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12,),
                          Container(
                            height: 100,
                            width: 5, //thickness of line
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 12,),
                            Text(
                            "${controller.data['main']['tempfran']} °F",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                     SizedBox(height: 10,),
                     Text(
                      "Sunrise: ${controller.data['sys']['sunrise']}",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      ),
                     ),

                     SizedBox(height: 10,),
                     Text(
                      "Sunset: ${controller.data['sys']['sunset']}",
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      ),
                     )
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
