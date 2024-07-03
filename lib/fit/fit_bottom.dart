import 'package:flex_fit_223_b/custom/custom_screen.dart';
import 'package:flex_fit_223_b/dom/dom_screen.dart';

import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flex_fit_223_b/memorily/memorily_screen.dart';
import 'package:flex_fit_223_b/nastro/nastro_screen.dart';
import 'package:flex_fit_223_b/stats/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FitBotmFtState extends State<FitBotmFt> {
  late int _currentIndex;
  TextEditingController _imyaController = TextEditingController();

  final List<Widget> _pages = <Widget>[
    DomScreen(),
    MemorilyScreen(),
    SizedBox(),
    StatsScreen(),
    NastroScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexScr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: FitColor.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(0, 'assets/icons/home.svg'),
            buildNavItem(1, 'assets/icons/history.svg'),
            buildNavItem(2, 'assets/icons/custom.png'),
            buildNavItem(3, 'assets/icons/progress.svg'),
            buildNavItem(4, 'assets/icons/settings.svg'),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String iconPath) {
    return InkWell(
      onTap: () {
        if (index == 2) {
          _smotretCustomBottomSheet(context);
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      child: index == 2
          ? Image.asset(
              iconPath,
              width: 40.w,
            )
          : SvgPicture.asset(
              iconPath,
              color: _currentIndex == index ? FitColor.purple : FitColor.grey,
              width: 70.w,
            ),
    );
  }

  void _smotretCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              color: FitColor.black,
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child:
                            SvgPicture.asset('assets/icons/bottom_sheet.svg')),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Name of the training program',
                      style: TextStyle(
                        color: FitColor.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: FitColor.grey383B45,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                      child: TextField(
                        controller: _imyaController,
                        maxLines: 1,
                        maxLength: 30,
                        onChanged: (t) {
                          setModalState(() {});
                        },
                        style: const TextStyle(color: FitColor.white),
                        decoration: const InputDecoration(
                          hintText: 'Example Name',
                          hintStyle: TextStyle(color: FitColor.grey),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counterText: "",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${_imyaController.text.length}/30",
                        style: const TextStyle(color: FitColor.grey),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    FitMot(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomScreen(
                                      title: _imyaController.text,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: FitColor.purple,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class FitBotmFt extends StatefulWidget {
  const FitBotmFt({super.key, this.indexScr = 0});

  final int indexScr;

  @override
  State<FitBotmFt> createState() => FitBotmFtState();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const FitBotmFt(),
    );
  }
}
