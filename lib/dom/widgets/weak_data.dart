import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/dom/screens/fitno_detail_screen.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class WeakData extends StatelessWidget {
  const WeakData({
    super.key,
    required this.fitnosModel,
    required this.height,
    required this.width,
  });
  final FitnosModel fitnosModel;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FitMot(
      onPressed: () {
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
        height: height.h,
        width: width.w,
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
                height: height.h,
                width: width.w,
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
              padding: EdgeInsets.all(12.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fitnosModel.fitnosName,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: FitColor.white,
                      fontFamily: 'Benzin-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
