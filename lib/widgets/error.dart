import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget errorWidget(String error) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/error.svg',
          height: 150,
        ),
        addHeight(16),
        Text(
          error,
          style: const TextStyle(
              color: AppColors.text, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
