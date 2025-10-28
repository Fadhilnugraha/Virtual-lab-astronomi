import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final bool isDarkMode;
  const CoursePage({super.key, required this.isDarkMode});

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

    final backgroundcolor = isDarkMode ? Colors.black : Colors.white;
    final textcolor =  isDarkMode ? Colors.white : Colors.black;


    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        title: Text('Courses',style: TextStyle(color: textcolor)),
        backgroundColor: isDarkMode ? Colors.grey[900]: Colors.blue,
        iconTheme: IconThemeData(color: isDarkMode? Colors.white: Colors.white),
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
            crossAxisCount: 3, 
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
                color: isDarkMode ? Colors.grey[850]: Colors.white,
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        course['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: isDarkMode? Colors.grey[300] : Colors.grey[700]),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode? Colors.tealAccent[700] : Colors.blue,
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
