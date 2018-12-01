import 'package:flutter/material.dart';

import './unit.dart';
import 'package:flutter_app/widgets/ui/input.dart';
import 'package:flutter_app/widgets/ui/select.dart';

class UnitConverterRoute extends StatelessWidget {
  final Color color;
  final Unit unit;

  UnitConverterRoute({
    this.color: Colors.white70,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      body: Container(
        color: color,
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                unit.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                'Conversion: ${unit.conversion}',
                style: Theme.of(context).textTheme.subhead,
              ),
              Input(),
              Select(
                items: <SelectItem>[
                  SelectItem(
                    label: '123',
                    value: '123',
                  ),
                  SelectItem(
                    label: '234',
                    value: '234',
                  )
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
