import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:than_bote_day/cubit/counter_cubit.dart';
import 'package:than_bote_day/cubit/dark_mode_cubit.dart';
import 'package:than_bote_day/cubit/json_cubit.dart';
import 'package:than_bote_day/cubit/toggle_cubit.dart';
import 'package:than_bote_day/screens/home_screen.dart';
import 'package:than_bote_day/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ToggleCubit(),
        ),
        BlocProvider(
          create: (context) => DarkModeCubit(),
        ),
        BlocProvider(
          create: (context) => JsonCubit(),
        ),
      ],
      child: BlocBuilder<DarkModeCubit, DarkModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: '၅မျိုးသမ္ဗု​ဒ္ဓေ',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
