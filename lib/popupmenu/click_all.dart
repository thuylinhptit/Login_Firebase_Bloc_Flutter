

class ClickAll {
  const ClickAll({this.title, this.index});
  final String title;
  final int index;

}

const List <ClickAll> listClickAll = const <ClickAll>[
  const ClickAll(title: "All Done", index: 1),
  const ClickAll( title: "Delete All ", index: 2)
];
