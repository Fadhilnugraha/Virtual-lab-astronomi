import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  final bool isDarkMode;
  
  const CourseDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundcolor = isDarkMode ? Colors.black : Colors.white;
    final textcolor =  isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        title: Text(title,style: TextStyle(color:textcolor),),
        backgroundColor: isDarkMode? Colors.grey[900]: Colors.blue,
        iconTheme: IconThemeData(color: isDarkMode? Colors.white: Colors.white),
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(image, height: 150),
            const SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: isDarkMode? Colors.grey[300] : Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // nanti diisi aksi seperti mulai pelajaran
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mulai belajar!')),
                );
              },
              child: const Text('Mulai Course'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
