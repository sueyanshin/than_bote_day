import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:than_bote_day/cubit/change_fontsize_cubit.dart';
import 'package:than_bote_day/cubit/toggle_cubit.dart';
import 'package:than_bote_day/model/data_model.dart';

class PageContent extends StatelessWidget {
  final DataModel pageContent;
  const PageContent({super.key, required this.pageContent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: BlocBuilder<ChangeFontsizeCubit, ChangeFontsizeState>(
        builder: (context, fontSizeState) {
          double fontSize = fontSizeState.fontSize + 20;

          return Column(
            children: [
              Text(
                pageContent.title,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < pageContent.content.length; i++)
                BlocBuilder<ToggleCubit, ToggleState>(
                  builder: (context, toggelState) {
                    if (toggelState.isSwitched) {
                      return Opacity(
                        opacity: i.isOdd ? 0.5 : 1,
                        child: Text(
                          i.isOdd
                              ? '${pageContent.content[i]}\n '
                              : pageContent.content[i],
                          style: i.isOdd
                              ? TextStyle(
                                  fontSize: fontSize - 5,
                                )
                              : TextStyle(
                                  fontSize: fontSize,
                                ),
                        ),
                      );
                    } else if (toggelState.isSwitched == false) {
                      return i.isEven
                          ? Text(
                              pageContent.content[i],
                              style: TextStyle(
                                fontSize: fontSize,
                              ),
                            )
                          : const Text('');
                    } else {
                      return const Text('Unknown State');
                    }
                  },
                ),
              const SizedBox(
                height: 200,
              )
            ],
          );
        },
      ),
    ));
    //     }
    //   },
    // ),
  }
}
