import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_login/tab_event.dart';

enum AppTab {todos, stats}
class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.todos);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
