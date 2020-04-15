import 'dart:async';

import 'package:clube_da_obra/blocs/login/field_state.dart';

class LoginValidator{

  final StreamTransformer<String, FieldState> emailValidator =
    StreamTransformer<String, FieldState>.fromHandlers(
      handleData: (email, sink){
        const Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        final RegExp regex = RegExp(pattern);
        if(email.isEmpty)
          sink.add(FieldState(error: 'Campo Obrigatório'));
        else if(!regex.hasMatch(email))
          sink.add(FieldState(error: 'Email Inválido!'));
        else
          sink.add(FieldState());
      }
    );

  final StreamTransformer<String, FieldState> passwordValidator =
  StreamTransformer<String, FieldState>.fromHandlers(
      handleData: (pass, sink){
        if(pass.isEmpty)
          sink.add(FieldState(error: 'Campo Obrigatório'));
        else if(pass.length < 4)
          sink.add(FieldState(error: 'Senha incorreta'));
        else
          sink.add(FieldState());
      }
  );

}