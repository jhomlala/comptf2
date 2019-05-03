import 'package:comptf2/repository/etf2l_provider.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class Etf2lHtmlBloc{
  Etf2lProvider provider = Etf2lProvider();
  final teamsPageSubject = BehaviorSubject<Response>();

  void getTeamPage(String teamId) async{
    var response =  await provider.getTeamPage(teamId);
    teamsPageSubject.add(response);
  }

  dispose(){
    teamsPageSubject.sink.close();
  }

}