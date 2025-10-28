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
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bghome.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),


          Container(
            color: Colors.black.withValues(alpha:0.45),
          ),


          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Pelajari astronomi',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black.withValues(alpha: 0.7),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple[200],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login terlebih dahulu')),
                        );
                        Navigator.pushReplacementNamed(context, '/login');
                      } else {
                        Navigator.pushReplacementNamed(context, '/course');
                      }
                    },
                    child: const Text('Mulai Jelajahi'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // ⬆️ SAMPAI SINI
    );
  }
}