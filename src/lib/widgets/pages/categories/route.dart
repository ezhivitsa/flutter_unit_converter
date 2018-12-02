import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/models/distance_category.dart';
import 'package:flutter_unit_converter/models/weight_category.dart';
import 'package:flutter_unit_converter/models/time_category.dart';

import 'package:flutter_unit_converter/widgets/ui/layout.dart';
import './category_item.dart';

class CategoryRoute extends StatelessWidget {
  Widget orientationList(Orientation orientation, {List<Widget> children}) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => children[index],
        itemCount: children.length,
      );
    } else {
      return GridView.count(
          crossAxisCount: 2, childAspectRatio: 4, children: children);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Categories',
      backgroundColor: Colors.blue[200],
      color: Colors.blue[800],
      child: OrientationBuilder(builder: (context, orientation) {
        return orientationList(
          orientation,
          children: <Widget>[
            CategoryItem(
              icon: Icons.compare_arrows,
              text: 'Distance',
              category: DistanceCategory(),
              backgroudColor: Colors.green[300],
              color: Colors.green[800],
              borderColor: Colors.green[500],
            ),
            CategoryItem(
              icon: Icons.fitness_center,
              text: 'Weight',
              category: WeightCategory(),
              backgroudColor: Colors.orange[200],
              color: Colors.orange[900],
              borderColor: Colors.orange[600],
            ),
            CategoryItem(
              icon: Icons.timer,
              text: 'Time',
              category: TimeCategory(),
              backgroudColor: Colors.yellow[200],
              borderColor: Colors.yellow[700],
              color: Colors.yellow[900],
            ),
          ],
        );
      }),
    );
  }
}
