import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home_ui.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeUI()));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: "Code your Hearts Out",
            body: "Do you Enjoy Coding?",
            image: _buildImage('code.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Create your Own Vision",
            body: "Do you have any Ideas to Implement?",
            image: _buildImage('thinking.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Make a Dent",
            body: "Share your Talent to the World!",
            image: _buildImage('world.png'),
            decoration: pageDecoration)
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastOutSlowIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      animationDuration: 400,
    );
  }

  Widget _buildImage(String assetName) {
    return Image.asset(
      'assets/images/$assetName',
      fit: BoxFit.fill,
    );
  }
}
