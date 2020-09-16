import 'package:business_banking/features/navigation_rail/bloc/rail_bloc.dart';
import 'package:business_banking/features/navigation_rail/bloc/rail_event.dart';
import 'package:business_banking/features/navigation_rail/bloc/rail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationRailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationRailView(),
    );
  }
}

class NavigationRailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              'Navigation Rail View',
              key: Key('Toolbar Text'),
            )),
        body: BlocProvider(
          create: (BuildContext context) => RailBloc(),
          child: NavigationRailBloc(),
        ),
      ),
    );
  }
}

class NavigationRailBloc extends StatelessWidget {
  final List<Widget> screens = [Button1(), Button2(), Button3(), Button4()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => RailBloc(),
      child: BlocBuilder<RailBloc, RailState>(
        builder: (_, state) {
          if (state is InitialHomeState) {
            return Scaffold(
              body: Row(
                children: <Widget>[
                  LayoutBuilder(builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            backgroundColor: Colors.grey,
                            selectedIndex: state.selectedIndex,
                            selectedLabelTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.0,
                                decoration: TextDecoration.underline),
                            unselectedLabelTextStyle:
                                TextStyle(color: Colors.white),
                            onDestinationSelected: (int index) {
                              BlocProvider.of<RailBloc>(_).add(
                                  SelectDestinationEvent(selectedIndex: index));
                            },
                            groupAlignment: 1.0,
                            labelType: NavigationRailLabelType.all,
                            leading: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/f1.jpg'),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                            destinations: [
                              NavigationRailDestination(
                                  icon: SizedBox.shrink(),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Button1",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Button1'),
                                      ),
                                    ),
                                  )),
                              NavigationRailDestination(
                                  icon: SizedBox.shrink(),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Button2",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Button2'),
                                      ),
                                    ),
                                  )),
                              NavigationRailDestination(
                                  icon: SizedBox.shrink(),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Button3",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Button3'),
                                      ),
                                    ),
                                  )),
                              NavigationRailDestination(
                                  icon: SizedBox.shrink(),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Button4",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Button4'),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  VerticalDivider(
                    thickness: 1,
                    width: 1,
                    color: Colors.deepOrange,
                  ),
                  Expanded(child: screens[state.selectedIndex]),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    ));
  }
}

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            "Button1",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/f1.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/f2.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/f3.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/f6.jpg')),
        ],
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            "Button2",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n1.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n2.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n3.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n4.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n5.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n6.jpg')),
          Divider(color: Colors.transparent, height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/n8.jpg')),
        ],
      ),
    );
  }
}

class Button3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28),
      child: Center(
        child: Text(
          "Hello world Button3",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

class Button4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28),
      child: Center(
        child: Text(
          "Hello world Button4",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
