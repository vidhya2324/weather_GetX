// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:statemanagement_two/nextPage.dart';
// import 'package:statemanagement_two/thirdpage.dart';

// void main() {
//   runApp(Myapp());
// }

// class Myapp extends StatelessWidget {
//   const Myapp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("Home page"), backgroundColor: Colors.blue),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Get.off(ThirdPage());
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: Text("Click to go to third page"),
//               ),

//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   //Get.to(NextPage());
//                   Get.defaultDialog(
//                     title: "Alert Message",
//                     middleText: "Do you want to go to next page",
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Get.back();
//                           Get.to(NextPage());
//                         },
//                         child: Text(
//                           "YES",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),

//                       TextButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Text(
//                           "No",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       Colors.blue, // Set your desired background color here
//                   foregroundColor:
//                       Colors.white, // Optional: Set the text color for contrast
//                 ),
//                 child: Text("Click to go to next page"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement_two/app/routes.dart';
import 'package:statemanagement_two/app/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: appRoutes(),
      
    );
  }
}
