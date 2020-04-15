import 'package:clube_da_obra/screens/filter/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 20.0,
            offset: Offset(
             0, 2
            )
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          BarButton(
            label: 'Categorias',
            boxDecoration: BoxDecoration(
              color: Colors.white
            ),
            onPressed: (){},
          ),
          BarButton(
            label: 'Filtros',
            boxDecoration: BoxDecoration(
                color: Colors.white,
              border: Border(
                left: BorderSide(color: Colors.black)
              )
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>FilterScreen()
                )
              );
            },
          )
        ],
      ),
    );
  }
}
