import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'title': 'Astronomi Dasar',
        'description': 'Pelajari struktur alam semesta dari planet hingga galaksi.',
        'image': 'https://cdn-icons-png.flaticon.com/512/2909/2909592.png',
      },
      {
        'title': 'Fisika Modern',
        'description': 'Mengenal teori kuantum dan relativitas secara interaktif.',
        'image': 'https://cdn-icons-png.flaticon.com/512/201/201818.png',
      },
      {
        'title': 'Matematika Logika',
        'description': 'Latih kemampuan berpikir kritis dan logika matematis.',
        'image': 'https://cdn-icons-png.flaticon.com/512/1903/1903162.png',
      },
      {
        'title': 'Fisika Galaksi',
        'description': 'Latih kemampuan berpikir kritis dan logika matematis.',
        'image': 'https://cdn-icons-png.flaticon.com/512/1903/1903162.png',
      },

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // ubah jadi 2 kalau di mobile
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/courseDetail',
                  arguments: course,

                );

              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(course['image']!, height: 80),
                      const SizedBox(height: 12),
                      Text(
                        course['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        course['description']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
