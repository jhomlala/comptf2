import 'package:comptf2/model/etf2l_competitions_response.dart';
import 'package:comptf2/repository/etf2l_repository.dart';
import 'package:comptf2/model/etf2l_teams_response.dart';
import 'package:dio/dio.dart';
class Etf2lProvider{
  Etf2lRepository repository = Etf2lRepository();

  Future<Etf2lCompetitionsResponse> getCompetitions(){
    return repository.getCompetitions();
  }

  Future<Etf2lTeamsResponse> getCompetitionTeams(String competitionId, int page){
    return repository.getCompetitionTeams(competitionId, page);
  }

  Future<Response> getTeamPage(String page){
    return repository.getTeamPage(page);
  }



}