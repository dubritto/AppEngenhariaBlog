import 'package:clube_da_obra/blocs/signup_bloc.dart';
import 'package:clube_da_obra/screens/signup/widgets/field_title.dart';
import 'package:clube_da_obra/screens/signup/widgets/password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;


  @override
  void initState() {
    super.initState();

    _signUpBloc = SignUpBloc();
  }


  @override
  void dispose() {
    _signUpBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black
      ),
      backgroundColor: Colors.black,

      body: Form(
        key: _formKey,
        child: StreamBuilder<SignUpBlocState>(
          stream: _signUpBloc.outState,
          builder: (context, snapshot) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: <Widget>[
                const FieldTitle(
                  title: '   Nome',
                  subtitle: 'Como aparecerá para os outros',
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'ex.: Eduardo Britto',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (text){
                    if(text.length < 6)
                      return 'Apelido muito curto';
                    return null;
                  },
                  onSaved: _signUpBloc.setName,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                SizedBox(
                  height: 20,
                ),
                const FieldTitle(
                  title: '   E-mail',
                  subtitle: 'Enviaremos um e-mail para confirmação',
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'ex.: edu@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (text){
                    if(text.length < 6 || !text.contains('@'))
                      return 'E-mail inválido';
                      return null;

                  },
                  onSaved: _signUpBloc.setEmail,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                SizedBox(
                  height: 20,
                ),
                const FieldTitle(
                  title: '   Senha',
                  subtitle: 'Utilize números, letras, e carácteres',
                ),

                PasswordField(
                  onSaved: _signUpBloc.setPassword,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                SizedBox(
                  height: 20,
                ),
                const FieldTitle(
                  title: '   Área de atuação',
                  subtitle: 'Tipo de formação ou trabalho',
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'ex.: Arquitetura, Eng. Cívil..',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (text){
                    if(text.length < 6 )
                      return 'Descrição muito curta!';
                    return null;
                  },
                  onSaved: _signUpBloc.setOccupation,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  height: 50,
                  child: RaisedButton(
                    color: Colors.greenAccent,
                    disabledColor: Colors.greenAccent.withAlpha(150),
                    child: snapshot.data.state == SignUpState.LOADING ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ):
                    Text(
                        'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: snapshot.data.state != SignUpState.LOADING ? _signUp : null,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white70,
                    indent: 40,
                    endIndent: 40
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Já tem uma conta? ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  void _signUp(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      _signUpBloc.signUP();

    }
  }
}
