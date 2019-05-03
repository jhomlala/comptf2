import 'package:comptf2/blocs/etf2l_api_bloc.dart';
import 'package:comptf2/model/etf2l_competition.dart';
import 'package:comptf2/model/etf2l_competitions_response.dart';
import 'package:comptf2/view/competition_view.dart';
import 'package:comptf2/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class CompetitionsView extends StatefulWidget {
  @override
  _CompetitionsViewState createState() => _CompetitionsViewState();
}

class _CompetitionsViewState extends State<CompetitionsView> {
  _CompetitionsViewState() {
    etf2lApiBloc.getCompetitions();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return StreamBuilder(
        stream: etf2lApiBloc.competitionsSubject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            var data = snapshot.data as Etf2lCompetitionsResponse;
            return GridView.count(
              crossAxisCount: 2,
              children: _setupGridElements(data),
            );
          } else {
            return Center(child: SizedBox(width: 40.0, height: 40.0,child: ProgressBar()));
          }
        });
  }

  List<Widget> _setupGridElements(Etf2lCompetitionsResponse response) {
    List<Widget> widgets = List();
    response.competitions.values.forEach((Etf2lCompetition competition) {
      widgets.add(_setupGridElement(competition));
    });
    return widgets;
  }

  Widget _setupGridElement(Etf2lCompetition competition) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CompetitionView(competition)));
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage(
                      _getCompetitionBackgroundImage(competition.type),
                    ),
                    fit: BoxFit.cover)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: _getCompetitionColor(competition.type),
                  child: Text(
                        competition.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: _getCompetitionColor(competition.type)),
                  child: Text(
                    _getCompetitionTypeName(competition.type),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ])));
  }

  String _getCompetitionTypeName(Etf2lCompetitionType competitionType) {
    if (competitionType == Etf2lCompetitionType.FUN_TEAM) {
      return "FUN";
    } else if (competitionType == Etf2lCompetitionType.HIGHLANDER) {
      return "9v9";
    } else if (competitionType == Etf2lCompetitionType.THE_6_ON6) {
      return "6v6";
    } else {
      return "???";
    }
  }

  Color _getCompetitionColor(Etf2lCompetitionType competitionType) {
    if (competitionType == Etf2lCompetitionType.FUN_TEAM) {
      return Colors.deepPurple;
    } else if (competitionType == Etf2lCompetitionType.HIGHLANDER) {
      return Colors.blue;
    } else if (competitionType == Etf2lCompetitionType.THE_6_ON6) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }

  String _getCompetitionBackgroundImage(Etf2lCompetitionType competitionType) {
    if (competitionType == Etf2lCompetitionType.FUN_TEAM) {
      return "assets/badwater.jpg";
    } else if (competitionType == Etf2lCompetitionType.HIGHLANDER) {
      return "assets/upward.jpg";
    } else if (competitionType == Etf2lCompetitionType.THE_6_ON6) {
      return "assets/product.jpg";
    } else {
      return "assets/upward.jpg";
    }
  }
}
