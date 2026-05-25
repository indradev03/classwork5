import 'package:classwork5/screens/book_screen.dart';
import 'package:flutter/material.dart';

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Classwork 5',

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      home: const BookScreen(),
    );
  }
}
