import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisSize mainAxisSize;

  RowWidget(
      {this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.min});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: getIconWidgets(),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisSize mainAxisSize;

  ColumnWidget(
      {this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.min});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: getIconWidgets(),
    );
  }
}


List<Widget> getIconWidgets() {
  List<Widget> widgets = List<Widget>();
  widgets.add(Icon(
    Icons.access_time,
    size: 50.0,
  ));
  widgets.add(Icon(
    Icons.pie_chart,
    size: 100.0,
  ));
  widgets.add(Icon(
    Icons.email,
    size: 50.0,
  ));
  return widgets;
}
