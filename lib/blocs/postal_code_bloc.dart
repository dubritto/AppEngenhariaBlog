import 'package:clube_da_obra/api/api_postal_code.dart';
import 'package:clube_da_obra/models/address.dart';
import 'package:clube_da_obra/repositories/api_response.dart';
import 'package:rxdart/rxdart.dart';

enum PostalCodeFieldState { INITIALIZING, INCOMPLETE, INVALID, VALID }

class PostalCodeBlocState {
  PostalCodeBlocState(
      {this.postalCodeFieldState, this.postalCode, this.address});

  PostalCodeFieldState postalCodeFieldState;
  String postalCode;
  Address address;
}

class PostalCodeBloc {

  PostalCodeBloc(){
    onChanged('');
  }

  final BehaviorSubject<PostalCodeBlocState> _postalCodeController =
      BehaviorSubject<PostalCodeBlocState>();
  Stream<PostalCodeBlocState> get outPostalCode => _postalCodeController.stream;

  void searchPostalCode(String postalCode) async {
    final ApiResponse apiResponse = await getAddressFromAPI((postalCode));

    if (apiResponse.success) {
      _postalCodeController.add(PostalCodeBlocState(
        postalCodeFieldState: PostalCodeFieldState.VALID,
        postalCode: postalCode,
        address: apiResponse.result,
      ));
    } else {
      _postalCodeController.add(PostalCodeBlocState(
          postalCodeFieldState: PostalCodeFieldState.INVALID,
          postalCode: postalCode));
    }
  }

  void onChanged(String postalCode) {
    postalCode = postalCode.trim().replaceAll('-', '').replaceAll('.', '');

    if (postalCode.isEmpty || postalCode.length < 8) {
      _postalCodeController.add(PostalCodeBlocState(
          postalCodeFieldState: PostalCodeFieldState.INCOMPLETE,
          postalCode: postalCode));
    } else {
      searchPostalCode(postalCode);
    }
  }

  void dispose() {
    _postalCodeController.close();
  }
}
