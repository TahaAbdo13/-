import 'package:financeapp/cubits/fetch_cubit/fetch_cubit.dart';
import 'package:financeapp/cubits/fetch_cubit/fetch_cubit_state.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:financeapp/widgets/customRow_homeview.dart';
import 'package:financeapp/widgets/custom_container_widget.dart';
import 'package:financeapp/widgets/listtile_item_builder.dart';
import 'package:financeapp/widgets/row_seeAll_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomHomeViewBody extends StatelessWidget {
  const CustomHomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<FetchCubit, FetchCubitState>(
        builder: (context, state) {
          List<Financemodel> toDayFinanceData =
              BlocProvider.of<FetchCubit>(context)
                  .toDayFinanceData
                  .reversed
                  .toList();
          return Column(
            children: [
              CustomContainerWidget(
                color: Colors.lightBlueAccent,
                topLeft: 16,
                topRight: 16,
                bottomLeft: 0,
                totalPalance: NumberFormat.compactCurrency(
                        decimalDigits: 2, symbol: "EGP ")
                    .format(BlocProvider.of<FetchCubit>(context).palance),
                bottomRight: 0,
                title: 'my palance',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomContainerWidget(
                color: Colors.pinkAccent,
                topLeft: 0,
                topRight: 0,
                bottomLeft: 16,
                totalPalance: NumberFormat.compactCurrency(
                        decimalDigits: 2, symbol: "EGP ")
                    .format(BlocProvider.of<FetchCubit>(context).todayPalance),
                bottomRight: 16,
                title: 'Today',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomRowHomViewBody(),
              const RowSeeAllActivity(),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: toDayFinanceData.length,
                      itemBuilder: (context, i) {
                        return ListTileItemBuilder(
                          financemodel: toDayFinanceData[i],
                        );
                      }))
            ],
          );
        },
      ),
    );
  }
}
