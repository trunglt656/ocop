import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? hint, String? title, controller}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.color(redColor).fontFamily(semibold).size(16).make(),
        5.heightBox,
        TextFormField(
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(fontFamily: semibold, color: textfieldGrey),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: redColor),
            ),
          ),
        ),
        5.heightBox,
      ],
    ),
  );
}
