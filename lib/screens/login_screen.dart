import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _showLogo(),
        _showEmail()
      ],
    ),
  ),
    );
  }


Widget _showLogo(){
    return Image(
        image: AssetImage('assets/vehicles_logo.png'));
}

Widget _showEmail(){
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Ingresa tu email....',
          labelText: 'Email',
          suffixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onChanged: (value){

        },
      ),
    );
}

}