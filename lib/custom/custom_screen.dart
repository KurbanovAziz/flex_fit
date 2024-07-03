import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_mot.dart';
import 'package:flex_fit_223_b/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class CustomScreen extends StatefulWidget {
  final String title;
  const CustomScreen({
    super.key, required this.title,
  });

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  File? _image;
  final listFitnoss = dayPlan;
  final List<FitnosExModel> listTik = [];

  String stringImageForSaveAndroid ='';
  late int id;

  @override
  void initState() {
    super.initState();
    saveIdAlert(getIdAlert()+1);
    id = getIdAlert();
  }
  final picker = ImagePicker();



  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    setImage();
  }

  Future<String> setImage() async{
    if (_image != null) {
      final bytes = await _image!.readAsBytes();
      stringImageForSaveAndroid = base64Encode(bytes);
      return base64Encode(bytes);
    }
    return '';
  }

  @override
  void dispose(){
    super.dispose();
    talker.info('dispose');
  }


  Future<void> _showPickerDialog(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              child: const Text(
                'Take a photo',
                style: TextStyle(color: FitColor.blue),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Select from gallery',
                  style: TextStyle(color: FitColor.blue)),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel', style: TextStyle(color: FitColor.blue)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int min = 0;
    for (var i in listTik) {
      min += i.fitnosExSec;
    }
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
                GestureDetector(
                  onTap: () => _showPickerDialog(context),
                  child: _image == null
                      ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(32.r),
                        ),
                        child: Container(
                          color: FitColor.grey383B45,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 100.h),
                              const Icon(
                                Icons.add,
                                color: FitColor.purple,
                              ),
                              Text(
                                "Download the cover",
                                style: TextStyle(
                                    color: FitColor.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "It is recommended to use horizontal or\npanoramic images",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: FitColor.grey,
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                      : ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32.r),
                    ),
                    child: Image.file(
                      _image!,
                      height: 300.h,
                      width: MediaQuery
                          .sizeOf(context)
                          .width,
                      fit: BoxFit.cover,
                    ),
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
                            SizedBox(width: 12.w),
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: FitColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
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
                                        '${listTik.length} exercises',
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
                                        '${0} ccal',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My workout",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final list = listTik[index];
                      return FitMot(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: FitColor.white.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.menu,
                                      color: FitColor.greyTex),
                                  SizedBox(width: 12.w),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: CachedNetworkImage(
                                      imageUrl: list.fitnoExsImage,
                                      height: 100.h,
                                      width: 100.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey.shade500,
                                            highlightColor: Colors.grey
                                                .shade200,
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        list.fitnosExName,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: FitColor.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            list.fitnosExTag,
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
                                            formatTime(list.fitnosExSec),
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
                              GestureDetector(
                                  onTap: () {
                                    listTik.remove(list);
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.close,
                                      color: FitColor.greyTex)),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 8.h,
                        ),
                    itemCount: listTik.length),
                Text(
                  "All exercises",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: FitColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = listFitnoss.first.fitnosExList[index];
                      return FitMot(
                        onPressed: () {},
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: FitColor.white.withOpacity(0.03),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(16.r),
                                        child: CachedNetworkImage(
                                          imageUrl: item.fitnoExsImage,
                                          height: 100.h,
                                          width: 100.w,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey.shade500,
                                                highlightColor:
                                                Colors.grey.shade200,
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.fitnosExName,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: FitColor.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                item.fitnosExTag,
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
                                                formatTime(item.fitnosExSec),
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
                                  GestureDetector(
                                    onTap: () {
                                      addListData(item);
                                      // var data = GetIt.I.get<
                                      //     Box<FitnosModel>>();
                                      //
                                      // data.put('$id', FitnosModel(
                                      //     fitnosKey:'$id',
                                      //     fitnosImage: stringImageForSaveAndroid,
                                      //     fitnosCal: Random().nextInt(500).toString(),
                                      //     fitnosName: title,
                                      //     fitnosExList: listTik));
                                      // talker.info(data.values.toList());


                                      // data.put(listFitnoss.first.fitnosKey, item);
                                      setState(() {});
                                    },
                                    child: Image.asset(
                                      "assets/icons/custom.png",
                                      width: 40.w,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: 0,
                                child: Visibility(
                                  visible: checkAddList(item),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(24.r),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 8.h,
                        ),
                    itemCount: listFitnoss.first.fitnosExList.length),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addListData(FitnosExModel item) {
    if (!listTik.contains(item)) {
      listTik.add(item);
    }
  }

  bool checkAddList(FitnosExModel item) {
    return listTik.contains(item);
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
