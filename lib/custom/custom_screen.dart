import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key, });

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    int min = 0;
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
                    imageUrl: "https://i.ibb.co/jDWB6Pq/782b4c5c4fa4eb0c8595d0e85bee22a7.jpg",
                    height: 300.h,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
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
                              "Exemple name",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: FitColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
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
                                  color: Colors.black.withOpacity(0.3),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/exer.svg'),
                                      Text(
                                        '0 exercises',
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
                                  color: Colors.black.withOpacity(0.3),
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
                                  color: Colors.black.withOpacity(0.3),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/fire.svg'),
                                      Text(
                                        '0 ccal',
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
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FitMot(
                  onPressed: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: FitColor.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            imageUrl: "https://i.ibb.co/jDWB6Pq/782b4c5c4fa4eb0c8595d0e85bee22a7.jpg",
                            height: 100.h,
                            width: 100.w,
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
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Example name",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: FitColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: FitColor.purple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '• ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: FitColor.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  formatTime(100),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: FitColor.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 8.h,
              ),
              itemCount: 2),
        ),
      ),
    );
  }
}

String formatTime(int seconds) {
  if (seconds < 60) {
    return '$seconds sec';
  } else {
    int minutes = seconds ~/ 60;
    return '$minutes min';
  }
}