

import 'package:business_banking/features/navigation_rail/bloc/rail_event.dart';
import 'package:business_banking/features/navigation_rail/bloc/rail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RailBloc extends Bloc<RailEvent, RailState> {

  RailBloc({RailState initialState}) : super(InitialHomeState(selectedIndex: 0));

  @override
  Stream<RailState> mapEventToState(RailEvent event) async* {
    if(event is SelectDestinationEvent) {
      yield* _mapSelectDestinationEventToState(event);
    }
  }

  Stream<RailState> _mapSelectDestinationEventToState(SelectDestinationEvent event) async* {
    yield InitialHomeState(selectedIndex: event.selectedIndex);
  }

}