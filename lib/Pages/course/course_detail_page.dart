import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String content;

  final bool isDarkMode;
  
  const CourseDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.content,
    required this.isDarkMode,
  });
  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}
class _CourseDetailPageState extends State<CourseDetailPage>{
  bool showContent = false;
  @override
  Widget build(BuildContext context) {
    final backgroundcolor = widget.isDarkMode ? Colors.black : Colors.white;
    final textcolor =  widget.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color:textcolor),),
        backgroundColor: widget.isDarkMode? Colors.grey[900]: Colors.blue,
        iconTheme: IconThemeData(color: widget.isDarkMode? Colors.white: Colors.white),
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.image, height: 150),
            const SizedBox(height: 20),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16, color: widget.isDarkMode? Colors.grey[300] : Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mulai belajar!')),
                );
                setState(() {
                  showContent=true;
                });
              },
              child: const Text('Mulai Course'),
            ),
            const SizedBox(height:20),
            if (showContent)...[
              const Divider(),
              const SizedBox(height:10),
              Text(
                widget.content,
                style: TextStyle(
                fontSize: 16,
                color: textcolor,
                height: 1.5,
              ),
              ),
            ]
          ],
        ),
      ),
      ),
    );
  }
}
