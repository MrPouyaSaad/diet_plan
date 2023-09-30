// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanSelectScreen extends StatelessWidget {
  const PlanSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: themeData.colorScheme.secondary,
        label: Text(
          'Proceed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ).marginSymmetric(horizontal: 48),
      ),
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.onBackground,
        foregroundColor: themeData.colorScheme.surface,
        title: Text('Select Your Plan'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Plans(
                title: 'Weekly',
                price: '\$840',
                cap: 'Meal per day \$120',
                color: themeData.colorScheme.primary,
                fColor: themeData.colorScheme.onBackground,
              ),
              Plans(
                  title: 'Monthly',
                  price: '\$3360',
                  cap: 'Meal per day \$124',
                  color: themeData.colorScheme.secondaryContainer,
                  fColor: themeData.colorScheme.onPrimary),
            ],
          ),
          SizedBox(
            height: 42,
          ),
          Text(
            'Start Date',
            style: themeData.textTheme.titleLarge!.copyWith(
              color: themeData.colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateTime.now().year.toString() +
                      '-' +
                      DateTime.now().month.toString() +
                      '-' +
                      DateTime.now().day.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Change Date',
                  style: TextStyle(
                      fontSize: 12, color: themeData.colorScheme.secondary),
                )
              ],
            ),
          ),
          SizedBox(
            height: 42,
          ),
          Text(
            'Select Diet',
            style: themeData.textTheme.titleLarge!.copyWith(
              color: themeData.colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Diet(isActive: false, title: 'Paleo diet'),
              Diet(isActive: true, title: 'Vegan Diet'),
              Diet(isActive: false, title: 'Regular Diet'),
            ],
          ),
          SizedBox(
            height: 42,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: themeData.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What We Deliver',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeData.colorScheme.surface,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Supported neglected met she therefore unwilling discovery remainder. Way sentiments two indulgence uncommonly own. Diminution to frequently sentiments he connection continuing indulgence. An my exquisite conveying up defective',
                  style: TextStyle(
                    color: themeData.colorScheme.surface,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ).paddingOnly(left: 24, right: 24, top: 32),
    );
  }
}

class Diet extends StatelessWidget {
  const Diet({
    Key? key,
    required this.isActive,
    required this.title,
  }) : super(key: key);
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 24,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: isActive
            ? themeData.colorScheme.primary
            : themeData.colorScheme.onBackground,
        border: Border.all(
          width: 2,
          color: themeData.colorScheme.primary,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: isActive
              ? themeData.colorScheme.onBackground
              : themeData.colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

class Plans extends StatelessWidget {
  const Plans({
    Key? key,
    required this.title,
    required this.price,
    required this.cap,
    required this.color,
    required this.fColor,
  }) : super(key: key);
  final String title;
  final String price;
  final String cap;
  final Color color;
  final Color fColor;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: MediaQuery.of(context).size.width / 2 - 36,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: fColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 68,
          ),
          Text(
            price,
            style: themeData.textTheme.headlineLarge!.copyWith(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              color: fColor,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            cap,
            style: themeData.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: fColor,
            ),
          ),
        ],
      ),
    );
  }
}
