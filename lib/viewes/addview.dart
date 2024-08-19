import 'package:financeapp/cubits/add_finance_cubit/add_finance_cubit.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:financeapp/widgets/add_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addview extends StatelessWidget {
  final bool? isPlus;
  final Financemodel? financemodel;
  const Addview({super.key, this.isPlus, this.financemodel});
  static String id = "AddView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFinanceCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(isPlus! ? "Plus" : "minus"),
        ),
        body: AddViewBody(
          isPlus: isPlus!,
          financemodel: financemodel,
        ),
      ),
    );
  }
}
