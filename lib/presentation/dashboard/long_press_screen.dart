import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:doctor_bima/style/spacing.dart';
import 'package:flutter/material.dart';

class LongPressScreen extends StatefulWidget {
  const LongPressScreen({Key key}) : super(key: key);

  @override
  _LongPressScreenState createState() => _LongPressScreenState();
}

class _LongPressScreenState extends State<LongPressScreen> {
  final key = GlobalKey<State<BottomNavigationBar>>();
  final List<String> content = [
    "Mumbai",
    "Goa",
    "Chennai",
    "Bangalore",
    "Pune",
    "Hyderabad",
    "Ahmedabad"
  ];

  RelativeRect calcMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

  Widget listTile(int index) {
    return ListTile(
      onLongPress: () async {
        print("Show menu item..!!");
        final position = calcMenuPosition(key.currentContext);
        await showMenu(
          context: context,
          position: position,
          items: <PopupMenuItem<String>>[
            const PopupMenuItem<String>(child: Text('test1'), value: 'test1'),
            const PopupMenuItem<String>(child: Text('test2'), value: 'test2'),
          ],
        );
      },
      title: Text("${content[index]}",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.subtitle,
              color: AppColors.primary)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
              key: const Key("long_press_screen_button_arrow_back"),
              icon: Icon(Icons.arrow_back),
              color: AppColors.accent,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text("Long press"),
          backgroundColor: AppColors.primary,
        ),
        body: ListView(
          children: [
            AppSpacing.sizeBoxHt10,
            Center(
                child: Text("List of Cities",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.subtitle,
                        color: AppColors.black))),
            AppSpacing.sizeBoxHt10,
            SingleChildScrollView(
                child: Column(
              children: List.generate(
                  content?.length ?? 0,
                  (index) => Container(
                        child: listTile(index),
                      )),
            ))
          ],
        ));
  }
}
