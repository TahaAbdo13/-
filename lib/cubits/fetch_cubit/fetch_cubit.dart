import 'package:financeapp/constants.dart';
import 'package:financeapp/cubits/fetch_cubit/fetch_cubit_state.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class FetchCubit extends Cubit<FetchCubitState> {
  FetchCubit() : super(FetchFinanceInitialState());
  List<Financemodel> financeData = [];
  List<Financemodel> toDayFinanceData = [];
  List<Financemodel> financeByDate = [];

  double palance = 0.0;
  double todayPalance = 0.0;
  DateTime mySelectedDay = DateTime.now();
  fetchData() {
    palance = 0.0;
    financeData = Hive.box<Financemodel>(kFinanceBox).values.toList();
    toDayFinanceData = Hive.box<Financemodel>(kFinanceBox)
        .values
        .where((e) =>
            DateFormat.yMMMEd().format(DateTime.parse(e.date)) ==
            DateFormat.yMMMEd().format(DateTime.now()))
        .toList();
    for (var element in financeData) {
      palance += element.value;
    }
    for (var element in toDayFinanceData) {
      todayPalance += element.value;
    }
    emit(FetchFinanceSuccessState());
  }

  fetchDateData({required DateTime dateTime}) {
    financeByDate = Hive.box<Financemodel>(kFinanceBox)
        .values
        .where((e) =>
            DateFormat.yMMMEd().format(dateTime) ==
            DateFormat.yMMMEd().format(DateTime.parse(e.date)))
        .toList();
  }
}
