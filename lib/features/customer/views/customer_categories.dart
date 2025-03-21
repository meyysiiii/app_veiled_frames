import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';

class CustomerCategoriesSection extends StatefulWidget {
  const CustomerCategoriesSection({super.key});

  @override
  State<CustomerCategoriesSection> createState() =>
      _CustomerCategoriesSectionState();
}

class _CustomerCategoriesSectionState extends State<CustomerCategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        iconTheme: IconThemeData(color: AppColors.fieryRed),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Categories",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFAFAF0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
