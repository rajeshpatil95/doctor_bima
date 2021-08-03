import 'package:flutter/material.dart';

class StateContainer extends StatefulWidget {
  final Widget child;

  StateContainer({@required this.child});

  static StateContainerState of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>())
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  bool shouldTxnScreenReload = false;

  void appUpdateRoute(bool value) {
    setState(() {
      shouldTxnScreenReload = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
