import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/widgets/pages/categories/category_item.dart';

const double _kFlingVelocity = 2.0;

class _LayoutTitle extends AnimatedWidget {
  final String frontTitle;
  final String backTitle;

  _LayoutTitle({
    Key key,
    Listenable listenable,
    this.frontTitle,
    this.backTitle,
  }) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = this.listenable;
    
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      // Here, we do a custom cross fade between backTitle and frontTitle.
      // This makes a smooth animation between the two texts.
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: CurvedAnimation(
              parent: ReverseAnimation(animation),
              curve: Interval(0.5, 1.0),
            ).value,
            child: Text(backTitle),
          ),
          Opacity(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(0.5, 1.0),
            ).value,
            child: Text(frontTitle),
          ),
        ],
      ),
    );
  }
}

class Layout extends StatefulWidget {
  final Widget frontPanel;
  final Widget backPanel;

  final String frontTitle;
  final String backTitle;

  final Color backgroundColor;
  final Color color;

  final CategoryItem category;

  Layout({
    this.frontPanel,
    this.backPanel,
    this.frontTitle,
    this.backTitle = '',
    this.backgroundColor,
    this.color,
    this.category,
  });

  @override
  State<StatefulWidget> createState() {
    return _Layout();
  }
}

class _Layout extends State<Layout> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void didUpdateWidget(Layout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (
      oldWidget.category != null &&
      widget.category != null &&
      oldWidget.category != widget.category
    ) {
      setState(() {
        _controller.fling(
            velocity:
            _backdropPanelVisible ? -_kFlingVelocity : _kFlingVelocity);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    if (!_backdropPanelVisible) {
      setState(() {
        _controller.fling(
          velocity: _kFlingVelocity
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // This creates an [AnimationController] that can allows for animation for
    // the BackdropPanel. 0.00 means that the front panel is in "tab" (hidden)
    // mode, while 1.0 means that the front panel is open.
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _LayoutTitle(
          listenable: _controller.view,
          frontTitle: widget.frontTitle,
          backTitle: widget.backTitle,
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: _toggleBackdropPanelVisibility,
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _controller.view
          ),
        ),
        backgroundColor: widget.backgroundColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: widget.color,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: widget.color,
        ),
      ),
      backgroundColor: widget.backgroundColor,
      body: Container(
        child: widget.frontPanel
      ),
    );
  }
}