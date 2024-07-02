import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flex_fit_223_b/memorily/models/memoriality_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

class FitnoVypolnenieScreen extends StatefulWidget {
  const FitnoVypolnenieScreen(
      {super.key, required this.fitnos, required this.index});
  final FitnosModel fitnos;
  final int index;

  @override
  State<FitnoVypolnenieScreen> createState() => _FitnoVypolnenieScreenState();
}

class _FitnoVypolnenieScreenState extends State<FitnoVypolnenieScreen> {
  int selectedIndex = 0;

  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    _pageController.addListener(() {
      setState(() {
        selectedIndex = _pageController.page?.round() ?? 0;
      });
    });
    selectedIndex = widget.index;
    super.initState();
  }

  Timer? _timer;
  bool isDalee = false;
  int _start = 0;

  void _startTimer(int startVal) {
    _timer?.cancel();
    _start = startVal;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (_start == 0) {
          setState(() {
            isDalee = true;
            _timer?.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      });
    });
  }

  Future<void> _saveRun() async {
    final box = Hive.box<MemorialityModel>('memorialityModel');
    final run = MemorialityModel(
        fitnosModel: widget.fitnos, fitnosGotovDate: DateTime.now());

    await box.add(run);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32.r),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        widget.fitnos.fitnosExList[selectedIndex].fitnoExsImage,
                    height: 300.h,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade200,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w, top: 38.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FitMot(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              widget.fitnos.fitnosName,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: FitColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: widget.fitnos.fitnosExList.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    final item = widget.fitnos.fitnosExList[index];

                    return Column(
                      children: [
                        Text(
                          item.fitnosExName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: FitColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          item.fitnosExDesc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: FitColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: CircularProgressIndicator(
                                backgroundColor: const Color(0xFF191919),
                                color: FitColor.purple,
                                value: getValue(item.fitnosExSec,
                                    item.fitnosExSec - _start),
                              ),
                            ),
                            Text('$_start sec',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Benzin-Medium',
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        FitMot(
                          onPressed: () {
                            _startTimer(item.fitnosExSec);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.r, horizontal: 33.w),
                            decoration: BoxDecoration(
                              color: FitColor.purple,
                              borderRadius: BorderRadius.circular(57.h),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _timer?.isActive == true
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  _timer?.isActive == true ? 'Pause' : 'Start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: FitColor.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // const Spacer(),
              Row(
                children: [
                  if (selectedIndex != 0)
                    Expanded(
                      child: FitMot(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: Durations.medium2,
                              curve: Curves.linear);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFF191919),
                            borderRadius: BorderRadius.circular(57.h),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios_new,
                                color: FitColor.grey,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Text(
                                'Back',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: FitColor.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (selectedIndex != 0 &&
                      selectedIndex != widget.fitnos.fitnosExList.length)
                    SizedBox(
                      width: 16.w,
                    ),
                  Expanded(
                    child: FitMot(
                      onPressed: () {
                        if (selectedIndex ==
                            widget.fitnos.fitnosExList.length - 1) {
                          Navigator.of(context).pop();
                          return;
                        }
                        if (isDalee) {
                          _pageController.nextPage(
                              duration: Durations.medium2,
                              curve: Curves.linear);
                          setState(() {
                            isDalee = false;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: isDalee
                              ? FitColor.purple
                              : const Color(0xFF191919),
                          borderRadius: BorderRadius.circular(57.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedIndex ==
                                      widget.fitnos.fitnosExList.length - 1
                                  ? 'Finish'
                                  : 'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: isDalee ? FitColor.white : FitColor.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: isDalee ? FitColor.white : FitColor.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

double getValue(int fullTime, int currentTime) {
  return currentTime / fullTime;
}
