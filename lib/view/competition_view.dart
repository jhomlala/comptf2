import 'package:comptf2/blocs/etf2l_competition_api_bloc.dart';
import 'package:comptf2/model/etf2l_competition.dart';
import 'package:comptf2/view/competition_informations_view.dart';
import 'package:comptf2/view/competition_matches_view.dart';
import 'package:comptf2/view/competition_results_view.dart';
import 'package:comptf2/view/competition_teams_view.dart';
import 'package:flutter/material.dart';

class CompetitionView extends StatefulWidget {
  CompetitionView(this.competition);

  final Etf2lCompetition competition;

  @override
  _CompetitionViewState createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  Etf2lCompetitionApiBloc _bloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _bloc = Etf2lCompetitionApiBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.competition.name),
          bottom: TabBar(controller: tabController, tabs: [
            Tab(
              text: "General",
              icon: Icon(Icons.info_outline),
            ),
            Tab(
              text: "Teams",
              icon: Icon(Icons.people),
            ),
            Tab(
              text: "Matches",
              icon: Icon(Icons.album),
            ),
            Tab(
              text: "Results",
              icon: Icon(Icons.star_border),
            )
          ])),
      body: TabBarView(controller: tabController, children: [
        CompetitionInformationsView(widget.competition),
        CompetitionTeamsView(widget.competition, _bloc),
        CompetitionMatchesView(),
        CompetitionResultsView()
      ]),
    );
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
