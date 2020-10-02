import 'package:equatable/equatable.dart';

abstract class StatsState extends Equatable{
  const StatsState();
@override
  List<Object> get props =>[];
}

class StatsLoading extends StatsState{}
class StatsLoaded extends StatsState{
  final int numberIncompleted;
  final int numberCompleted;

  StatsLoaded(this.numberIncompleted, this.numberCompleted);

  @override
  List<Object> get props =>[numberCompleted, numberIncompleted];
}