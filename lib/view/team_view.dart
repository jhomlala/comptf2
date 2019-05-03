import 'package:comptf2/blocs/etf2l_html_bloc.dart';
import 'package:comptf2/model/etf2l_team_short.dart';
import 'package:comptf2/view/team_general_view.dart';
import 'package:comptf2/view/team_matches_view.dart';
import 'package:comptf2/view/team_players_view.dart';
import 'package:comptf2/view/team_results_view.dart';
import 'package:comptf2/view/team_transfers_view.dart';
import 'package:comptf2/widget/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:flutter_html/flutter_html.dart';

class TeamView extends StatefulWidget {
  TeamView(this.team);

  Etf2lTeamShort team;

  @override
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  Etf2lHtmlBloc etf2lHtmlBloc;

  @override
  void initState() {
    super.initState();
    etf2lHtmlBloc = Etf2lHtmlBloc();
    etf2lHtmlBloc.getTeamPage(widget.team.id);
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    etf2lHtmlBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.team.name),
          bottom: TabBar(controller: tabController, tabs: [
            Tab(
              text: "General",
              icon: Icon(Icons.info_outline),
            ),
            Tab(
              text: "Players",
              icon: Icon(Icons.people),
            ),
            Tab(
              text: "Matches",
              icon: Icon(Icons.album),
            ),
            Tab(
              text: "Results",
              icon: Icon(Icons.star),
            ),
            Tab(
              text: "Trasnfers",
              icon: Icon(Icons.compare_arrows),
            )
          ])),
      body: TabBarView(controller: tabController, children: [
        TeamGeneralView(widget.team, etf2lHtmlBloc),
        TeamPlayersView(),
        TeamMatchesView(),
        TeamResultsView(),
        TeamTransfersView()
      ]),
    );
  }

}
