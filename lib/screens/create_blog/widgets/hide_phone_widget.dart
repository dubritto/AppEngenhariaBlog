import 'package:flutter/material.dart';

class HidePhoneWidget extends FormField<bool>{

  HidePhoneWidget({FormFieldSetter<bool> onSaved, bool initialValue}) : super (
    initialValue: initialValue,
    onSaved: onSaved,
    builder: (state){
      return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 15),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 16,
              width: 16,
              color: Colors.white,
              child: Checkbox(
                checkColor: Colors.deepOrange,
                activeColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                value: state.value,
                onChanged: (b){
                  state.didChange(b);
                },
              ),
            ),
            const Text('Ocultar o meu telefone neste post', style: TextStyle(color: Colors.white),)
          ],
        ),
      );
    }
  );

}