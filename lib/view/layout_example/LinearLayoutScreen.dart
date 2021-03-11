import 'package:flutter/material.dart';
import 'package:flutter_app_number2/view/layout_example/LinearAttributeControllerWidget.dart';
import 'package:flutter_app_number2/view/layout_example/RowWidget.dart';

class LinearLayoutScreen extends StatefulWidget {
  @override
  _LinearLayoutScreenState createState() => _LinearLayoutScreenState(true,
      MainAxisAlignment.start, CrossAxisAlignment.start, MainAxisSize.min);
}

class _LinearLayoutScreenState extends State<LinearLayoutScreen> {
  Widget _rowColumnWidget = RowWidget();
  bool isRow;
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisSize mainAxisSize;

  _LinearLayoutScreenState(this.isRow, this.mainAxisAlignment,
      this.crossAxisAlignment, this.mainAxisSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear layout example"),
        bottom: PreferredSize(
            child: LinearAttributeControllerWidget(
                isRow, mainAxisAlignment, crossAxisAlignment, mainAxisSize,
                attributeSelection: (_isRow, _mainAxisAlignment, _mainAxisSize,
                    _crossAxisAlignment) {
              setState(() {
                if (_isRow) {
                  _rowColumnWidget = RowWidget(
                    mainAxisAlignment: _mainAxisAlignment,
                    mainAxisSize: _mainAxisSize,
                    crossAxisAlignment: _crossAxisAlignment,
                  );
                } else {
                  _rowColumnWidget = ColumnWidget(
                    mainAxisAlignment: _mainAxisAlignment,
                    mainAxisSize: _mainAxisSize,
                    crossAxisAlignment: _crossAxisAlignment,
                  );
                }
                isRow = _isRow;
                mainAxisSize = _mainAxisSize;
                mainAxisAlignment = _mainAxisAlignment;
                crossAxisAlignment = _crossAxisAlignment;
              });
            }),
            preferredSize: Size(0.0, 350.0)),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: _rowColumnWidget,
      ),
    );
  }
}
