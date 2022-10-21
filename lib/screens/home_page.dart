import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vehicle/models/token.dart';
import 'package:vehicle/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  final Token token;

  HomePage({required this.token});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicles"),
      ),
      body: _getBody(),
      drawer: _getMechanicMenu(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Center(
        child: Text('Bienvenid@ ${widget.token.user.fullName}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _getMechanicMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Image(
            image: AssetImage('assets/vehicles_logo.png'),
          )),
          ListTile(
            leading: Icon(Icons.two_wheeler),
            title: const Text('Marcas'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.precision_manufacturing),
            title: const Text('Procedimientos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.badge),
            title: const Text('Tipos de Documento'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.toys),
            title: const Text('Tipos de Vehículos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: const Text('Usuarios'),
            onTap: () {},
          ),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: const Text('Editar Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Cerras Sesión'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
