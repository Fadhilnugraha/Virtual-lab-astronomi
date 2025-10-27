import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_lab_interaktif/home_page.dart';
import 'pages/login_pages.dart';
import 'pages/register_pages.dart';
import 'pages/Course/course_page.dart';
import 'pages/Course/course_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBAk9_9BqiKePpFwiojZC0lY7DUR3JsS4g",
      authDomain: "lms-astronomy.firebaseapp.com",
      projectId: "lms-astronomy",
      storageBucket: "lms-astronomy.firebasestorage.app",
      messagingSenderId: "6957444215",
      appId: "1:6957444215:web:07ed146a0bfc235cb3aa72",
      measurementId: "G-RHNRXE8H6H"
    
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Login',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/course': (context) => CoursePage(),
        '/courseDetail': (context) {
          final args = 
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return CourseDetailPage(
          title: args['']!,
          description:args['description']!,
          image: args['image']!,
        );
      },
      }
    );
  }
}
