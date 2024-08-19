import 'package:financeapp/cubits/add_finance_cubit/add_finance_cubit.dart';
import 'package:financeapp/cubits/add_finance_cubit/add_finance_cubit_state.dart';
import 'package:financeapp/cubits/fetch_cubit/fetch_cubit.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:financeapp/widgets/custom_elvatedbutton.dart';
import 'package:financeapp/widgets/details_container.dart';
import 'package:financeapp/widgets/number_container_builder.dart';
import 'package:financeapp/widgets/value_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddViewBody extends StatefulWidget {
  final bool isPlus;
  Financemodel? financemodel;
  AddViewBody({super.key, required this.isPlus, this.financemodel});
  @override
  State<AddViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddViewBody> {
  String num = "";
  String? details;
  @override
  void initState() {
    setState(() {
      if (widget.financemodel != null) {
        num = widget.financemodel!.value.toString();
        num = widget.financemodel!.value < 0
            ? (widget.financemodel!.value * -1).toString()
            : widget.financemodel!.value.toString();
        details = widget.financemodel!.detailes;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NumberContainer> buttons = [
      NumberContainer(
        text: "1",
        onTap: () {
          setState(() {
            num = "${num}1";
          });
        },
      ),
      NumberContainer(
        text: "2",
        onTap: () {
          setState(() {
            num = "${num}2";
          });
        },
      ),
      NumberContainer(
        text: "3",
        onTap: () {
          setState(() {
            num = "${num}3";
          });
        },
      ),
      NumberContainer(
        text: "4",
        onTap: () {
          setState(() {
            num = "${num}4";
          });
        },
      ),
      NumberContainer(
        text: "5",
        onTap: () {
          setState(() {
            num = "${num}5";
          });
        },
      ),
      NumberContainer(
        text: "6",
        onTap: () {
          setState(() {
            num = "${num}6";
          });
        },
      ),
      NumberContainer(
        text: "7",
        onTap: () {
          setState(() {
            num = "${num}7";
          });
        },
      ),
      NumberContainer(
        text: "8",
        onTap: () {
          setState(() {
            num = "${num}8";
          });
        },
      ),
      NumberContainer(
        text: "9",
        onTap: () {
          setState(() {
            num = "${num}9";
          });
        },
      ),
      NumberContainer(
        text: ".",
        onTap: () {
          setState(() {
            num.contains(".") ? null : num = "$num.";
          });
        },
      ),
      NumberContainer(
        text: "0",
        onTap: () {
          setState(() {
            num = "${num}0";
          });
        },
      ),
      NumberContainer(
        text: "<",
        onTap: () {
          setState(() {
            num = num.substring(0, num.length - 1);
          });
        },
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        children: [
          DetailsContainer(
            onChanged: (value) {
              details = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ValueContainer(
            num: num,
            isPlus: widget.isPlus,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.2),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return buttons[index];
            },
          )),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<AddFinanceCubit, AddFinanceCubitState>(
                  builder: (context, state) => CustomElvatedButton(
                    title: 'Done',
                    onPressed: () {
                      if (widget.financemodel == null) {
                        try {
                          Financemodel financemodel = Financemodel(
                            detailes: details ?? "",
                            value: widget.isPlus
                                ? double.parse(num)
                                : double.parse(num) * -1,
                            date: DateTime.now().toString(),
                          );
                          BlocProvider.of<AddFinanceCubit>(context)
                              .addDFinance(financemodel);
                          BlocProvider.of<FetchCubit>(context).fetchData();

                          Navigator.pop(context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("There was an error")));
                        }
                      } else {
                        widget.financemodel!.detailes = details!;
                        widget.financemodel!.value = widget.isPlus
                            ? double.parse(num)
                            : double.parse(num) < 0
                                ? double.parse(num)
                                : double.parse(num) * -1;
                        widget.financemodel!.save();
                        BlocProvider.of<FetchCubit>(context).fetchData();
                        BlocProvider.of<FetchCubit>(context).fetchDateData(dateTime: BlocProvider.of<FetchCubit>(context).mySelectedDay);


                        Navigator.pop(context);
                      }
                    },
                    color: Colors.lightGreenAccent,
                    isLoading: state is AddFinanceLoadingState ? true : false,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomElvatedButton(
                  title: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.redAccent,
                  isLoading: false,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
