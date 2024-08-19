import 'package:hive/hive.dart';
part 'financemodel.g.dart';

@HiveType(typeId: 0)
class Financemodel extends HiveObject {
  @HiveField(0)
   String detailes;
  @HiveField(1)
   double value;
  @HiveField(2)
  final String date;
 
  Financemodel( 
      {required this.detailes, required this.value, required this.date});
}
