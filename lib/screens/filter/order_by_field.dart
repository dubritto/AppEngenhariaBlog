import 'package:clube_da_obra/models/filter.dart';
import 'package:flutter/material.dart';

class OrderByField extends StatelessWidget {

  OrderByField({this.onSaved, this.initialValue});

  final FormFieldSetter<OrderBy> onSaved;
  final OrderBy initialValue;

  @override
  Widget build(BuildContext context) {
    return FormField<OrderBy>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state){
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                state.didChange(OrderBy.DATE);
              },
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    border: Border.all(color: state.value == OrderBy.DATE ?
                    Colors.transparent : Colors.greenAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: state.value == OrderBy.DATE ? Colors.greenAccent : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text(
                  'Data',
                  style: TextStyle(
                      color: state.value == OrderBy.DATE ? Colors.white : Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                state.didChange(OrderBy.LIKES);
              },
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    border: Border.all(color: state.value == OrderBy.LIKES ?
                    Colors.transparent : Colors.greenAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: state.value == OrderBy.LIKES ? Colors.greenAccent : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text(
                  'Likes',
                  style: TextStyle(
                      color: state.value == OrderBy.LIKES ? Colors.white : Colors.white
                  ),
                ),
              ),
            )
          ],
        );
      },

    );
  }
}
