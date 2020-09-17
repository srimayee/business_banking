import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
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
              'Business Banking',
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

  final List<Widget> screens = [CashAccountsWidget(), AccountDetailWidget()];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    print('Device Width: $deviceWidth');
    return SafeArea(
        child: BlocProvider(
      create: (context) => RailBloc(),
      child: BlocBuilder<RailBloc, RailState>(
        builder: (_, state) {
          if (state is InitialHomeState) {
            return Scaffold(
              bottomNavigationBar: (deviceWidth < 600)
                  ? BottomNavigationBar(
                backgroundColor: Colors.grey,
                currentIndex: state.selectedIndex,
                onTap: (index) {
                  BlocProvider.of<RailBloc>(_).add(
                      SelectDestinationEvent(selectedIndex: index));
                },
                items: [
                  BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      title: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "Cash Accounts",
                          style: TextStyle(color: Colors.white),
                          key:Key('Cash Accounts'),
                        ),
                      )
                  ),
                  BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      title: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "Account Details",
                          style: TextStyle(color: Colors.white),
                          key:Key('Account Details'),
                        ),
                      )
                  ),

                ],
              )
                  : null,
              body:(deviceWidth < 600)
                  ? screens[state.selectedIndex]
                  :  Row(
                children: <Widget>[
                  LayoutBuilder(builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraint.maxHeight),
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
                            labelType: NavigationRailLabelType.all,
                            destinations: [
                              NavigationRailDestination(
                                  icon: SizedBox.shrink(),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Cash Accounts",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Cash Accounts'),
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
                                        "Account Details",
                                        style: TextStyle(color: Colors.white),
                                        key:Key('Account Details'),
                                      ),
                                    ),
                                  ),),
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
