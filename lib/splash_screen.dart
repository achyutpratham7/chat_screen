import 'dart:async';

import 'package:chat/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future? _value;
  Future<dynamic> getData() {
    return Future.delayed(
        const Duration(seconds: 2), () => Get.to(ChatScreen()));
  }

  @override
  initState() {
    super.initState();
    _value = getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xFFF0E8FA),
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          return FutureBuilder(
              future: _value,
              builder: (context, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as String;
                    return Center(
                      child: Text(
                        '$data',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/splash.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                );
              });
        }));
  }
}
