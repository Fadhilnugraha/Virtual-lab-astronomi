import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const CourseDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(image, height: 150),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
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
    );
  }
}
