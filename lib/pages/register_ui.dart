import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/login_ui.dart';
import 'package:flutter_login_ui/utils/custombutton.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  final GlobalKey<FormFieldState<String>> _emailFieldKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  // ignore: unused_field
  String? _email;
  String? _password;

  final _formKey = GlobalKey<FormState>();

  handleSubmitted(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginUI()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SafeArea(
                  child: Padding(padding: EdgeInsets.only(top: 20)),
                ),
                Image.asset(
                  'assets/images/register.png',
                  fit: BoxFit.cover,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: EmailField(
                    fieldKey: _emailFieldKey,
                    hintText: 'Enter Email',
                    onSaved: (value) {
                      this._email = value;
                    },
                    onFieldSubmitted: (value) {
                      this._email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Email Address";
                      } else if (!value.contains('@')) {
                        return 'Enter a Valid Email Address';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: PasswordField(
                      fieldKey: _passwordFieldKey,
                      helperText: 'Tip: Use Special Characters also.',
                      hintText: 'Password',
                      onFieldSubmitted: (String value) {
                        setState(() {
                          this._password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 12) {
                          return "Password length should be atleast 12";
                        } else if (value.contains(' ')) {
                          return 'Not a Valid Password';
                        }
                        return null;
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: TextFormField(
                      maxLength: 18,
                      enabled: this._password != null &&
                          this._password!.isNotEmpty &&
                          this._password!.length >= 12,
                      decoration: InputDecoration(
                          fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 12) {
                          return "Password length should be atleast 12";
                        } else if (value.contains(' ')) {
                          return 'Not a Valid Password';
                        }
                        return null;
                      }),
                ),
                CustomButton(
                  text: 'Register',
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade500,
                  textcolor: Colors.white,
                  onPressed: () {
                    handleSubmitted(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
