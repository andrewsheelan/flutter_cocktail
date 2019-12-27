import 'package:flutter/material.dart';
import 'pages/listing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktails',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'JosefinSans',
        backgroundColor: Colors.white,
      ),
      home: ListingPage(),
    );
  }
}
