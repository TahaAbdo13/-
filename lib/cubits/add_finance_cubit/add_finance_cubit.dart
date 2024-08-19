import 'package:financeapp/constants.dart';
import 'package:financeapp/cubits/add_finance_cubit/add_finance_cubit_state.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class AddFinanceCubit extends Cubit<AddFinanceCubitState> {
  AddFinanceCubit() : super(AddFinanceInitialState());
 
  addDFinance(Financemodel finance) async {
  

    var finaceBox = Hive.box<Financemodel>(kFinanceBox);
    emit(AddFinanceLoadingState());
    try {
      await finaceBox.add(finance);
      emit(AddFinanceSuccessState());
    } catch (e) {
      emit(AddFinanceFailureState(errMessage: e.toString()));
    }
  }
}
