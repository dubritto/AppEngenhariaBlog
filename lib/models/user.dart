enum UserType { STUDENT, PROFESSIONAL}

class User{

  User({this.name, this.email, this.password, this.occupation, this.phone});

  String name;
  String email;
  String password;
  String occupation;

  String phone;
  UserType userType = UserType.STUDENT;


}