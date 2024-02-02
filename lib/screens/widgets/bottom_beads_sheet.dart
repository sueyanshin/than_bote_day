import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:than_bote_day/cubit/counter_cubit.dart';

class BottomBeadsSheet extends StatelessWidget {
  final player = AudioPlayer();
  BottomBeadsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(2),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        if (context.read<CounterCubit>().count == 0) return;
                        resetDialog(context);
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.red,
                      )),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      if (state is CounterValue) {
                        return Text(
                          state.value.toString(),
                          style: const TextStyle(
                              fontSize: 70, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _playJustAudio();
                      context.read<CounterCubit>().increment();
                    },
                    child: IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      icon: const Icon(
                        Icons.add_box,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> resetDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'အစမှ ပြန်စိပ်မည် သေချာပါသလား?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
                Navigator.of(context).pop();
              },
              child: const Text('Yes'))
        ],
      ),
    );
  }

  Future<void> _playJustAudio() async {
    player.setAsset('../../../assets/audios/bonk.mp3');
    await player.play();
  }
}
