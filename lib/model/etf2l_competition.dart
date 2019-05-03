import 'package:comptf2/model/enum_values.dart';

class Etf2lCompetition {
  final String category;
  final String description;
  final String id;
  final String name;
  final Etf2lCompetitionType type;

  Etf2lCompetition(this.category, this.description, this.id, this.name,
      this.type);

  Etf2lCompetition.fromJson(Map<String, dynamic> json)
      : category = json["category"],
        description= json["description"],
        id=json["id"],
        name=json["name"],
        type=typeValues.map[json["type"]];

}


enum Etf2lCompetitionType { THE_6_ON6, HIGHLANDER, FUN_TEAM }

final typeValues = new EnumValues({
  "Fun Team": Etf2lCompetitionType.FUN_TEAM,
  "Highlander": Etf2lCompetitionType.HIGHLANDER,
  "6on6": Etf2lCompetitionType.THE_6_ON6
});