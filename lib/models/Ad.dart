import 'package:clube_da_obra/models/address.dart';

class Ad{

  List<dynamic> images;
  String title;
  String description;

  Address address;

  DateTime dateCreated = DateTime.now();

  //bool hidePhone;

  @override
  String toString() {
    return '$images, $title $description, $address';
  }






}