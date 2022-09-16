import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StarStopButtonWidget extends StatelessWidget {
  StarStopButtonWidget({
    Key? key,
    required this.startButtonClickedStatus,
    required this.onTap,
  }) : super(key: key);

  bool startButtonClickedStatus;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: const Color(0xFF442876),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF442876),
                blurRadius: 20,
              )
            ],
            borderRadius: BorderRadius.circular(100)),
        child: Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFF442876),
              border: Border.all(color: Colors.black26, width: 2),
              borderRadius: BorderRadius.circular(100)),
          child: Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: startButtonClickedStatus
                    ? const Color(0xFF432572)
                    : const Color(0xFF523185),
                border: Border.all(color: Colors.black26, width: 2),
                borderRadius: BorderRadius.circular(100)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                    color: !startButtonClickedStatus
                        ? const Color(0xFFFFA656)
                        : const Color(0xFF1F0F44),
                    boxShadow: [
                      BoxShadow(
                        color: !startButtonClickedStatus
                            ? const Color(0xFFFFA656)
                            : const Color(0xFF1F0F44),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  !startButtonClickedStatus ? 'Start' : 'Stop',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
