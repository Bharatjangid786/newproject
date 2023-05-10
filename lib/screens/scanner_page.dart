import 'package:flutter/material.dart';
import 'package:newproject/constraint.dart';

class ScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                scale: .1,
                image: AssetImage('assets/images/code-scan.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
