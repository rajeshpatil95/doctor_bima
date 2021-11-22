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
  double x = 100.0, y = 100.0, xPrev = 100.0, yPrev = 100.0;

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
      body: Stack(
        children: [
          Positioned(
            key: const Key("drag_drop_screen_button_container"),
            left: x,
            top: y,
            child: GestureDetector(
              onPanDown: (details) {
                setState(() {
                  xPrev = x - details.localPosition.dx;
                  yPrev = y - details.localPosition.dy;
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  x = xPrev + details.localPosition.dx;
                  y = yPrev + details.localPosition.dy;
                });
              },
              child: Container(
                width: 64,
                height: 64,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
