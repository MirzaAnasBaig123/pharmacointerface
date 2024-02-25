import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEditingName = false;
  bool _isEditingEmail = false;
  bool _isEditingPhone = false;
  bool _isEditingPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/gmail_image.png'), // Replace with user's Gmail image
              ),
            ),
            SizedBox(height: 30),
            _buildInfoField(
              'Name',
              _nameController,
              Icons.person,
              _isEditingName,
              () {
                setState(() {
                  _isEditingName = !_isEditingName;
                });
              },
            ),
            SizedBox(height: 20),
            _buildInfoField(
              'Email',
              _emailController,
              Icons.email,
              _isEditingEmail,
              () {
                setState(() {
                  _isEditingEmail = !_isEditingEmail;
                });
              },
            ),
            SizedBox(height: 20),
            _buildInfoField(
              'Phone',
              _phoneController,
              Icons.phone,
              _isEditingPhone,
              () {
                setState(() {
                  _isEditingPhone = !_isEditingPhone;
                });
              },
            ),
            SizedBox(height: 20),
            _buildInfoField(
              'Password',
              _passwordController,
              Icons.lock,
              _isEditingPassword,
              () {
                setState(() {
                  _isEditingPassword = !_isEditingPassword;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller,
      IconData icon, bool isEditing, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: isEditing
                  ? TextFormField(
                      controller: controller,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Enter $label',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    )
                  : Text(
                      controller.text.isEmpty ? 'N/A' : controller.text,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onTap,
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 5),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}
