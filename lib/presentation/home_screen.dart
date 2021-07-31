import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_event.dart';

class HomeScreen extends StatefulWidget {
  final MaterialColor color;
  final String title;
  final ValueChanged onPush;
  HomeScreen({this.color, this.title, this.onPush});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<BimaDoctorsBloc>(context)
        .add(GetBimaDoctorsListEvent(context: context));
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              widget.title ?? "",
            ),
            backgroundColor: widget.color,
          ),
          body: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                "Todays Weather..!!",
                style: TextStyle(
                  color: this.widget.color,
                ),
              ),
            ),
          )),
    );
  }
}
