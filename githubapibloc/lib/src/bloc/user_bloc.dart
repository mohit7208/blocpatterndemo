import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import 'package:githubapibloc/src/models/user_response.dart';

class UserBloc {
  final _repository = Repository();
  //PublishSubject allows sending data, error and done events to the listener.
  final _userFetcher = PublishSubject<UserResponse>(); //this is in replacement or in place of streamcontroller

  //Observable allow us to send a notification to Widgets which is observing it and then deal with the flux of data
  //Observable is replaced by Stream
  Stream<UserResponse> get allUsers => _userFetcher.stream;

  fetchUsers() async {
    UserResponse itemModel = await _repository.fetchUsers();
    _userFetcher.sink.add(itemModel);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();
