import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_unit_converter/constants.dart';

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

class _FrontPanel extends StatelessWidget {
  final Widget child;
  final String title;

  final Function onTap;
  final Function onVerticalDragUpdate;
  final Function onVerticalDragEnd;

  _FrontPanel({
    this.child,
    this.title,
    this.onTap,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              height: 48.0,
              padding: EdgeInsetsDirectional.only(start: 16.0),
              alignment: AlignmentDirectional.centerStart,
              child: Text(this.title),
            ),
            onTap: onTap,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
          ),
          Divider(
            height: 1.0,
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}

class _Layout extends State<Layout> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final GlobalKey _layoutKey = GlobalKey(debugLabel: 'Layout');

  @override
  void didUpdateWidget(Layout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (
      oldWidget.category != null &&
      widget.category != null &&
      oldWidget.category.text != widget.category.text
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
    setState(() {
      _controller.fling(
        velocity: _backdropPanelVisible
          ? -_kFlingVelocity
          : _kFlingVelocity
      );
    });
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

  double get _backdropHeight {
    final RenderBox renderBox = _layoutKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_controller.isAnimating) return;

    _controller.value -= details.primaryDelta / _backdropHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (
      _controller.isAnimating ||
      _controller.status == AnimationStatus.completed ||
      _controller.status == AnimationStatus.dismissed
    ) {
      return;
    }

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(_kFlingVelocity, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-_kFlingVelocity, -flingVelocity));
    else
      _controller.fling(
          velocity:
          _controller.value < 0.5 ? -_kFlingVelocity : _kFlingVelocity);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    Animation<RelativeRect> panelAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, panelTop, 0.0, panelTop - panelSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Container(
      key: _layoutKey,
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          widget.backPanel,
          PositionedTransition(
            rect: panelAnimation,
            child: _FrontPanel(
              onTap: _toggleBackdropPanelVisibility,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: widget.frontPanel,
              title: widget.category.text,
            )
          )
        ],
      ),
    );
  }

  Widget _mobileLayout() {
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
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }

  Widget _tabletLayout() {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.category.category.name),
      ),
      backgroundColor: widget.backgroundColor,
      body: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: widget.backPanel,
          ),
          Flexible(
            flex: 3,
            child: widget.frontPanel,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < tabletBreakpoint;

    if (useMobileLayout) {
      return _mobileLayout();
    } else {
      return _tabletLayout();
    }
  }
}
