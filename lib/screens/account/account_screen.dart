import 'package:clube_da_obra/common/custom_drawer/custom_drawer.dart';
import 'package:clube_da_obra/screens/editaccount/edit_account_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: Text('Minha conta'),
        actions: <Widget>[
          FlatButton(
            child: const Text('EDITAR'),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>EditAccountScreen())
              );
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            alignment: Alignment.center,
            child: Text('Eduardo Britto',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            ),
          ),
          ListTile(
            title: Text(
              'Minhas publicações',
              style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            title: Text(
                'Favoritos',
              style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          )
        ],
      ),
    );

  }
}
