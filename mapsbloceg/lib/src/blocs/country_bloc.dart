import 'package:mapsbloceg/src/models/country_response.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class CountryBloc {
  final _repository = Repository();
  //PublishSubject allows sending data, error and done events to the listener.
  final _countriesFetcher = PublishSubject<CountryResponse>(); //this is in replacement or in place of streamcontroller

  //Observable allow us to send a notification to Widgets which is observing it and then deal with the flux of data
  //Observable is replaced by Stream
  Stream<CountryResponse> get allCountries => _countriesFetcher.stream;

  fetchCountries() async {
    CountryResponse itemModel = await _repository.fetchCountries();
    _countriesFetcher.sink.add(itemModel);
  }

  dispose() {
    _countriesFetcher.close();
  }
}

final bloc = CountryBloc();
