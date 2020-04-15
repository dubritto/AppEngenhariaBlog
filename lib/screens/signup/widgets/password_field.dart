import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  const PasswordField({ this.onSaved, this.enabled });

  final FormFieldSetter<String> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) {

    Widget _buildBar(int n, String pass){
      final int level = _calcScore(pass);
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: n <= level ? _getColor(level) : Colors.transparent,
            border: n > level ? Border.all(color: Colors.white) : null
          ),
        ),
      );
    }

    return FormField<String>(
      initialValue: '',
      onSaved: onSaved,
      validator: (text){
        if(text.isEmpty || _calcScore(text) < 2)
          return '     Senha inválida!';
        return null;
      },
      builder: (state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              obscureText: true,
              onChanged: state.didChange,
              enabled: enabled,
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32)),
                contentPadding: EdgeInsets.fromLTRB(20, 16, 32, 16),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            if(state.value.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 6, left: 20, right: 20),
              height: 8,
              child: Row(
                children: <Widget>[
                  _buildBar(0, state.value),
                  _buildBar(1, state.value),
                  _buildBar(2, state.value),
                  _buildBar(3, state.value),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 10),
              child: state.value.isNotEmpty || state.hasError ? Text(
                state.value.isNotEmpty ? _getText(_calcScore(state.value)) : state.errorText,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: _getColor(_calcScore(state.value)),
                  fontSize: 12,
                ),
              ) : Container(),
            )
          ],
        );
      }
    );

  }


  //FUNÇÃO PARA CONTROLAR A PONTUAÇÃO DE SENHA (LEMBRAR DE UTILIZAR COM O CONTADOR DE LIKES!)
  int _calcScore(String text) {
    int score = 0;
    if(text.length > 8)
      score += 1;
    if(text.contains(RegExp(r'[0-9]')))
      score += 1;
    if(text.contains(RegExp(r'[A-Z]')))
      score += 1;
    return score;
    }

    Color _getColor(int level){
    switch(level){
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.greenAccent;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
    }

  String _getText(int level){
    switch(level){
      case 0:
        return '     Senha muito fraca!';
      case 1:
        return '     Senha razoavelmente fraca';
      case 2:
        return '     Senha razoavelmente forte';
      case 3:
        return '     Senha forte!';
      default:
        return '';
    }
  }

}
