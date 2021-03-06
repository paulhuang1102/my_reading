import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:mighty_book/routes/app_pages.dart';

const double minHeight = 100;
const double iconStartSize = 50;
const double iconEndSize = 80;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

final List<Event> events = [
  Event(
      icon: Icons.add_circle,
      title: 'Add new book',
      onPressed: () {
        Get.toNamed(ROUTES.addBook);
      }),
  Event(
    icon: Icons.settings,
    title: 'Stettings',
    onPressed: () {}
  ),
  // Event('rodion-kutsaev.jpeg', 'Dawan District Guangdong Hong Kong', '4.28-31'),
];

class Event {
  final IconData icon;
  final String? title;
  final Function()? onPressed;
  Event({required this.icon, this.title, this.onPressed});
}

class ExhibitionBottomSheet extends StatefulWidget {
  const ExhibitionBottomSheet({Key? key}) : super(key: key);

  @override
  State<ExhibitionBottomSheet> createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get maxHeight => Get.height;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value) ?? 0;
  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double get headerFontSize => lerp(14, 24);

  double get itemBorderRadius => lerp(8, 24);

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(0, iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin;

  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  double get iconLeftBorderRadius => itemBorderRadius;

  double get iconRightBorderRadius => lerp(8, 0);

  Widget _buildIcon(Event event) {
    int index = events.indexOf(event);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(iconLeftBorderRadius),
          right: Radius.circular(iconRightBorderRadius),
        ),
        child: IconButton(
          iconSize: iconSize * 0.9,
          icon: Icon(event.icon, color: Theme.of(context).primaryColor),
          onPressed: event.onPressed,
        ),
      ),
    );
  }

  Widget _buildFullItem(Event event) {
    int index = events.indexOf(event);
    return ExpandedEventItem(
      topMargin: iconTopMargin(index),
      leftMargin: iconLeftMargin(index),
      height: iconSize,
      isVisible: _controller.status == AnimationStatus.completed,
      borderRadius: itemBorderRadius,
      title: event.title ?? '',
      onTap: event.onPressed,
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture

    if (flingVelocity < 0.0) {
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            onTap: _toggle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: <Widget>[
                  for (Event event in events) _buildFullItem(event),
                  for (Event event in events) _buildIcon(event),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExpandedEventItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;
  final Function()? onTap;
  // final String date;

  const ExpandedEventItem({
    Key? key,
    required this.topMargin,
    required this.height,
    required this.isVisible,
    required this.borderRadius,
    required this.title,
    // required this.date,
    required this.leftMargin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: height).add(const EdgeInsets.all(8)),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key? key, @required required this.fontSize, required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        '',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
