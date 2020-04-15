import 'package:clube_da_obra/models/filter.dart';
import 'package:clube_da_obra/screens/filter/widgets/likes_range_field.dart';
import 'package:clube_da_obra/screens/filter/widgets/section_title.dart';
import 'package:clube_da_obra/screens/filter/widgets/vendor_type_field.dart';
import 'package:clube_da_obra/screens/home/widgets/animated_button.dart';
import 'package:flutter/material.dart';

import 'order_by_field.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  Filter _filter = Filter(
    maxLikes: 100,
    minLikes: 10,
    vendorType: VENDOR_TYPE_PARTICULAR,
    orderBy: OrderBy.LIKES,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Filtrar Busca',
        style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  const SectionTitle(title: 'Ordernar por'),
                  OrderByField(
                    initialValue: _filter.orderBy,
                    onSaved: (v){
                      _filter.orderBy = v;
                    }
                  ),
                  const SectionTitle(title: 'Número de likes'),
                  LikesRangeField(
                    filter: _filter,

                  ),
                  const SectionTitle(title: 'Tipo do usuário'),
                  VendorTypeField(
                    initialValue: _filter.vendorType,
                    onSaved: (v){
                      _filter.vendorType = v;
                    },
                  ),
                  const SizedBox(height: 500,)
                ],
              ),
            ),
            AnimatedButton(
              scrollController: _scrollController,
              onTap: (){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();

                  if(_filter.maxLikes != null && _filter.minLikes != null){
                    if(_filter.minLikes > _filter.maxLikes){
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Faixa de preço inválida'
                          ),
                          backgroundColor: Colors.greenAccent,
                        )
                      );
                      return;
                  }
                 }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
