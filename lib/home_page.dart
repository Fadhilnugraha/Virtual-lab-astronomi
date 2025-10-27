import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          if (user == null)
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context,'/login');
            },
            child: const Text(
              'login',
              style: TextStyle(color:Colors.blue),
            ),
          )
          else
          TextButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
              if (context.mounted){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('logout berhasil')),
                );
                Navigator.pushReplacementNamed(context,'/home');
              }
            },
            child: const Text(
              'logout',
              style: TextStyle(color: Colors.blue),
            ),
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              'Selamat datang, ${user?.email ?? 'Pengguna'}!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!context.mounted) return;

                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context,  '/course');
              },
              child: const Text(
                'course',
                style: TextStyle(color: Colors.blue),
                
                )
            )
          ],
        ),
      ),
    );
  }
}
