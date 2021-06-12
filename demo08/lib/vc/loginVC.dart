import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginVC extends StatefulWidget {
  LoginVC({Key? key}) : super(key: key);

  @override
  _LoginVCState createState() => _LoginVCState();
}

class _LoginVCState extends State<LoginVC> {
  final formKey = GlobalKey<FormState>();
  late String email, password;
  Color greenColor = Color(0xFF00AF19);

  // To check fields during submit
  bool checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

//To Validate email
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return 'Pass';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          child: _buildLoginForm(),
          key: formKey,
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: ListView(
        children: [
          SizedBox(
            height: 75.0,
          ),
          Container(
            height: 125.0,
            width: 200,
            child: Stack(
              children: [
                Text(
                  'TaskIt',
                  style: TextStyle(fontSize: 60.0),
                ),
                Positioned(
                  top: 63,
                  left: 10,
                  child: Text(
                    'Plan as you go along!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'PASSWORD',
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.withOpacity(0.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greenColor),
              ),
            ),
            obscureText: true,
            onChanged: (value) {
              this.password = value;
            },
            validator: (value) {
              value!.isEmpty ? 'Password is required' : null;
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Container()));
            },
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: greenColor,
                      fontSize: 11,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              if (checkFields()) {}
            },
            child: Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                color: greenColor,
                elevation: 4.0,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
