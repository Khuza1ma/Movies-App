import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/screens/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green
      ),
    home: HomePage(),
  ));
}