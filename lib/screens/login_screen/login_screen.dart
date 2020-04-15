import 'package:clube_da_obra/blocs/login/field_state.dart';
import 'package:clube_da_obra/blocs/login/login_bloc.dart';
import 'package:clube_da_obra/helpers/input_field.dart';
import 'package:clube_da_obra/screens/login_screen/widgets/facebook_button.dart';
import 'package:clube_da_obra/screens/login_screen/widgets/login_button.dart';
import 'package:clube_da_obra/screens/login_screen/widgets/or_divider.dart';
import 'package:clube_da_obra/screens/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset('images/worker_icon.png',
                      scale: 3,),
                    ),
                  ),

                  StreamBuilder<FieldState>(
                    stream: _loginBloc.outEmail,
                    initialData: FieldState(),
                      builder: (context, snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                      icon: Icon(Icons.person_outline,
                          size: 40,
                          color: Colors.greenAccent),
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                      fillColor: Colors.white,
                      filled: true,
                       errorText: snapshot.data.error,
                      ),
                      onChanged: _loginBloc.changeEmail,
                      enabled: snapshot.data.enabled,
                    );
                   },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 26, right: 14),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Container()),
                        GestureDetector(
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.greenAccent,
                            ),
                          ),
                          onTap: (){
                            //Navigator.of(context).push(MaterialPageRoute(
                            //  builder: (context) => RecoveryScreen()));
                          },
                        )
                      ],
                    ),
                  ),
                  StreamBuilder<FieldState>(
                    stream: _loginBloc.outPassword,
                    initialData: FieldState(),
                    builder: (context, snapshot) {
                      return TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock_outline,
                              size: 40,
                              color: Colors.greenAccent),
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)),
                          contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                          fillColor: Colors.white,
                          filled: true,
                          errorText: snapshot.data.error,
                        ),
                        onChanged: _loginBloc.changePassword,
                        enabled: snapshot.data.enabled,
                      );
                    },
                  ),
                  LoginButton(_loginBloc),
                  Divider(
                    color: Colors.white70,
                    indent: 40,
                    endIndent: 40,
                  ),
                  Padding(

                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Não possue cadastro?   ',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()
                            ));
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OrDivider(),
                  FacebookButton(_loginBloc),
                ],
              ),
            ),
          ),
      ),

    );
  }
}
