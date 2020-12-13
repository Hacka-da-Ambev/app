import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final bool isShowingMenu;

  const MenuIcon({
    Key key,
    this.isShowingMenu = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Tween<double> turnsTween = Tween<double>(
      begin: 1,
      end: 3,
    );
    return AnimatedSwitcher(
      duration: Duration(milliseconds: transitionsDuration),
      // transitionBuilder: (Widget child, Animation<double> animation) => RotationTransition(
      //   turns: turnsTween.animate(animation)),
      child: isShowingMenu ? Icon(Icons.close, size:35) : Column(
      children: [
        Row(children: [
          Icon(Icons.stop_circle, size: 15),
          SizedBox(width: 5),
          Icon(Icons.stop_circle, size: 15)
        ]),
        SizedBox(height: 5),
        Row(children: [
          Icon(Icons.stop_circle, size: 15),
          SizedBox(width: 5),
          Icon(Icons.stop_circle, size: 15)
        ]),
      ],
    ),
    );
  }
}