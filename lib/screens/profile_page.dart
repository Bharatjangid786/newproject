import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32.0),
              Row(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.0),
              buildMenuItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () {},
              ),
              buildMenuItem(
                icon: Icons.person,
                text: 'My Profile',
                onTap: () {},
              ),
              buildMenuItem(
                icon: Icons.notifications,
                text: 'Notifications',
                onTap: () {},
              ),
              buildMenuItem(
                icon: Icons.help,
                text: 'FAQs',
                onTap: () {},
              ),
              SizedBox(height: 48.0),
              buildMenuItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {},
                textColor: Colors.red,
              ),
              buildMenuItem(
                icon: Icons.share,
                text: 'Share',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String text,
    required void Function() onTap,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return Container(
      child: InkWell(
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30.0,
            ),
            SizedBox(width: 16.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
