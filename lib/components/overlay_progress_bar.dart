import 'package:doctor_bima/style/app_colors.dart';
import 'package:flutter/material.dart';

class OverlayProgressBar {
  OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Overlay.of(context).insert(_progressOverlayEntry));
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Stack(
            children: <Widget>[
              Container(
                color: Colors.grey.withOpacity(0.5),
              ),
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              )
            ],
          ));
}
