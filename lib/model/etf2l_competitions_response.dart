import 'package:comptf2/model/etf2l_competition.dart';
import 'package:comptf2/model/etf2l_page.dart';

class Etf2lCompetitionsResponse {
  Etf2lPage page;
  Map<String, Etf2lCompetition> competitions;

  Etf2lCompetitionsResponse({
    this.page,
    this.competitions,
  });

  factory Etf2lCompetitionsResponse.fromJson(Map<String, dynamic> json) =>
      new Etf2lCompetitionsResponse(
        page: Etf2lPage.fromJson(json["page"]),
        competitions: new Map.from(json["competitions"]).map((k, v) =>
            new MapEntry<String, Etf2lCompetition>(
                k, Etf2lCompetition.fromJson(v))),
      );
}
