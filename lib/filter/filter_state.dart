
import 'package:bloc_login/filter_button.dart';
import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';


abstract class FilterState extends Equatable{
  FilterState();
  @override
  List<Object> get props => [];

}

class FilterLoading extends FilterState{}
class FilterLoaded extends FilterState{
  final List<Todo> filter;
  final Filter activeFilter;
  FilterLoaded(this.filter, this.activeFilter);

  @override
  List<Object> get props => [filter, activeFilter];
}
