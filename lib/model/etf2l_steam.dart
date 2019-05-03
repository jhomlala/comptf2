class Etf2lSteam {
  String avatar;
  String group;

  Etf2lSteam({
    this.avatar,
    this.group,
  });

  factory Etf2lSteam.fromJson(Map<String, dynamic> json) => new Etf2lSteam(
    avatar: json["avatar"],
    group: json["group"] == null ? null : json["group"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "group": group == null ? null : group,
  };
}