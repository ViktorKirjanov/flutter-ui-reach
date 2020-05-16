import 'package:flutter/material.dart';
import 'package:login_and_dashboard/pages/main_page.dart';

import '_widgets/action_button.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -315,
              child: Container(
                padding: EdgeInsets.only(bottom: 315),
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/bg.png'),
              ),
            ),
            Positioned(
              top: 56,
              left: 17,
              child: Container(
                height: 50,
                width: 50,
                child: RawMaterialButton(
                  highlightColor: Colors.white.withOpacity(0.16),
                  splashColor: Colors.white.withOpacity(0.12),
                  child: Image.asset('assets/icons/back.png'),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 44.0, 30.0, 50.0),
                  height: 505.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                  ),
                  child: _buildForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: Text(
            'Email',
            style: TextStyle(
              fontSize: 14.0,
              letterSpacing: 0.02,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(86, 81, 115, 1.0),
            ),
          ),
        ),
        Container(
          height: 46.0,
          child: TextField(
            cursorColor: Color.fromRGBO(204, 61, 106, 1),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(14.0),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
              hintText: "Type in your email",
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: 14.0,
              letterSpacing: 0.02,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(86, 81, 115, 1.0),
            ),
          ),
        ),
        Container(
          height: 46.0,
          child: TextField(
            cursorColor: Color.fromRGBO(204, 61, 106, 1),
            obscureText: passwordVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 15),
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromRGBO(144, 141, 161, 1),
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(14.0),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
              hintText: "Type in your password",
            ),
          ),
        ),
        Spacer(),
        ActionButton(
          title: 'Sign In',
          textColor: Colors.white,
          backgroundColor: Color.fromRGBO(204, 61, 106, 1),
          action: () => Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute<bool>(
              builder: (BuildContext context) => MainPage(),
            ),
          ),
        ),
      ],
    );
  }
}
