abstract class AddFinanceCubitState {}

class AddFinanceInitialState extends AddFinanceCubitState {}

class AddFinanceLoadingState extends AddFinanceCubitState {}

class AddFinanceSuccessState extends AddFinanceCubitState {}

class AddFinanceFailureState extends AddFinanceCubitState {
  final String errMessage;

  AddFinanceFailureState({required this.errMessage});
}
