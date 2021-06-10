import 'package:flutter/material.dart';

class MoonyNavigationBar extends StatefulWidget {
  List<NavigationBarItem> items;
  Color? activeColor = Colors.black;
  Color? color = Colors.black12;

  MoonyNavigationBar(
      {required this.items, this.activeColor, this.color, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoonyNavigationBarState();
}

// ignore: unused_element
class _MoonyNavigationBarState extends State<MoonyNavigationBar> {
  GlobalKey _keyNavigationBar = GlobalKey();
  double _numPositionBase = 0,
      _numDifferenceBase = 0,
      _positionLeftIndicatorDot = 0;
  int _indexPageSelected = 0;

  late Color _color = Colors.black45, _activeColor = Colors.black;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _color = widget.color ?? Colors.black45;
    _activeColor = widget.activeColor?? Theme.of(context).primaryColor;
    final sizeNavigationBar =
        (_keyNavigationBar.currentContext!.findRenderObject() as RenderBox)
            .size;
    _numPositionBase = ((sizeNavigationBar.width / widget.items.length));
    _numDifferenceBase = (_numPositionBase - (_numPositionBase / 2) + 2);
    setState(() {
      _positionLeftIndicatorDot = _numPositionBase - _numDifferenceBase;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Material(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                key: _keyNavigationBar,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
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
                      bottom: 0),
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

class NavigationBarItem {
  final IconData icon;
  final NavigationButtonTapCallback onTap;
  const NavigationBarItem({required this.icon, required this.onTap});
}

typedef NavigationButtonTapCallback = void Function();

class NavigationButton extends StatefulWidget {
  final IconData _icon;
  final Color _colorIcon;
  final NavigationButtonTapCallback _onTapInternalButton;
  final NavigationButtonTapCallback _onTapExternalButton;

  const NavigationButton(this._icon, this._colorIcon, this._onTapInternalButton,
      this._onTapExternalButton,
      {Key? key})
      : super(key: key);

  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTapDown: (_) {
        _controller.forward();
        setState(() {
          _opacityIcon = 0.7;
        });
      },
      onTapUp: (_) {
        _controller.reverse();
        setState(() {
          _opacityIcon = 1;
        });
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() {
          _opacityIcon = 1;
        });
      },
      onTap: () {
        widget._onTapInternalButton();
        widget._onTapExternalButton();
      },
      child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedOpacity(
              opacity: _opacityIcon,
              duration: Duration(milliseconds: 200),
              child: Icon(widget._icon, color: widget._colorIcon))));
}
