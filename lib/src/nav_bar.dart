import 'package:flutter/material.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';
import 'package:moony_nav_bar/src/nav_bar_item.dart';
import 'package:moony_nav_bar/src/nav_button.dart';

class MoonyNavigationBar extends StatefulWidget {
  final List<NavigationBarItem> items;
  final Color? activeColor;
  final Color? color;
  final IndicatorPosition? indicatorPosition;
  final IndicatorType? indicatorType;

  MoonyNavigationBar(
      {required this.items,
      this.activeColor,
      this.color,
      this.indicatorPosition,
      this.indicatorType,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoonyNavigationBarState();
}

class _MoonyNavigationBarState extends State<MoonyNavigationBar> {
  GlobalKey _keyNavigationBar = GlobalKey();
  double _numPositionBase = 0,
      _numDifferenceBase = 0,
      _positionLeftIndicatorDot = 0,
      _positionBottomIndicatorDot = 0;
  int _indexPageSelected = 0;

  Color _color = Colors.black45, _activeColor = Colors.black;

  IndicatorPosition _indicatorPosition = IndicatorPosition.BOTTOM;
  IndicatorType _indicatorType = IndicatorType.POINT;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    //get Color
    _color = widget.color ?? Colors.black45;
    _activeColor = widget.activeColor ?? Theme.of(context).primaryColor;
    //get type
    _indicatorPosition = widget.indicatorPosition ?? _indicatorPosition;
    _indicatorType = widget.indicatorType ?? _indicatorType;

    //size calculation
    final sizeNavigationBar =
        (_keyNavigationBar.currentContext!.findRenderObject() as RenderBox)
            .size;

    _numPositionBase = ((sizeNavigationBar.width / widget.items.length));
    _numDifferenceBase = (_numPositionBase - (_numPositionBase / 2) + 2);

    // indicator position
    _positionBottomIndicatorDot = _indicatorPosition == IndicatorPosition.BOTTOM
        ? 0
        : sizeNavigationBar.height - 6;

    setState(() {
      _positionLeftIndicatorDot = _numPositionBase - _numDifferenceBase;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Material(
            elevation: 5,
            child: Container(
              child: Stack(
                key: _keyNavigationBar,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12, top: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _createNavigationIconButtonList(
                            widget.items.asMap())),
                  ),
                  AnimatedPositioned(
                      child: CircleAvatar(
                          radius: 2.5, backgroundColor: _activeColor),
                      duration: Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                      left: _positionLeftIndicatorDot,
                      bottom: _positionBottomIndicatorDot),
                ],
              ),
            )),
      );

  List<NavigationButton> _createNavigationIconButtonList(
      Map<int, NavigationBarItem> mapItem) {
    List<NavigationButton> children = [];

    mapItem.forEach((index, item) => children.add(NavigationButton(
          item.icon,
          (index == _indexPageSelected) ? _activeColor : _color,
          item.onTap,
          () {
            _changeOptionBottomBar(index);
          },
          key: null,
        )));
    return children;
  }

  void _changeOptionBottomBar(int indexPageSelected) {
    if (indexPageSelected != _indexPageSelected) {
      setState(() {
        _positionLeftIndicatorDot =
            (_numPositionBase * (indexPageSelected + 1)) - _numDifferenceBase;
      });
      _indexPageSelected = indexPageSelected;
    }
  }
}
