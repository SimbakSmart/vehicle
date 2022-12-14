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
      drawer: widget.token.user.userType == 0
          ? _getMechanicMenu()
          : _getCustomerMenu(),
    );
  }

  // Widget _getBody() {
  //   return Container(
  //     margin: EdgeInsets.all(30.0),
  //     child: Center(
  //       child: Text('Bienvenid@ ${widget.token.user.fullName}',
  //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
  //     ),
  //   );
  // }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: FadeInImage(
                placeholder: AssetImage('assets/vehicles_logo.png'),
                //image: NetworkImage(widget.token.user.imageFullPath),
                image: NetworkImage(
                    'https://live.mrf.io/statics/i/ps/www.muycomputer.com/wp-content/uploads/2011/10/dennis-ritchie2.jpg?width=1200&enable=upscale'),
                fit: BoxFit.cover),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Bienvenid@ ${widget.token.user.fullName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
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
            title: const Text('Tipos de Veh??culos'),
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
            title: const Text('Cerras Sesi??n'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _getCustomerMenu() {
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
            title: const Text('Mis Veh??culos'),
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
            title: const Text('Cerras Sesi??n'),
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
