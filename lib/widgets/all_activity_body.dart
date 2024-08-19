import 'package:financeapp/cubits/fetch_cubit/fetch_cubit.dart';
import 'package:financeapp/cubits/fetch_cubit/fetch_cubit_state.dart';
import 'package:financeapp/models/financemodel.dart';
import 'package:financeapp/widgets/listtile_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class AllActivityBody extends StatefulWidget {
  const AllActivityBody({super.key});
  @override
  State<AllActivityBody> createState() => _AllActivityBodyState();
}

class _AllActivityBodyState extends State<AllActivityBody> {
  CalendarFormat calendarFormat = CalendarFormat.week;

  DateTime myFocusedDay = DateTime.now();

  @override
  void initState() {
    
    BlocProvider.of<FetchCubit>(context).fetchDateData(
        dateTime: BlocProvider.of<FetchCubit>(context).mySelectedDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2024),
            lastDay: DateTime.now(),
            focusedDay: myFocusedDay,
            calendarFormat: calendarFormat,
            currentDay: BlocProvider.of<FetchCubit>(context).mySelectedDay,
            onFormatChanged: (format) {
              setState(() {
                calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                BlocProvider.of<FetchCubit>(context).mySelectedDay=selectedDay; 
              
                myFocusedDay = focusedDay;
                BlocProvider.of<FetchCubit>(context).fetchDateData(
                    dateTime:
                        BlocProvider.of<FetchCubit>(context).mySelectedDay);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: BlocBuilder<FetchCubit, FetchCubitState>(
              builder: (context, state) {
            List<Financemodel> financeByDate =
                BlocProvider.of<FetchCubit>(context).financeByDate;
            return ListView.builder(
                itemCount: financeByDate.length,
                itemBuilder: (context, index) {
                  return ListTileItemBuilder(
                    financemodel: financeByDate[index],
                  );
                });
          }))
        ],
      ),
    );
  }
}
