import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharmacointerface/allscreenui/settings.dart';
import 'package:pharmacointerface/allscreenui/userprofile.dart';
import 'package:pharmacointerface/allscreenui/settings.dart'; // Import the SettingsPage

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
  List<bool> isHovered = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  buildCard('Add Pharmacy', 'assets/commission.png', 0),
                  buildCard('View Pharmacies', 'assets/file.png', 1),
                  buildCard(
                      'Edit Pharmacy Information', 'assets/editing.png', 2),
                  buildCard('Delete Pharmacy', 'assets/trash.png', 3),
                  buildCard('Logs', 'assets/log-file-format.png', 4),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: GNav(
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.lightBlue,
                  gap: 4,
                  padding: EdgeInsets.all(15),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      iconSize: 24,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                      iconSize: 24,
                      textStyle: TextStyle(fontSize: 16),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(),
                          ),
                        );
                      },
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                      iconSize: 24,
                      textStyle: TextStyle(fontSize: 16),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SettingsPage(), // Navigate to SettingsPage
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String imagePath, int index) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          isHovered[index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered[index] = false;
        });
      },
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: isHovered[index]
              ? Color.fromARGB(255, 187, 18, 202)
              : Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
