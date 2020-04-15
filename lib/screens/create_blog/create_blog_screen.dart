import 'package:clube_da_obra/api/api_postal_code.dart';
import 'package:clube_da_obra/blocs/create_blog_bloc.dart';
import 'package:clube_da_obra/blocs/drawer_bloc.dart';
import 'package:clube_da_obra/blocs/home_bloc.dart';
import 'package:clube_da_obra/common/custom_drawer/cep_field.dart';
import 'package:clube_da_obra/common/custom_drawer/custom_drawer.dart';
import 'package:clube_da_obra/models/Ad.dart';
import 'package:clube_da_obra/screens/create_blog/widgets/hide_phone_widget.dart';
import 'package:clube_da_obra/screens/create_blog/widgets/images_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateBlogScreen extends StatefulWidget {
  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateBlogBloc _createBlogBloc;

  Ad ad = Ad();


  @override
  void initState() {
    super.initState();
    _createBlogBloc = CreateBlogBloc();
  }


  @override
  void dispose() {
    _createBlogBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Inserir Conteúdo', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: StreamBuilder<CreateBlogState>(
          stream: _createBlogBloc.outState,
          builder: (context, snapshot) {
            if(snapshot.data == CreateBlogState.LOADING){
              return Center(
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.greenAccent,
                    ),
                    strokeWidth: 5.0,
                  ),
                ),
              );
            }
            return ListView(
              children: <Widget>[
                ImagesField(
                  onSaved: (images){
                    ad.images = images;

                  },
                  initialValue: [],
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 6.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      fillColor: Colors.blueGrey[700],
                      filled: true,
                      labelText: "Assunto *",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      contentPadding:
                      const EdgeInsets.fromLTRB(16, 10, 12, 10),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (text) {
                      if (text.isEmpty) return 'Campo Obrigatório';
                      return null;
                    },
                    onSaved: (t){
                      ad.title = t;

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                  child: TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      fillColor: Colors.blueGrey[700],
                      filled: true,
                      labelText: "Descrição *",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      contentPadding:
                      const EdgeInsets.fromLTRB(16, 10, 12, 10),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (text) {
                      if (text.trim().isEmpty) return 'Campo Obrigatório';
                      if (text.trim().length < 10) return 'Descrição muito curta!';
                      return null;
                    },
                    onSaved: (d){
                      ad.description = d;

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                  child: CepField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      fillColor: Colors.blueGrey[700],
                      filled: true,
                      labelText: "CEP *",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      contentPadding:
                      const EdgeInsets.fromLTRB(16, 10, 12, 10),
                    ),

                    onSaved: (a){
                      ad.address = a;
                    },

                  ),
                ),
                /*HidePhoneWidget(
                  onSaved: (h){
                  ad.hidePhone = h;
                  },
                  initialValue: false,
                ),*/
                Container(
                  height: 55,
                  child: RaisedButton(
                    color: Colors.greenAccent,
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        Provider.of<HomeBloc>(context, listen: false).addAd(ad);

                        final bool success = await _createBlogBloc.saveAd(ad);

                        if(success){
                          Provider.of<DrawerBloc>(context, listen: false).setPage(0);
                        }
                      }
                    },
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
