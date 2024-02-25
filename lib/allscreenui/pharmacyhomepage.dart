import 'package:flutter/material.dart';

class PharmacyHomePage extends StatefulWidget {
  @override
  _PharmacyHomePageState createState() => _PharmacyHomePageState();
}

class _PharmacyHomePageState extends State<PharmacyHomePage> {
  // Variables to control animation states
  bool isCardTapped1 = false;
  bool isCardTapped2 = false;
  bool isCardTapped3 = false;
  bool isCardTapped4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008080), // Dark greenish-blue background color
      appBar: AppBar(
        title: Text(
          'Pharmaco.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            Color(0xFF075e54), // Darker greenish-blue app bar color
        elevation: 0, // Remove app bar shadow
        actions: [],
      ),
      drawer: Drawer(
        elevation: 4,
        child: Container(
          color: Color(0xFF075e54), // Darker greenish-blue drawer color
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'John Doe',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  'johndoe@example.com',
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF075e54), // Darker greenish-blue color
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF075e54), // Darker greenish-blue header color
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality to navigate to the home page
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality to navigate to the profile page
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality to navigate to the settings page
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Add functionality to handle logout
                },
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildAnimatedCard(
            context,
            Icons.medical_services,
            'Add Medicines',
            Color(0xFF008080), // Dark greenish-blue color
            Colors.greenAccent, // Border color
            isCardTapped1,
            () {
              _openMedicineForm(context);
              setState(() {
                isCardTapped1 = !isCardTapped1;
              });
            },
          ),
          _buildAnimatedCard(
            context,
            Icons.view_agenda_outlined,
            'View Medicines',
            Color(0xFF008080), // Dark greenish-blue color
            Colors.greenAccent, // Border color
            isCardTapped2,
            () {
              setState(() {
                isCardTapped2 = !isCardTapped2;
              });
            },
          ),
          _buildAnimatedCard(
            context,
            Icons.info_outline,
            'Edit Info',
            Color(0xFF008080), // Dark greenish-blue color
            Colors.greenAccent, // Border color
            isCardTapped3,
            () {
              setState(() {
                isCardTapped3 = !isCardTapped3;
              });
            },
          ),
          _buildAnimatedCard(
            context,
            Icons.help_center_outlined,
            'Help',
            Color(0xFF008080), // Dark greenish-blue color
            Colors.greenAccent, // Border color
            isCardTapped4,
            () {
              setState(() {
                isCardTapped4 = !isCardTapped4;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    Color borderColor,
    bool isTapped,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isTapped ? borderColor : Colors.transparent,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isTapped ? Colors.transparent : color.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Card(
          elevation: isTapped ? 0 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openMedicineForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add Medicine',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF008080), // Dark greenish-blue color
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Medicine Name',
                    labelStyle: TextStyle(
                      color: Color(0xFF008080), // Dark greenish-blue color
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Dosage',
                    labelStyle: TextStyle(
                      color: Color(0xFF008080), // Dark greenish-blue color
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Instructions',
                    labelStyle: TextStyle(
                      color: Color(0xFF008080), // Dark greenish-blue color
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF008080), // Dark greenish-blue color
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save medicine data
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF008080), // Dark greenish-blue color
              ),
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
