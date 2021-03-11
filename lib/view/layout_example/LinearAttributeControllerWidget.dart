import 'package:flutter/material.dart';

class LinearAttributeControllerWidget extends StatelessWidget {
  AttributeSelection attributeSelection;
  bool _isRow;
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  MainAxisSize _mainAxisSize;

  LinearAttributeControllerWidget(this._isRow, this._mainAxisAlignment,
      this._crossAxisAlignment, this._mainAxisSize,
      {this.attributeSelection});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Orientation"),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            _isRow = true;
                            updateAttributes();
                          },
                          child: Text(
                            "Row",
                            style: TextStyle(
                                color: _isRow ? Colors.white : Colors.black),
                          )),
                      FlatButton(
                          onPressed: () {
                            _isRow = false;
                            updateAttributes();
                          },
                          child: Text(
                            "Column",
                            style: TextStyle(
                                color: _isRow ? Colors.black : Colors.white),
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Wrap/Match"),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            _mainAxisSize = MainAxisSize.min;
                            updateAttributes();
                          },
                          child: Text(
                            "Min",
                            style: TextStyle(
                              color: _mainAxisSize == MainAxisSize.min
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )),
                      FlatButton(
                          onPressed: () {
                            _mainAxisSize = MainAxisSize.max;
                            updateAttributes();
                          },
                          child: Text("Max",
                              style: TextStyle(
                                color: _mainAxisSize == MainAxisSize.max
                                    ? Colors.white
                                    : Colors.black,
                              ))),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Gravity on Main Axis"),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.start;
                        updateAttributes();
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                            color: _mainAxisAlignment == MainAxisAlignment.start
                                ? Colors.white
                                : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.center;
                        updateAttributes();
                      },
                      child: Text(
                        "Center",
                        style: TextStyle(
                            color:
                                _mainAxisAlignment == MainAxisAlignment.center
                                    ? Colors.white
                                    : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.end;
                        updateAttributes();
                      },
                      child: Text(
                        "End",
                        style: TextStyle(
                            color: _mainAxisAlignment == MainAxisAlignment.end
                                ? Colors.white
                                : Colors.black),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Main Axis Aligment (Chains)"),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.spaceAround;
                        updateAttributes();
                      },
                      child: Text(
                        "Around",
                        style: TextStyle(
                            color: _mainAxisAlignment ==
                                    MainAxisAlignment.spaceAround
                                ? Colors.white
                                : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                        updateAttributes();
                      },
                      child: Text(
                        "Evenly",
                        style: TextStyle(
                            color: _mainAxisAlignment ==
                                    MainAxisAlignment.spaceEvenly
                                ? Colors.white
                                : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _mainAxisAlignment = MainAxisAlignment.spaceBetween;
                        updateAttributes();
                      },
                      child: Text(
                        "Between",
                        style: TextStyle(
                            color: _mainAxisAlignment ==
                                    MainAxisAlignment.spaceBetween
                                ? Colors.white
                                : Colors.black),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Gravity on Cross Axis"),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _crossAxisAlignment = CrossAxisAlignment.start;
                        updateAttributes();
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                            color:
                                _crossAxisAlignment == CrossAxisAlignment.start
                                    ? Colors.white
                                    : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _crossAxisAlignment = CrossAxisAlignment.center;
                        updateAttributes();
                      },
                      child: Text(
                        "Center",
                        style: TextStyle(
                            color:
                                _crossAxisAlignment == CrossAxisAlignment.center
                                    ? Colors.white
                                    : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _crossAxisAlignment = CrossAxisAlignment.end;
                        updateAttributes();
                      },
                      child: Text(
                        "End",
                        style: TextStyle(
                            color: _crossAxisAlignment == CrossAxisAlignment.end
                                ? Colors.white
                                : Colors.black),
                      )),
                  FlatButton(
                      onPressed: () {
                        _crossAxisAlignment = CrossAxisAlignment.stretch;
                        updateAttributes();
                      },
                      child: Text(
                        "Stretch",
                        style: TextStyle(
                            color: _crossAxisAlignment ==
                                    CrossAxisAlignment.stretch
                                ? Colors.white
                                : Colors.black),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
          SizedBox(
            width: 8.0,
            height: 8.0,
          )
        ],
      ),
    );
  }

  void updateAttributes() {
    attributeSelection(
        _isRow, _mainAxisAlignment, _mainAxisSize, _crossAxisAlignment);
  }
}

typedef void AttributeSelection(bool isRow, MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize, CrossAxisAlignment crossAxisAlignment);
