import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;




  InputField({this.icon, this.hint, this.obscure, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                icon: Icon(icon, color: Colors.white,),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32)),
                contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                fillColor: Colors.white,
                filled: true,
                errorText: snapshot.hasError ? snapshot.error : null,


              ),
              style: TextStyle(color: Colors.white),
              obscureText: obscure,
            ),
          );
        }
    );
  }
}
