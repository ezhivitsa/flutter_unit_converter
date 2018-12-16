import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/models/distance_category.dart';
import 'package:flutter_unit_converter/models/weight_category.dart';
import 'package:flutter_unit_converter/models/time_category.dart';

import 'package:flutter_unit_converter/widgets/ui/layout.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/route.dart';
import './category_item.dart';

class CategoryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryRoute();
  }
}

class _CategoryRoute extends State<CategoryRoute> {
  CategoryItem _selectedCategory;

  @override
  void initState() {
    super.initState();

    _selectedCategory = categories()[0];
  }

  void onCategoryTap(CategoryItem category) {
    this.setState(() {
      _selectedCategory = category;
    });
  }

  Widget orientationList(Orientation orientation, {List<Widget> children}) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => children[index],
        itemCount: children.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4,
        children: children
      );
    }
  }

  List<Widget> categories() {
    return <Widget>[
      CategoryItem(
        icon: Icons.compare_arrows,
        text: 'Distance',
        category: DistanceCategory(),
        onTap: this.onCategoryTap,
      ),
      CategoryItem(
        icon: Icons.fitness_center,
        text: 'Weight',
        category: WeightCategory(),
        onTap: this.onCategoryTap,
      ),
      CategoryItem(
        icon: Icons.timer,
        text: 'Time',
        category: TimeCategory(),
        onTap: this.onCategoryTap,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      frontTitle: 'Categories',
      backTitle: 'Select a Category',
      backgroundColor: Colors.blue[200],
      color: Colors.blue[800],
      backPanel: OrientationBuilder(builder: (context, orientation) {
        return orientationList(
          orientation,
          children: categories(),
        );
      }),
      frontPanel: _selectedCategory != null
        ? UnitConverterRoute(category: _selectedCategory.category)
        : null,
      category: _selectedCategory,
    );
  }
}
