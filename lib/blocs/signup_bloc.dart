import 'package:clube_da_obra/models/user.dart';
import 'package:rxdart/rxdart.dart';

enum SignUpState{ IDLE, LOADING, ERROR }

class SignUpBlocState {
  SignUpBlocState(this.state, {this.errorMessage});
  
  SignUpState state;
  String errorMessage;
}

class SignUpBloc{

  final BehaviorSubject<SignUpBlocState> _stateController = 
      BehaviorSubject<SignUpBlocState>.seeded(SignUpBlocState(SignUpState.IDLE));

  Stream<SignUpBlocState> get outState => _stateController.stream;

  User user = User();

  void signUP() async {
    _stateController.add(SignUpBlocState(SignUpState.LOADING));

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(SignUpBlocState(SignUpState.IDLE));
  }

  void setName(String name){
    user.name = name;
  }

  void setEmail(String email){
    user.email = email.toLowerCase();
  }

  void setPassword(String password){
    user.password = password;
  }
  void setOccupation(String occupation){
    user.occupation = occupation;
  }

  void dispose(){
    _stateController.close();
  }


}