import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';

Widget dateWidget(String date) => Row(
      children: [
        const Icon(
          Icons.calendar_month,
          color: AppColors.text,
          size: 14,
        ),
        addWidth(8),
        Text(
          date,
          style: const TextStyle(
              color: AppColors.text, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
