import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/home1.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/home3.dart';
import 'package:flutter_application_1/result.dart';
import 'package:flutter_application_1/start.dart';
import 'package:flutter_application_1/eva.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      routes: {
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
        'start': (context) => const MyWidget(),
        'home': (context) => const MyHome(),
        'home1': (context) => const NextPage(),
        'home2': (context) => const NextPage1(),
        'home3': (context) => const NextPage2(),
        'result': (context) => const MyWid(),
        'evaluate': (context) => const Evaluate(),
      }));
}
