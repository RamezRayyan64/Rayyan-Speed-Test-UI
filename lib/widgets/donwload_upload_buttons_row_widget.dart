import 'package:flutter/material.dart';
import 'package:rayyan_speed_test/widgets/my_text_button_widget.dart';

// ignore: must_be_immutable
class DownloadUploadButtonsRowWidget extends StatefulWidget {
  DownloadUploadButtonsRowWidget({
    Key? key,
    required this.downloadButtonClickedStatus,
  }) : super(key: key);

  bool downloadButtonClickedStatus;

  @override
  State<DownloadUploadButtonsRowWidget> createState() =>
      _DownloadUploadButtonsRowWidgetState();
}

class _DownloadUploadButtonsRowWidgetState
    extends State<DownloadUploadButtonsRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF3B1D66),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: MyTextButtonWidget(
              text: 'Download',
              clickedStatus: widget.downloadButtonClickedStatus,
              onPressedButton: () {
                setState(() {
                  widget.downloadButtonClickedStatus = true;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MyTextButtonWidget(
              text: 'Upload',
              clickedStatus: !widget.downloadButtonClickedStatus,
              onPressedButton: () {
                setState(() {
                  widget.downloadButtonClickedStatus = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
