import 'package:flutter/material.dart';
import 'package:rayyan_speed_test/home_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedMeterRadialGaugeWidget extends StatelessWidget {
  const SpeedMeterRadialGaugeWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: [
      RadialAxis(
        showAxisLine: false,
        ticksPosition: ElementsPosition.outside,
        labelsPosition: ElementsPosition.outside,
        radiusFactor: 0.9,
        canRotateLabels: true,
        showLastLabel: true,
        minimum: 0,
        maximum: 10,
        majorTickStyle: const MajorTickStyle(
          length: 0.0,
          color: Color(0xFFFFA656),
          lengthUnit: GaugeSizeUnit.factor,
        ),
        minorTickStyle: const MinorTickStyle(
          length: 0.0,
          color: Color(0xFFFFA656),
          lengthUnit: GaugeSizeUnit.factor,
        ),
        minorTicksPerInterval: 0,
        interval: 1,
        axisLabelStyle: const GaugeTextStyle(color: Colors.white),
        useRangeColorForAxis: false,
        pointers: [
          const RangePointer(
            value: 9,
            cornerStyle: CornerStyle.bothCurve,
            sizeUnit: GaugeSizeUnit.factor,
            gradient: SweepGradient(
                colors: <Color>[Color(0xFF3B1D66), Color(0xFF3B1D66)],
                stops: <double>[0.25, 0.75]),
            color: Color(0xFF3B1D66),
            width: 0.20,
          ),
          const RangePointer(
            value: 10,
            cornerStyle: CornerStyle.bothCurve,
            sizeUnit: GaugeSizeUnit.factor,
            gradient: SweepGradient(
                colors: <Color>[Color(0xFF523185), Color(0xFF523185)],
                stops: <double>[0.25, 0.75]),
            color: Color(0xFF523185),
            width: 0.175,
          ),
          RangePointer(
            value: value,
            cornerStyle: CornerStyle.bothCurve,
            enableAnimation: true,
            animationDuration: 2000,
            sizeUnit: GaugeSizeUnit.factor,
            gradient: const SweepGradient(colors: <Color>[
              Color.fromARGB(255, 235, 168, 109),
              Color(0xFFFFA656)
            ], stops: <double>[
              0.25,
              0.75
            ]),
            color: const Color(0xFFFFA656),
            width: 0.15,
          ),
          NeedlePointer(
            enableAnimation: true,
            animationDuration: 2000,
            value: value,
            tailStyle: const TailStyle(
                length: 0.15, width: 1, color: Color(0xFFFFA656)),
            needleEndWidth: 1,
            needleColor: const Color(0xFFFFA656),
            needleLength: 0.5,
            knobStyle: const KnobStyle(
              borderColor: Color(0xFFFFA656),
              borderWidth: 0.01,
              color: Color(0xFFFFA656),
            ),
          )
        ],
      ),
    ]);
  }
}
