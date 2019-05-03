import 'package:comptf2/model/etf2l_competitions_response.dart';
import 'package:comptf2/model/etf2l_teams_response.dart';
import 'package:dio/dio.dart';

class Etf2lRepository {
  Dio dio = Dio();

  Future<Etf2lCompetitionsResponse> getCompetitions() async {
    Uri uri = Uri.parse("http://api.etf2l.org/competition/list.json");
    Response response = await dio.request(uri.toString());
    return Etf2lCompetitionsResponse.fromJson(response.data);
  }

  Future<Etf2lTeamsResponse> getCompetitionTeams(String competitionId, int page) async {
    Uri uri = Uri.parse("http://api.etf2l.org/competition/$competitionId/teams/$page.json");
    print("Uri: " + uri.toString());
    Response response = await dio.request(uri.toString());
    print("Response: " +response.toString());
    return Etf2lTeamsResponse.fromJson(response.data);
  }

  Future<Response> getTeamPage(String teamId) async{
    Uri uri = Uri.parse("http://etf2l.org/teams/$teamId/");
    print("Uri: " + uri.toString());
    Response response = await dio.request(uri.toString());
    print("Response: "+ response.toString());
    return response;
  }
}
