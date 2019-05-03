import 'package:comptf2/view/competitions_view.dart';
import 'package:comptf2/view/players_view.dart';
import 'package:comptf2/view/teams_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("COMP TF2")),
      body: _setupBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          bottomNavigationTapped(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("Competitions")),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("Players")),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("Teams"))
        ],
        currentIndex: _currentIndex,
      ),
      //body:FractionallySizedBox(widthFactor: 0.5, child: Image.asset("assets/product.jpg")) ,
    );
  }

  PageView _setupBodyWidget() {
    return PageView(
      controller: _pageController,
      onPageChanged: pageChanged,
      children: [CompetitionsView(), PlayersView(), TeamsView()],
    );
  }

  List<Widget> getBodyWidgets() {
    List<Widget> widgetsList = List();
    //var box = FractionallySizedBox(widthFactor: 0.5, heightFactor: 0.5, child: Image.asset("assets/product.jpg"));

    //widgetsList.add(box);

    return widgetsList;
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void bottomNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
