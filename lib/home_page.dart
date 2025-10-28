import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final theme = Theme.of(context);


    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.primary,
        title: const Text('Homepage'),
        actions: [
          Row(
            children: [
              Icon(Icons.dark_mode, color: theme.iconTheme.color),
              Switch(
                value: widget.isDarkMode,
                onChanged: widget.onThemeChanged,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.account_circle,color: theme.iconTheme.color),
            onPressed: () {
              Navigator.pushNamed(context, '/userData');
            },
          ),
          if (user == null)
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Login',
                style: TextStyle(color: theme.colorScheme.secondary),
              ),
            )
          else
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout berhasil')),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text(
                'Logout',
                style: TextStyle(color: theme.colorScheme.secondary),
              ),
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang ${user?.email ?? 'Pelajar'}!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login terlebih dahulu')),
                  );
                  Navigator.pushReplacementNamed(context, '/login');
                } else {
                  Navigator.pushReplacementNamed(context, '/course');
                }
              },
              child: const Text('Course'),
            ),
          ],
        ),
      ),
    );
  }
}
