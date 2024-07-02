import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/dom/widgets/categ_data.dart';
import 'package:flex_fit_223_b/dom/widgets/plan_data.dart';
import 'package:flex_fit_223_b/dom/widgets/weak_data.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DomScreen extends StatelessWidget {
  const DomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Spartan',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: FitColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Start your day!',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: FitColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 48.h,
                      width: 48.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/hero.jpeg'),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Training plan for the day',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 350.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        //TODO future premium
                        return PlanData(
                          isNotAmazon: false,
                          fitnosModel: dayPlan[index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 16.w,
                          ),
                      itemCount: dayPlan.length),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Improve your weaknesses',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return WeakData(
                          fitnosModel: partList[index],
                          height: 160,
                          width: 200,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 16.w,
                          ),
                      itemCount: partList.length),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Recommendations',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return WeakData(
                          fitnosModel: recoPlan[index],
                          height: 180,
                          width: 280,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 16.w,
                          ),
                      itemCount: recoPlan.length),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 135.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategData(
                        fitnosModel: catePlan[index],
                        height: 135,
                        width: 171,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16.w,
                    ),
                    itemCount: (catePlan.length / 2)
                        .ceil(), // Show half the items in the first row
                  ),
                ),
                SizedBox(height: 16.h), // Space between the rows
                SizedBox(
                  height: 135.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      int newIndex = index +
                          (catePlan.length / 2)
                              .ceil(); // Offset for the second row
                      return CategData(
                        fitnosModel: catePlan[newIndex],
                        height: 135,
                        width: 171,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16.w,
                    ),
                    itemCount: (catePlan.length / 2)
                        .floor(), // Show the other half of the items in the second row
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
