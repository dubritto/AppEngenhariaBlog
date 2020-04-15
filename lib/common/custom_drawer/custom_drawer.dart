import 'package:clube_da_obra/common/custom_drawer/widgets/custom_header.dart';
import 'package:clube_da_obra/common/custom_drawer/widgets/icon_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          IconSection(),
          Divider(color: Colors.grey,),
        ],
      ),
    );
  }
}
