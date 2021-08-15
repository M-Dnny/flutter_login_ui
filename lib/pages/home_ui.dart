import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/register_ui.dart';
import 'package:flutter_login_ui/utils/custombutton.dart';

import 'login_ui.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                  ),
                ),
                Image.asset(
                  'assets/images/started.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(
                  'Start your Journey Now',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                CustomButton(
                  text: 'GET STARTED',
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade500,
                  textcolor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterUI()));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginUI()));
                      },
                      child: Text('Login'),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
