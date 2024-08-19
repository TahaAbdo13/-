import 'package:financeapp/cubits/fetch_cubit/fetch_cubit.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:financeapp/viewes/addview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListTileItemBuilder extends StatelessWidget {
  final Financemodel financemodel;
  const ListTileItemBuilder({
    super.key,
    required this.financemodel,
  });
  @override
  Widget build(BuildContext context) {
      debugPrint(
        "========= List View ==================================================");
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          financemodel.delete();
          BlocProvider.of<FetchCubit>(context).fetchData();
        } else if (direction == DismissDirection.startToEnd) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Addview(
              isPlus: financemodel.value > 0 ? true : false,
              financemodel: financemodel,
            );
          }));
        }
      },
      secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(
            right: 50,
          ),
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          )),
      background: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 50,
          ),
          color: Colors.green,
          child: const Icon(
            Icons.update,
            color: Colors.white,
          )),
      key: UniqueKey(),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          financemodel.detailes,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(DateFormat.yMMMEd().format(DateTime.parse(financemodel.date))),
        leading: CircleAvatar(
            radius: 40,
            backgroundColor:
                financemodel.value > 0 ? Colors.greenAccent : Colors.redAccent),
        trailing: Text(
          financemodel.value > 0
              ? "+${financemodel.value.toString()}"
              : financemodel.value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
