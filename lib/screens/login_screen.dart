import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle/helpers/constants.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {

  String _email = '';
  String _emailError = '';
  bool _emailShowError = false;

  String _password = '';
  String _passwordError = '';
  bool _passwordShowError = false;

  bool _rememberme = true;
  bool _passwordShow = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        _showLogo(),
        SizedBox(height: 20),
        _showEmail(),
        _showPassword(),
        _showRememberme(),
        _showButtons()
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
          fillColor: Colors.white,
          hintText: 'Ingresa tu email....',
          labelText: 'Email',
          errorText: _emailShowError ? _emailError : null,
          prefixIcon: Icon(Icons.alternate_email),
          suffixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onChanged: (value){
         _email=value;
        },
      ),
    );
}

Widget _showPassword(){
  return Container(
    padding: EdgeInsets.all(20),
    child: TextField(
      obscureText:!_passwordShow,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu contraseña...',
          labelText: 'Contraseña',
          errorText: _passwordShowError ? _passwordError:null,
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: _passwordShow ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwordShow = !_passwordShow;
              });
            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      onChanged: (value){
        _password = value;
      },
    ),
  );
}

Widget _showRememberme(){
    return CheckboxListTile(
       title: Text('Recordarme'),
      value: true,
      onChanged: (bool? value) {
        setState(() {
          _rememberme = value!;
        });
      },

    );
}

Widget _showButtons(){
    return Container(
      margin: EdgeInsets.only(left: 10 ,right: 10),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _showLoginButton(),
            SizedBox(width: 20),
            _showRegisterButton()
          ],
           )
         ],
       ),
    );
}

Widget _showLoginButton() {
    return Expanded(
        child: ElevatedButton(
          child:Text('Iniciar Sesión'),
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.resolveWith((states) => Color(0xFF120E43))
          ),
          onPressed: () {
        setState(() {
          _login();
        });

          },

    ));
  }

  Widget  _showRegisterButton(){
    return Expanded(
        child: ElevatedButton(
          child:Text('Nuevo Usuario'),
          style: ButtonStyle(
              backgroundColor:MaterialStateProperty.resolveWith((states) => Color(0xFFE03B8B))
          ),
          onPressed: () {  },

        ));
  }

  bool _validateFields(){
    bool hasErrors = false;
    if (_email.isEmpty) {
      hasErrors = true;
      _emailShowError = true;
      _emailError = 'Debes ingresar tu email.';

    }
    else if (!EmailValidator.validate(_email)) {
      hasErrors = true;
      _emailShowError = true;
      _emailError = 'Debes ingresar un email válido.';
    } else {
      _emailShowError = false;
    }


    if (_password.isEmpty) {
      hasErrors = true;
      _passwordShowError = true;
      _passwordError = 'Debes ingresar tu contraseña.';
    } else if (_password.length < 6) {
      hasErrors = true;
      _passwordShowError = true;
      _passwordError = 'Debes ingresar una contraseña de al menos 6 carácteres.';
    } else {
      _passwordShowError = false;
    }

    setState(() { });
    return hasErrors;
  }

  Future<void> _login() async {
    if(!_validateFields()) {
      return;
    }


    Map<String, dynamic> request = {
      'userName': _email,
      'password': _password,
    };

    var url = Uri.parse('${Constans.apiUrl}/api/Account/CreateToken');
    var response = await http.post(
      url,
      headers: {
        'content-type' : 'application/json',
        'accept' : 'application/json',
      },
      body: jsonEncode(request),
    );

    print(response.body);
  }

}