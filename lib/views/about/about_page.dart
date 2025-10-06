import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_two/views/home/home_page.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final RxInt counter = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "About Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Text(
                "Counter: ${counter.value}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 10,
            ),
            onPressed: () {
              counter.value++;
              

              //print(counter.value);
            },
            child: Text(
              "Increment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 10,
            ),
            onPressed: () {
              counter.value--;

              // print(counter.value);
            },
            child: Text(
              "Decrement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 220, width: 60),

          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Get.toNamed('/weather');
                },
                child: Text(
                  "Check Weather",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
