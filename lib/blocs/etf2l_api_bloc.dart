import 'package:comptf2/model/etf2l_competitions_response.dart';
import 'package:comptf2/repository/etf2l_provider.dart';
import 'package:rxdart/rxdart.dart';

class Etf2lApiBloc {
  final competitionsSubject = BehaviorSubject<Etf2lCompetitionsResponse>();
  Etf2lProvider provider = Etf2lProvider();

  void getCompetitions() async {
    competitionsSubject.value = await provider.getCompetitions();
  }

  void dispose() {
    competitionsSubject.sink.close();
  }
}

final etf2lApiBloc = Etf2lApiBloc();
