import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_state.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/navigation/routes.dart';
import 'package:doctor_bima/resources/images/images.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:doctor_bima/style/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_event.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<BimaDoctorsBloc>(context)
        .add(GetBimaDoctorsListEvent(context: context));
  }

  @override
  void didPush() {}

  @override
  void didPopNext() async {
    BlocProvider.of<BimaDoctorsBloc>(context)
        .add(GetBimaDoctorsListEvent(context: context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return true;
  }

  Widget bimaDoctorTileWidget(DoctorDetailsModel doctorsDetailsModel) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorDetailsScreen,
            arguments: doctorsDetailsModel);
      },
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: NetworkImage("${doctorsDetailsModel?.profile_pic}"),
        backgroundColor: Colors.transparent,
      ),
      title: Text("${doctorsDetailsModel?.first_name ?? ""}",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.subtitle,
              color: AppColors.primary)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${doctorsDetailsModel?.specialization?.toUpperCase() ?? ""}",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: AppFontSize.subtitle,
                  color: AppColors.primary)),
          AppSpacing.sizeBoxHt5,
          Text("${doctorsDetailsModel?.description ?? ""}",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: AppFontSize.small,
                  color: AppColors.grey)),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: AppColors.primary,
        size: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Icon(Icons.menu, color: AppColors.primary),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageAsset.launchImage,
                fit: BoxFit.contain,
                height: 40,
              ),
              Image.asset(
                ImageAsset.icLauncher,
                fit: BoxFit.contain,
                height: 40,
              ),
            ],
          ),
          backgroundColor: AppColors.white,
        ),
        body: BlocConsumer<BimaDoctorsBloc, BimaDoctorsState>(
          listenWhen: (previous, current) => true,
          listener: (BuildContext context, BimaDoctorsState state) {},
          buildWhen: (previous, current) => true,
          builder: (BuildContext context, BimaDoctorsState state) {
            if (state is GetDoctorsListInitialState ||
                state is GetDoctorsListLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              );
            } else if (state is GetDoctorsListSuccessState) {
              return SingleChildScrollView(
                  child: Column(
                children: List.generate(
                    state?.doctorsListModel?.length ?? 0,
                    (index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: bimaDoctorTileWidget(
                                state.doctorsListModel[index]),
                          ),
                        )),
              ));
            }
            return null;
          },
        ),
      ),
    );
  }
}
