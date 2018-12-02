import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/models/distance_category.dart';
import 'package:flutter_unit_converter/models/weight_category.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        color: Colors.blue[100],
        child: OrientationBuilder(builder: (context, orientation) {
          return orientationList(
            orientation,
            children: <Widget>[
              CategoryItem(
                icon: Icons.compare_arrows,
                text: 'Distance',
                category: DistanceCategory(),
                color: Colors.green,
              ),
              CategoryItem(
                icon: Icons.fitness_center,
                text: 'Weight',
                category: WeightCategory(),
                color: Colors.lightBlueAccent,
              ),
            ],
          );
        })),
    );
  }
}
