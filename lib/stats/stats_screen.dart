import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../fit/fit_color.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text(
          "Progress",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: 0.7,
                center: Column(
                  children: [
                    SizedBox(height: 50.h),
                    const Text(
                      'Tracker',
                      style: TextStyle(color: FitColor.greyTex),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '9.3',
                      style: TextStyle(fontSize: 50.sp, color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    const Text('Next Day +3%',
                        style: TextStyle(color: FitColor.greyTex)),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: FitColor.purple,
                backgroundColor: const Color(0xff191919),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(left: 16.0.h, bottom: 16.h, top: 24.h),
              child: const Text(
                'My stats',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 16.w),
                    padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 40.h),
                    decoration: BoxDecoration(
                        color: FitColor.dark,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Active ',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        Text(
                          'Streak ',
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        SizedBox(height: 24.h),
                        Text('2 days', style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 40.h),
                    decoration: BoxDecoration(
                        color: FitColor.dark,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Longest ',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        Text(
                          'Streak ',
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        SizedBox(height: 24.h),
                        Text('2 days', style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 16.w),
                    padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 40.h),
                    decoration: BoxDecoration(
                        color: FitColor.dark,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Days ',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        Text(
                          'Completed ',
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        SizedBox(height: 24.h),
                        Text('2 days', style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 40.h),
                    decoration: BoxDecoration(
                        color: FitColor.dark,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last ',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        Text(
                          'Stretch ',
                          style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        ),
                        SizedBox(height: 24.h),
                        Text('04:20', style: TextStyle(color: FitColor.grey, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
