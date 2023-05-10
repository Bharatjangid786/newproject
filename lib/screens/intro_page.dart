import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:newproject/screens/signin_page.dart';
import 'package:page_transition/page_transition.dart';
import '../constraint.dart';

class IntroSlide extends StatelessWidget {
  List<Slide> slides = [
    Slide(
      title: Constants.titleOne,
      styleTitle: TextStyle(
        color: Constants.primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      description: Constants.descriptionOne,
      maxLineTitle: 2,
      styleDescription: TextStyle(color: Colors.grey, fontSize: 27),
      textAlignTitle: TextAlign.center,
      textAlignDescription: TextAlign.center,
      backgroundColor: Colors.white,
      pathImage: 'assets/images/plant-one.png',
    ),
    Slide(
      title: Constants.titleTwo,
      styleTitle: TextStyle(
          color: Constants.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
      textAlignTitle: TextAlign.center,
      maxLineTitle: 2,
      styleDescription: TextStyle(color: Colors.grey, fontSize: 27),
      textAlignDescription: TextAlign.center,
      description: Constants.descriptionTwo,
      backgroundColor: Colors.white,
      pathImage: 'assets/images/plant-two.png',
    ),
    Slide(
      title: Constants.titleThree,
      styleTitle: TextStyle(
          color: Constants.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
      description: Constants.descriptionThree,
      maxLineTitle: 2,
      styleDescription: TextStyle(color: Colors.grey, fontSize: 27),
      textAlignTitle: TextAlign.center,
      textAlignDescription: TextAlign.center,
      backgroundColor: Colors.white,
      pathImage: 'assets/images/plant-three.png',
    ),
  ];

  IntroSlide({super.key});

  Widget renderNextButton() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Constants.primaryColor,
    );
  }

  Widget renderSkipButton() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: const Text(
        'Skip',
        selectionColor: Colors.grey,
        style: TextStyle(
            color: Color.fromARGB(255, 97, 97, 97),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      sizeDot: 10.00,
      renderSkipBtn: renderSkipButton(),
      renderNextBtn: renderNextButton(),
      doneButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ),
      skipButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ),
      colorDot: Color.fromARGB(255, 238, 249, 226),
      colorActiveDot: Constants.primaryColor,
      onSkipPress: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const SignIn(), type: PageTransitionType.bottomToTop));
      },
      onDonePress: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const SignIn(), type: PageTransitionType.bottomToTop));
      },
    );
  }
}
