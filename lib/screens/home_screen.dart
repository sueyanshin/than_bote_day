import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:than_bote_day/cubit/dark_mode_cubit.dart';
import 'package:than_bote_day/cubit/json_cubit.dart';
import 'package:than_bote_day/cubit/toggle_cubit.dart';
import 'package:than_bote_day/model/data_model.dart';
import 'package:than_bote_day/screens/widgets/bottom_beads_sheet.dart';
import 'package:than_bote_day/screens/widgets/page_content.dart';

import 'widgets/fontsize_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();

  // double fontSize = 1;
  @override
  Widget build(BuildContext context) {
    context.read<JsonCubit>().loadJsonData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('၅မျိုးသမ္ဗု​ဒ္ဓေ'),
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text(
                      'စာလုံးအရွယ်အစားပြောင်းလဲမည်',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    actions: [FontSizeSlider()],
                  ),
                );
              },
              icon: const Icon(Icons.text_fields_outlined)),
          // Switch Button
          BlocBuilder<ToggleCubit, ToggleState>(
            builder: (context, state) {
              return Switch(
                  value: state.isSwitched,
                  onChanged: (_) {
                    context.read<ToggleCubit>().toggleSwitch();
                  });
            },
          ),
          BlocBuilder<DarkModeCubit, DarkModeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<DarkModeCubit>().toggleDarkMode();
                  },
                  icon: state.isDarkMode == false
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode));
            },
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          BlocBuilder<JsonCubit, List<DataModel>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return const Center(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else {
                return PageView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return PageContent(
                      pageContent: state[index],
                    );
                  },
                );
              }
            },
          ),
          BottomBeadsSheet()
        ],
      ),
    );
  }
}
