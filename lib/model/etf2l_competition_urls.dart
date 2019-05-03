class Etf2lCompetitionUrls {
  final String matches;
  final String results;
  final String self;
  final String teams;

  Etf2lCompetitionUrls(this.matches, this.results, this.self, this.teams);

  Etf2lCompetitionUrls.fromJson(Map<String, dynamic> json)
      : matches = json["matches"],
        results=json["results"],
        self=json["self"],
        teams=json["teams"];

}