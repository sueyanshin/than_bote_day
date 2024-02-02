import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:than_bote_day/model/data_model.dart';
part 'json_state.dart';

class JsonCubit extends Cubit<List<DataModel>> {
  JsonCubit() : super([]) {
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      print("called");
      String jsonString =
          await rootBundle.loadString('assets/audios/data.json');
      print("JSON loaded successfully");

      List<dynamic> jsonData = json.decode(jsonString);

      List<DataModel> pageContents = jsonData.map((item) {
        return DataModel(
            title: item['title'], content: List<String>.from(item['content']));
      }).toList();
      emit(pageContents);
    } catch (e) {
      // emit([]);
      print('error ${e}');
    }
  }
}
