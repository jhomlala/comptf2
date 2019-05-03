import 'package:comptf2/model/etf2l_steam.dart';

class Etf2lTeamShort {
  String id;
  Etf2lSteam steam;
  String country;
  String url;
  String name;

  Etf2lTeamShort({
    this.id,
    this.steam,
    this.country,
    this.url,
    this.name,
  });

  factory Etf2lTeamShort.fromJson(Map<String, dynamic> json, String teamId) => new Etf2lTeamShort(
    id: teamId,
    steam: Etf2lSteam.fromJson(json["steam"]),
    country: json["country"],
    url: json["url"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "steam": steam.toJson(),
    "country": country,
    "url": url,
    "name": name,
  };
}