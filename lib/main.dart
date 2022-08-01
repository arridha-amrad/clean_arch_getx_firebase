import 'package:clean_arch/infrastructure/navigation/bindings/main.binding.dart';
import 'package:clean_arch/initializer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  await Initializer.init();
  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        final user = snapshot.data;
        return GetMaterialApp(
          initialRoute: user == null ? Routes.LOGIN : Routes.HOME,
          getPages: Nav.routes,
          initialBinding: MainBinding(),
        );
      }));
}

// class Main extends StatelessWidget {
//   final String initialRoute;
//   const Main({Key? key, required this.initialRoute}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return GetMaterialApp(
//     //   initialRoute: initialRoute,
//     //   getPages: Nav.routes,
//     // );
//     return StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const MaterialApp(
//               home: Scaffold(
//                 body: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             );
//           }
//           final user = snapshot.data;
//           return GetMaterialApp(
//             initialRoute: initialRoute,
//             getPages: Nav.routes,
//           );
//         });
//   }
// }
