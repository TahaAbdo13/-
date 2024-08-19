import 'package:financeapp/constants.dart';
import 'package:financeapp/cubits/fetch_cubit/fetch_cubit.dart';
import 'package:financeapp/widgets/custom_homview_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../widgets/custom_drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<FetchCubit>(context).fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, value, child) {
        var darkMode = value.get('darkMode', defaultValue: false);
        return Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Row(children: [
              Text("Wellcome,"),
              Text("Taha"),
            ]),
            actions: [
              IconButton(
                  onPressed: () {
                    value.put('darkMode', !darkMode);
                  },
                  icon: darkMode
                      ? const Icon(Icons.brightness_2)
                      : const Icon(Icons.brightness_5_rounded))
            ],
          ),
          body: const CustomHomeViewBody(),
        );
      },
    );
  }
}
