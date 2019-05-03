
import 'package:comptf2/model/etf2l_teams_response.dart';
import 'package:comptf2/repository/etf2l_provider.dart';
import 'package:rxdart/subjects.dart';

class Etf2lCompetitionApiBloc {
  final Etf2lProvider provider = Etf2lProvider();
  final teamsSubject = BehaviorSubject<Etf2lTeamsResponse>();

  void getTeams(String competitionId, int page) async {
    teamsSubject.value =
        await provider.getCompetitionTeams(competitionId, page);
  }

  dispose() {
    teamsSubject.sink.close();
  }
}
