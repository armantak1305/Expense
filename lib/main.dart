import 'package:expense/data/local_data/dbhelper.dart';
import 'package:expense/ui_pages/theme_provider.dart';
import 'package:flutter/material.dart';


import 'ui_pages/bloc/expense_bloc.dart';
import 'ui_pages/bottomnav_provider.dart';
import 'ui_pages/splash_page.dart';
//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
void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ExpenseBloc(dBhelper: DBhelper.getInstance())),
        ChangeNotifierProvider(create: (context) => BottomNavProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<ThemeProvider>().prefGetValue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: context.watch<ThemeProvider>().getThemeValue()?ThemeMode.dark:ThemeMode.light,

      home: SplashPage(),
    );
  }
}



