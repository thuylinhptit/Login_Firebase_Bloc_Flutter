import 'package:bloc_login/filter/filter_bloc.dart';
import 'package:bloc_login/filter/filter_event.dart';
import 'package:bloc_login/filter/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Filter {all, incompleted, completed}
class FilterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyText2;
    final activeStyle = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).accentColor);
    return BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          final button = _Button(
            onSelected: (filter) {
              BlocProvider.of<FilterBloc>(context).add(UpdateFilter(filter));
            },
            activeFilter: state is FilterLoaded
                ? state.activeFilter
                : Filter.all,
            activeStyle: activeStyle,
            defaultStyle: defaultStyle,
          );
          return AnimatedOpacity(
            opacity:  1.0 ,
            duration: Duration(milliseconds: 150),
            child: button,
          );
        });
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<Filter> onSelected;
  final Filter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Filter>(
      tooltip: 'Filter Todos',
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filter>>[
        PopupMenuItem<Filter>(
          value: Filter.all,
          child: Text(
            'Show All',
            style: activeFilter == Filter.all
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<Filter>(
          value: Filter.incompleted,
          child: Text(
            'Show Active',
            style: activeFilter == Filter.incompleted
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<Filter>(
          value: Filter.completed,
          child: Text(
            'Show Completed',
            style: activeFilter == Filter.completed
                ? activeStyle
                : defaultStyle,
          ),
        ),
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}
