import 'package:comptf2/blocs/etf2l_competition_api_bloc.dart';
import 'package:comptf2/model/etf2l_competition.dart';
import 'package:comptf2/model/etf2l_team_short.dart';
import 'package:comptf2/model/etf2l_teams_response.dart';
import 'package:comptf2/view/team_view.dart';
import 'package:comptf2/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class CompetitionTeamsView extends StatefulWidget {
  CompetitionTeamsView(this.competition, this.bloc);

  final Etf2lCompetition competition;
  final Etf2lCompetitionApiBloc bloc;

  @override
  _CompetitionTeamsViewState createState() => _CompetitionTeamsViewState();
}

class _CompetitionTeamsViewState extends State<CompetitionTeamsView> {
  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool loading = false;
  List<Etf2lTeamShort> teams = List();
  bool internalRefresh = false;

  @override
  void initState() {
    _getTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.teamsSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("COMPETITIONS RENDER: " + loading.toString());
            var data = snapshot.data as Etf2lTeamsResponse;
            print("Got items: " + data.teams.length.toString());
            if (!internalRefresh) {
              if (loading) {
                _removeLoadMoreItem();
                page = page + 1;
                teams.addAll(data.teams.values);
                loading = false;
                hasMore = data.teams.length == limit;
              }
            } else {
              internalRefresh = false;
            }
            return buildTeamList();
          } else {
            return Center(
                child:
                    SizedBox(width: 40.0, height: 40.0, child: ProgressBar()));
          }
        });
  }

  Widget buildTeamList() {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            _loadMore();
          }
        },
        child: ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, position) {
              var team = teams[position];
              if (team.id == "-1") {
                return Row(children: [
                  SizedBox(height: 40, width: 40, child: ProgressBar()),
                  Text("Loading data...")
                ]);
              }
              return InkWell(
                  onTap: () {
                    _showTeamView(team);
                  },
                  child: Card(
                      child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Row(children: [
                            Hero(
                                tag: "team_${team.id}_image",
                                child: new Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(
                                                "http://etf2l.org/wp-content/uploads/avatars/${team.steam.avatar}"))))),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Text(
                              team.name,
                              style: TextStyle(fontSize: 16),
                            )
                          ]))));
            }));
  }

  _loadMore() {
    if (!loading && hasMore) {
      print("Loading more");
      _addLoadMoreItem();
      _getTeams();
    }
  }

  _getTeams() {
    loading = true;
    widget.bloc.getTeams(widget.competition.id, page);
  }

  _addLoadMoreItem() {
    internalRefresh = true;
    Etf2lTeamShort loadMoreTeam = Etf2lTeamShort(id: "-1");
    setState(() {
      teams.add(loadMoreTeam);
    });
  }

  _removeLoadMoreItem() {
    var removeIndex = -1;
    for (int index = 0; index < teams.length; index++) {
      print("Id: " + teams[index].id.toString());
      if (teams[index].id == "-1") {
        removeIndex = index;
        break;
      }
    }
    if (removeIndex != -1) {
      print("Remove index: " + removeIndex.toString());
      teams.removeAt(removeIndex);
    }
  }

  void _showTeamView(Etf2lTeamShort team) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => TeamView(team)));
  }
}
