import 'package:clube_da_obra/blocs/drawer_bloc.dart';
import 'package:clube_da_obra/screens/base/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:clube_da_obra/blocs/home_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose:(context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          dispose:(context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'Clube da Obra',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
       localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR')
        ],

        home: BaseScreen(),
      ),
    );
  }
}