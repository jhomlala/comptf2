import 'package:comptf2/model/etf2l_competition.dart';
import 'package:flutter/material.dart';

class CompetitionInformationsView extends StatefulWidget {
  CompetitionInformationsView(this.competition);

  final Etf2lCompetition competition;
  @override
  _CompetitionInformationsViewState createState() =>
      _CompetitionInformationsViewState();
}

class _CompetitionInformationsViewState
    extends State<CompetitionInformationsView> {
  @override
  Widget build(BuildContext context) {
    return Container(padding:EdgeInsets.only(top:10),child: Column(children: [
      Text(this.widget.competition.description),
      Text(this.widget.competition.category),
    ],));
  }
}
