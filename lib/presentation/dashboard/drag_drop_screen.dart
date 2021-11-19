import 'package:doctor_bima/style/app_colors.dart';
import 'package:flutter/material.dart';

class DragDropScreen extends StatefulWidget {
  const DragDropScreen({Key key}) : super(key: key);

  @override
  _DragDropScreenState createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
              key: const Key("drag_drop_screen_button_arrow_back"),
              icon: Icon(Icons.arrow_back),
              color: AppColors.accent,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text("Drag & Drop"),
          backgroundColor: AppColors.primary,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Draggable(
                key: const Key("drag_drop_screen_button_number"),
                data: 5,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  color: Colors.pink,
                ),
                feedback: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  color: Colors.pink,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: DragTarget(
                      key: const Key("drag_drop_screen_button_even"),
                      builder:
                          (context, List<int> candidateData, rejectedData) {
                        print(candidateData);
                        return Center(
                            child: Text(
                          "Even",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ));
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        if (data % 2 == 0) {
                          scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Correct!")));
                        } else {
                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(content: Text("Wrong!")));
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.deepPurple,
                    child: DragTarget(
                      key: const Key("drag_drop_screen_button_odd"),
                      builder:
                          (context, List<int> candidateData, rejectedData) {
                        return Center(
                            child: Text(
                          "Odd",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ));
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        if (data % 2 != 0) {
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                              key: const Key(
                                  "drag_drop_screen_snackbar_correct"),
                              content: Text("Correct!")));
                        } else {
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                              key: const Key("drag_drop_screen_snackbar_wrong"),
                              content: Text("Wrong!")));
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
