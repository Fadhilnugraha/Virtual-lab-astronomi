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
        'image': 'assets/universe.png',
        'content' : '''
        **Pengantar:**
Astronomi adalah ilmu yang mempelajari benda-benda langit seperti planet, bintang, galaksi, dan fenomena luar angkasa lainnya.

**Materi Singkat:**
- Tata Surya terdiri dari Matahari dan delapan planet.
- Cahaya bintang berasal dari reaksi fusi nuklir di dalam inti bintang.
- Galaksi kita disebut **Bima Sakti (Milky Way)**.
- Jarak antar bintang diukur dalam satuan **tahun cahaya**.
- Alat utama untuk pengamatan astronomi adalah **teleskop**.

**Fun Fact:**
Bintang yang paling dekat dengan Bumi adalah **Matahari**, jaraknya sekitar 150 juta kilometer.
'''
      },
      {
        'title': 'Fisika Bintang',
        'description': 'Pelajari komposisi dan material bintang',
        'image': 'assets/sun.png',
        'content': '''
# Fisika Bintang

**Pengantar:**
Fisika bintang membahas bagaimana bintang terbentuk, memancarkan energi, dan berevolusi sepanjang hidupnya.

**Materi Singkat:**
- Bintang terbentuk dari awan gas dan debu yang disebut **nebula**.
- Energi bintang berasal dari **fusi hidrogen menjadi helium** di inti.
- Bintang dengan massa besar bisa berakhir sebagai **supernova** atau **lubang hitam**.
- Warna bintang menunjukkan suhunya: biru panas, merah dingin.

**Fun Fact:**
Bintang paling besar yang pernah ditemukan bernama **UY Scuti**, dengan radius lebih dari 1.700 kali Matahari!
''',

        
      },
      {
        'title': 'Fisika Galaksi',
        'description': 'Pelajari bagaimana sistem galaksi bekerja',
        'image': 'assets/galaxy.png',
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
      body: 
      Padding(
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
                        onPressed: () {
                          Navigator.pushNamed(context, '/courseDetail',arguments: course);
                        },
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
