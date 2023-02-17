

import 'package:flutter/material.dart';


import 'package:jokes_app/views/screens/homepage.dart';
import 'package:jokes_app/views/screens/storedata_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
        '/' : (context) => HomePage(),
        'StoreData' : (context) => StoreData(),
     },
    ),
  );
}