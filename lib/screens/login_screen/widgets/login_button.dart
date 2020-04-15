import 'package:clube_da_obra/blocs/login/button_state.dart';
import 'package:clube_da_obra/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {


  LoginButton(this.loginBloc);

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100, right: 100),
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<ButtonState>(
          stream: loginBloc.outLoginButton,
          initialData: ButtonState(enabled: false, loading: false),
          builder: (context, snapshot) {
              return RaisedButton(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
                color: Colors.greenAccent,
                onPressed: snapshot.data.enabled ? () async {
                  final bool success = await loginBloc.loginWithEmail();
                  if(success)
                    Navigator.of(context).pop();
                }: null,
                child: snapshot.data.loading ?
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                :
                Text("Entrar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                textColor: Colors.white,
                disabledColor: Colors.greenAccent.withAlpha(150),
              );

          }
      ),
    );
  }
}
