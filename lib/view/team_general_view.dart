import 'package:comptf2/blocs/etf2l_html_bloc.dart';
import 'package:comptf2/model/etf2l_team_short.dart';
import 'package:comptf2/widget/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:flutter_html/flutter_html.dart';

class TeamGeneralView extends StatefulWidget {
  final Etf2lTeamShort team;
  final Etf2lHtmlBloc etf2lHtmlBloc;

  const TeamGeneralView(this.team, this.etf2lHtmlBloc);

  @override
  _TeamGeneralViewState createState() => _TeamGeneralViewState();
}

class _TeamGeneralViewState extends State<TeamGeneralView> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
                child: Center(
                    child: Column(children: [
              Hero(
                  tag: "team_${widget.team.id}_image",
                  child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "http://etf2l.org/wp-content/uploads/avatars/${widget.team.steam.avatar}"))))),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(widget.team.name,
                  style: Theme.of(context).textTheme.subtitle),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text("Players in roster: 12",
                  style: Theme.of(context).textTheme.body1),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              StreamBuilder(
                  stream: widget.etf2lHtmlBloc.teamsPageSubject,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      var elements = parser
                          .parse(snapshot.data.toString())
                          .getElementsByClassName("fix");
                      return Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245)),
                          padding: EdgeInsets.all(5),
                          child: Html(data: elements[0].innerHtml));
                    } else {
                      return SizedBox(
                          width: 40, height: 40, child: ProgressBar());
                    }
                  })
            ])))));
  }
}
