import 'package:flutter/material.dart';

Widget productDetails({
  required String title,
  required String description,
}) {
  return SizedBox(
    width: 500,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF313131),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            width: 224,
            child: Text(
              description,
              style: TextStyle(
                color: Color(0xFF313131),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
