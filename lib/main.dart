import 'package:flutter/material.dart';
import 'ContactForm.dart';


void main() {
  runApp(const Assignment_1());
}

class Assignment_1 extends StatelessWidget {
  const Assignment_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Assignment 1',
      home: ContactForm(),
    );
  }
}
