import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/register_ui.dart';
import 'package:flutter_login_ui/utils/custombutton.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final GlobalKey<FormFieldState<String>> _emailFieldKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String? _email;
  // ignore: unused_field
  String? _password;

  handleSubmitted(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterUI()));
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
                  'assets/images/login.png',
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
                CustomButton(
                  text: 'Login',
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

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obsecureText,
      maxLength: 18,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.blue[100],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        hintText: widget.hintText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obsecureText = !_obsecureText;
            });
          },
          child: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}

class EmailField extends StatefulWidget {
  const EmailField({
    this.fieldKey,
    this.hintText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.blue[100],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        hintText: widget.hintText,
        helperText: widget.helperText,
      ),
    );
  }
}
