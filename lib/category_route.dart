import 'package:flutter/material.dart';
import './category.dart';

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
                Category(
                  icon: Icons.account_circle,
                  text: 'Account',
                ),
                Category(
                  icon: Icons.audiotrack,
                  text: 'Music',
                ),
                Category(
                  icon: Icons.access_time,
                  text: 'Time',
                ),
                Category(
                  icon: Icons.add_a_photo,
                  text: 'Photo',
                ),
                Category(
                  icon: Icons.android,
                  text: 'Android',
                ),
                Category(
                  icon: Icons.ac_unit,
                  text: 'Snow',
                ),
                Category(
                  icon: Icons.cloud_queue,
                  text: 'Cloud',
                ),
                Category(
                  icon: Icons.content_cut,
                  text: 'Cut',
                )
              ],
            );
          })),
    );
  }
}
