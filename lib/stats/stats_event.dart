import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

abstract class StatsEvent extends Equatable{
  StatsEvent();
  @override
  List<Object> get props => [];
}

class UpdateStats extends StatsEvent{
  final List< Todo > todos ;
  UpdateStats(this.todos);
  @override
  List<Object> get props =>[todos];
}