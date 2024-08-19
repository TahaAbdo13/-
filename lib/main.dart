import "package:financeapp/constants.dart";
import "package:financeapp/cubits/fetch_cubit/fetch_cubit.dart";
import "package:financeapp/models/financemodel.dart";
import "package:financeapp/obseving.dart";
import "package:financeapp/viewes/addview.dart";
import "package:financeapp/viewes/all_activity.dart";
import "package:financeapp/viewes/home_view.dart";
import "package:financeapp/viewes/onboarding_view.dart";
import "package:financeapp/viewes/splash._view.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hive_flutter/adapters.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //علشان يشوف التغيرات اللي هتعملها
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]); //كدا الابلكيشن هيشتغل كويس معاك ومش هيضرب لو عدلت الشاشة بالعرض
  await Hive.initFlutter();
  Hive.openBox(darkModeBox);
  Hive.registerAdapter(FinancemodelAdapter());
  await Hive.openBox<Financemodel>(kFinanceBox);
  Bloc.observer = SimpleOpservingCupit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCubit(),
      child: ValueListenableBuilder(
          valueListenable: Hive.box(darkModeBox).listenable(),
          builder: (context, box, child) {
            var darkMode = box.get('darkMode', defaultValue: false);
            return MaterialApp(
              theme: ThemeData(fontFamily: "Poppins"),
              themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
              darkTheme: ThemeData.dark(
                  useMaterial3:
                      true), //ازم تكون متفعلة عشان البرنامج  يتعرف على انك هتغير حاجة في الثيم
              debugShowCheckedModeBanner: false,
              routes: {
                HomeView.id: (context) => const HomeView(),
                SplashView.id: (context) => const SplashView(),
                OnboardingView.id: (context) => const OnboardingView(),
                Addview.id: (context) => const Addview(),
                AllActivity.id: (context) => const AllActivity()
              },
              initialRoute: SplashView.id,
            );
          }),
    );
  }
}
