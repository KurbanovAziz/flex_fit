// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flex_fit_223_b/dom/models/fitnos_model.dart';

part 'memoriality_model.g.dart';

@HiveType(typeId: 3)
class MemorialityModel {
  @HiveField(0)
  final DateTime fitnosGotovDate;
  @HiveField(1)
  final FitnosModel fitnosModel;
  MemorialityModel({
    required this.fitnosGotovDate,
    required this.fitnosModel,
  });
}
