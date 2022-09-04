import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

class Dot {
  static Widget buildDot({required Color color}) {
    return Container(
        height: 16,
        width: 16,
        margin: const EdgeInsets.only(top: 6, right: 5),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.blue.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(2, 2),
                  color: Colors.white.withOpacity(0.3)),
              BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(-2, -2),
                  color: Colors.white.withOpacity(0.3)),
              BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(2, -2),
                  color: Colors.white.withOpacity(0.3)),
              BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(-2, 2),
                  color: Colors.white.withOpacity(0.3))
            ]));
  }

  static Widget buildInfor({required Widget leading, required Widget title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [leading, const SizedBox(width: 4), Expanded(child: title)],
      ),
    );
  }
}
