import 'package:apphud/apphud.dart';
import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';
import 'package:flex_fit_223_b/fit/fit_bottom.dart';
import 'package:flex_fit_223_b/fit/fit_color.dart';
import 'package:flex_fit_223_b/fit/fit_docs.dart';
import 'package:flex_fit_223_b/memorily/models/memoriality_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(FitnosModelAdapter());
  Hive.registerAdapter(FitnosExModelAdapter());
  Hive.registerAdapter(MemorialityModelAdapter());

  var data = await Hive.openBox<MemorialityModel>('memorialityModel');

  GetIt.I.registerSingleton(data);

  runApp(const MyApp());
  await Apphud.start(apiKey: FitDoK.aPPpDHaaddK);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flex Fit',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: FitColor.black),
          scaffoldBackgroundColor: FitColor.black,
          fontFamily: 'Inter',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        home: FitBotmFt(
          indexScr: 0,
        ),
      ),
    );
  }
}
