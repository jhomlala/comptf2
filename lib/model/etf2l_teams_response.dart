import 'package:comptf2/model/etf2l_page.dart';
import 'package:comptf2/model/etf2l_team_short.dart';

class Etf2lTeamsResponse {
  Map<String, Etf2lTeamShort> teams;
  Etf2lPage page;

  Etf2lTeamsResponse({
    this.teams,
    this.page,
  });

  factory Etf2lTeamsResponse.fromJson(Map<String, dynamic> json) => new Etf2lTeamsResponse(
    teams: new Map.from(json["teams"]).map((k, v) => new MapEntry<String, Etf2lTeamShort>(k, Etf2lTeamShort.fromJson(v,k))),
    page: Etf2lPage.fromJson(json["page"]),
  );

}