// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rayyan_speed_test_ui/widgets/donwload_upload_buttons_row_widget.dart';
import 'package:rayyan_speed_test_ui/widgets/download_upload_speed_meter_texts_widget.dart';
import 'package:rayyan_speed_test_ui/widgets/my_app_bar_widget.dart';
import 'package:rayyan_speed_test_ui/widgets/speed_meter_radial_gauge_widget.dart';
import 'package:rayyan_speed_test_ui/widgets/start_stop_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

double valueText = 0;
double value = 0;

class _HomeScreenState extends State<HomeScreen> {
  bool downloadButtonClickedStatus = true,
      startButtonClickedStatus = false,
      isRunning = false;
  late Timer textValueTimer, rangePointersTimer;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
              body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: backgroundContainerBoxDecoration(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const MyAppBar(),
              const SizedBox(
                height: 25,
              ),
              DownloadUploadButtonsRowWidget(
                downloadButtonClickedStatus: downloadButtonClickedStatus,
              ),
              const SizedBox(
                height: 10,
              ),
              DownloadUploadSpeedMeterTextsWidget(
                value: valueText,
              ),
              const SizedBox(
                height: 25,
              ),
              SpeedMeterRadialGaugeWidget(
                value: value,
              ),
              const SizedBox(
                height: 25,
              ),
              StarStopButtonWidget(
                startButtonClickedStatus: startButtonClickedStatus,
                onTap: () {
                  if (!isRunning) {
                    isRunning = true;
                    timerInstance();
                    return;
                  }
                  if (rangePointersTimer.isActive || textValueTimer.isActive) {
                    return;
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ))),
    );
  }

  BoxDecoration backgroundContainerBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xFF5E3899),
            Color(0xFF1F0F44),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }

  void timerInstance() {
    if (value == 0) {
      setTimer(10, () {
        if (valueText < 10) {
          valueText += 1;
        } else {
          textValueTimer.cancel();
          isRunning = false;
        }
      });
    } else {
      setTimer(0, () {
        if (valueText > 0) {
          valueText -= 1;
        } else {
          textValueTimer.cancel();
          isRunning = false;
        }
      });
    }
  }

  void setTimer(double endValue, Function() changeValueText) {
    startButtonClickedStatus = true;
    value = endValue;
    textValueTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      changeValueText();
      setState(() {});
    });
    setState(() {});
    rangePointersTimer =
        Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      startButtonClickedStatus = false;
      timer.cancel();
      setState(() {});
    });
  }
}
