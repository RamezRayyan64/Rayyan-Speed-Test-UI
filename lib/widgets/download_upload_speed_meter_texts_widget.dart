import 'package:flutter/material.dart';

class DownloadUploadSpeedMeterTextsWidget extends StatelessWidget {
  const DownloadUploadSpeedMeterTextsWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.arrow_downward_rounded,
              color: Color(0xFFFFA656),
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$value Mbps',
              style: const TextStyle(
                color: Color(0xFFFFA656),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.arrow_upward_rounded,
              color: Color(0xFFFFA656),
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$value Mbps',
              style: const TextStyle(
                color: Color(0xFFFFA656),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
