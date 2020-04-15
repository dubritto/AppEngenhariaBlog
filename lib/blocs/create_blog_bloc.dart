import 'package:clube_da_obra/models/Ad.dart';
import 'package:rxdart/rxdart.dart';

enum CreateBlogState { IDLE, LOADING, DONE }

class CreateBlogBloc {

  final BehaviorSubject<CreateBlogState> _stateController =
      BehaviorSubject<CreateBlogState>.seeded(CreateBlogState.IDLE);

  Stream<CreateBlogState> get outState => _stateController.stream;

  Future<bool> saveAd(Ad ad) async {
    _stateController.add(CreateBlogState.LOADING);

    // mandar o ad pro repositorio

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(CreateBlogState.DONE);
    return true;
  }

  void dispose(){
    _stateController.close();
  }

}