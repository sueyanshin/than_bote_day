import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:than_bote_day/cubit/change_fontsize_cubit.dart';

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({super.key});

  @override
  State<FontSizeSlider> createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  @override
  Widget build(BuildContext context) {
    double fontSize =
        context.select((ChangeFontsizeCubit cubit) => cubit.state.fontSize);
    return Slider(
      label: '${context.read<ChangeFontsizeCubit>().state.fontSize.toInt()}',
      min: 1.0,
      divisions: 5,
      max: 20.0,
      value: fontSize,
      onChanged: (newSize) {
        context.read<ChangeFontsizeCubit>().changeFontSize(newSize);
      },
    );
  }
}
