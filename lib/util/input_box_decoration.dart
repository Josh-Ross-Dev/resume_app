import 'package:flutter/material.dart';

class InputBoxDecoration extends BoxDecoration {
  InputBoxDecoration(
      {required bool isFirst, required bool isLast, required bool isOnly})
      : super(
      borderRadius: BorderRadius.only(
          topLeft: isFirst || isOnly
              ? const Radius.circular(8.0)
              : Radius.zero,
          topRight: isFirst || isOnly
              ? const Radius.circular(8.0)
              : Radius.zero,
          bottomLeft:
          isLast || isOnly ? const Radius.circular(8.0) : Radius.zero,
          bottomRight: isLast || isOnly
              ? const Radius.circular(8.0)
              : Radius.zero),
      border: Border(
          top: BorderSide(
            color: Colors.grey.shade400,
          ),
          left: BorderSide(
            color: Colors.grey.shade400,
          ),
          right: BorderSide(
            color: Colors.grey.shade400,
          ),
          bottom: BorderSide(
            width: isOnly || isLast ? 1 : 0,
            color: Colors.grey.shade400,
          )));
}