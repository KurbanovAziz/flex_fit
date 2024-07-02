import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/dom/screens/fitno_detail_screen.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class PlanData extends StatelessWidget {
  const PlanData({
    super.key,
    required this.fitnosModel,
    required this.isNotAmazon,
  });
  final FitnosModel fitnosModel;
  final bool isNotAmazon;

  @override
  Widget build(BuildContext context) {
    int min = 0;
    for (var i in fitnosModel.fitnosExList) {
      min += i.fitnosExSec;
    }
    return FitMot(
      onPressed: () {
        if (isNotAmazon) {
          //TODO nav to paywall
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FitnoDetailScreen(
              fitnos: fitnosModel,
            ),
          ),
        );
      },
      child: Container(
        height: 350.h,
        width: 330.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                imageUrl: fitnosModel.fitnosImage,
                height: 350.h,
                width: 330.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fitnosModel.fitnosName,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: FitColor.white,
                      fontFamily: 'Benzin-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          color: Colors.black.withOpacity(0.3),
                          child: Text(
                            'Daily workout body\nand spirit!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: FitColor.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 6.w, vertical: 4.h),
                              color: Colors.white.withOpacity(0.3),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/exer.svg'),
                                  Text(
                                    '${fitnosModel.fitnosExList.length} exercises',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: FitColor.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 6.w, vertical: 4.h),
                              color: Colors.white.withOpacity(0.3),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/play.svg'),
                                  Text(
                                    '${(min / 60).round()} min',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: FitColor.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 6.w, vertical: 4.h),
                              color: Colors.white.withOpacity(0.3),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/fire.svg'),
                                  Text(
                                    '${fitnosModel.fitnosCal} ccal',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: FitColor.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
