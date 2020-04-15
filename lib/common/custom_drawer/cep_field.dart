import 'package:brasil_fields/brasil_fields.dart';
import 'package:clube_da_obra/blocs/postal_code_bloc.dart';
import 'package:clube_da_obra/models/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepField extends StatefulWidget {

  CepField({this.decoration, this.onSaved});

  final InputDecoration decoration;
  final FormFieldSetter<Address> onSaved;
  

  @override
  _CepFieldState createState() => _CepFieldState();
}

class _CepFieldState extends State<CepField> {

  InputDecoration get decoration => widget.decoration;
  FormFieldSetter<Address> get onSaved => widget.onSaved;

  PostalCodeBloc postalCodeBloc;

  @override
  void initState(){
    super.initState();
    postalCodeBloc = PostalCodeBloc();
  }

  @override
  void dispose(){
    postalCodeBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostalCodeBlocState>(
      initialData: PostalCodeBlocState(
        postalCodeFieldState: PostalCodeFieldState.INITIALIZING,
      ),
      stream: postalCodeBloc.outPostalCode,
      builder: (context, snapshot) {
        if(snapshot.data.postalCodeFieldState == PostalCodeFieldState.INITIALIZING)
          return Container();
        return Column(
          children: <Widget>[
            TextFormField(
              initialValue: snapshot.data.postalCode,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: decoration,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CepInputFormatter(),

              ],
              onSaved: (c){
                onSaved(snapshot.data.address);
              },
              onChanged: postalCodeBloc.onChanged,
              validator: (c){
                switch(snapshot.data.postalCodeFieldState){
                  case PostalCodeFieldState.INITIALIZING:
                  case PostalCodeFieldState.INCOMPLETE:
                  case PostalCodeFieldState.INVALID:
                    return 'Campo obrigatório';
                  case PostalCodeFieldState.VALID:
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
            buildInformation(snapshot.data)
          ],
        );
      }
    );
  }

  Widget buildInformation(PostalCodeBlocState blocState){
    switch(blocState.postalCodeFieldState){
      case PostalCodeFieldState.INITIALIZING:
      case PostalCodeFieldState.INCOMPLETE:
        return Container();
      case PostalCodeFieldState.INVALID:
        return Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          color: Colors.red.withAlpha(100),
          alignment: Alignment.center,
          child: Text(
            'CEP inválido',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
          ),
        );
      case PostalCodeFieldState.VALID:
        final _address = blocState.address;
        return Container(
          height: 50,
          padding: EdgeInsets.all(8),
          color: Colors.deepOrange[700],
          alignment: Alignment.center,
          child: Text(
            '${_address.city} - ${_address.federativeUnit}',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        );
    }
    return Container();
  }

}
