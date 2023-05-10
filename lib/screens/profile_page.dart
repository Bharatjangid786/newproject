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
            SizedBox(height: 16.0),
            Row(
              children: [
                CircleAvatar(
                  radius: 50.0,
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
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'john.doe@example.com',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    SizedBox(width: 16.0),
                    Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(width: 16.0),
                    Text('My Profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.notifications),
                    SizedBox(width: 16.0),
                    Text('Notifications',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.help),
                    SizedBox(width: 16.0),
                    Text('FAQs',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 32.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 16.0),
                    Text('Logout',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: InkWell(
                child: Row(
                  children: const [
                    Icon(Icons.share),
                    SizedBox(width: 16.0),
                    Text('Share',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
