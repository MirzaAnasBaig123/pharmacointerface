import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a logout option with its logo
            IconButton(
              icon: Icon(Icons.logout, size: 50), // Using a logout icon
              onPressed: () {
                // Implement logout functionality here
              },
            ),
            SizedBox(height: 20),
            Text(
              'Logout',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
