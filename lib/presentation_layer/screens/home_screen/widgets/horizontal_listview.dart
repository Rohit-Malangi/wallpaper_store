import 'package:flutter/material.dart';

import '../../../../data_layer/models/categerious_model.dart';
import '../../../../data_layer/repositories/categeries.dart';

import '../../../common_widgets/categerie_tile.dart';

Widget horizontalListView() {
  List<CategeriousModel> categerious = getCategerious;
  return SizedBox(
    height: 60,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categerious.length,
      itemBuilder: (context, index) {
        return CategerieTile(
          imageUrl: categerious[index].imageUrl,
          title: categerious[index].categeriousName,
        );
      },
    ),
  );
}
