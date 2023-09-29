// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 0;
  int activeLevel = 1;
  bool isDone = false;
  // dynamic onTapActiveLevel(int index) {
  //   setState(() {
  //     this.activeLevel = index;
  //   });
  // }

  continueStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
        isDone = false;
      });
    } else {
      setState(() {
        isDone = true;
      });
    }
  }

  onStepTaped(int value) {
    setState(() {
      currentStep = value;
      isDone = false;
    });
  }

  onCancell() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
        isDone = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.primary,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 30,
            bottom: -30,
            top: 30,
            child: Image.asset('assets/images/fit.png'),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    color: themeData.colorScheme.onBackground,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Let\'s get \nto know you!',
                    style: themeData.textTheme.headlineLarge!.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Find the most suitable meal paln\nfor your healthly needs',
                    style: themeData.textTheme.bodySmall!.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Stepper(
                    onStepContinue: continueStep,
                    currentStep: currentStep,
                    onStepCancel: onCancell,
                    onStepTapped: onStepTaped,
                    controlsBuilder: (context, details) {
                      return Visibility(
                        visible: !isDone,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    themeData.colorScheme.onPrimary,
                                foregroundColor:
                                    themeData.colorScheme.onBackground,
                              ),
                              child: Text(
                                currentStep == 3 ? 'Done' : 'Next',
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Visibility(
                              visible: currentStep != 0,
                              child: TextButton(
                                onPressed: details.onStepCancel,
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.only(left: 22, right: 22)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: themeData.colorScheme.onPrimary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        36,
                                      ),
                                    ),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    themeData.colorScheme.onPrimary,
                                  ),
                                ),
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    steps: [
                      Step(
                        title:
                            Text(currentStep > 0 ? 'Kristin Watson' : 'Name'),
                        content: MyTextField(
                          hint: 'Kristin Watson',
                        ),
                        isActive: currentStep >= 0,
                        state: currentStep > 0
                            ? StepState.complete
                            : currentStep == 0
                                ? StepState.editing
                                : StepState.indexed,
                      ),
                      Step(
                        title: Text(currentStep > 1 ? 'Female' : 'Gender'),
                        content: MyTextField(hint: 'Female'),
                        isActive: currentStep >= 1,
                        state: currentStep > 1
                            ? StepState.complete
                            : currentStep == 1
                                ? StepState.editing
                                : StepState.indexed,
                      ),
                      Step(
                        title: Text(currentStep > 2 ? '26' : 'Age'),
                        content: MyTextField(
                          hint: '26',
                        ),
                        isActive: currentStep >= 2,
                        state: currentStep > 2
                            ? StepState.complete
                            : currentStep == 2
                                ? StepState.editing
                                : StepState.indexed,
                      ),
                      Step(
                        title: Text('Activity Level'),
                        isActive: currentStep >= 3,
                        state: isDone
                            ? StepState.complete
                            : currentStep > 3
                                ? StepState.complete
                                : currentStep == 3
                                    ? StepState.editing
                                    : StepState.indexed,
                        content: AnimatedOpacity(
                          duration: Duration(milliseconds: 250),
                          opacity: isDone ? 0 : 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: themeData.colorScheme.surface,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Activity(
                                  image: '1',
                                  title: 'Inactive',
                                  isActive: activeLevel == 1,
                                  onTap: () {
                                    setState(() {
                                      activeLevel = 1;
                                    });
                                  },
                                ),
                                Activity(
                                  image: '2',
                                  title: 'Active',
                                  isActive: activeLevel == 2,
                                  onTap: () {
                                    setState(() {
                                      activeLevel = 2;
                                    });
                                  },
                                ),
                                Activity(
                                  image: '3',
                                  title: 'Vary Active',
                                  isActive: activeLevel == 3,
                                  onTap: () {
                                    setState(() {
                                      activeLevel = 3;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).marginOnly(top: 32, right: 32, bottom: 0),
                  Center(
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: themeData.colorScheme.secondary,
                      label: Text(
                        'Show My Plans',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ).marginSymmetric(horizontal: 36),
                    ),
                  ),
                ],
              ).paddingOnly(left: 24, bottom: 24),
            ),
          )
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);
  final String image;
  final String title;
  final Function() onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isActive
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.primary.withOpacity(0.25),
              ),
              child: Image.asset(
                'assets/images/$image.png',
                width: 24,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: themeData.textTheme.bodySmall,
        )
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hint,
  }) : super(key: key);
  final String hint;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: themeData.colorScheme.onBackground.withOpacity(0.6),
        hoverColor: themeData.colorScheme.onBackground,
        focusColor: themeData.colorScheme.onBackground,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
      ),
      cursorColor: themeData.colorScheme.onBackground,
    ).marginOnly(bottom: 16);
  }
}
