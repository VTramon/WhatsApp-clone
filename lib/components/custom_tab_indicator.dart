import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  const CustomTabIndicator(
      {required this.indicatorThickness,
      required this.colors,
      required this.tabController})
      : super();

  final double indicatorThickness;
  final List<Color> colors;
  final TabController tabController;

  @override
  _BorderPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BorderPainter(
        this, indicatorThickness, tabController, colors, onChanged!);
  }
}

class _BorderPainter extends BoxPainter {
  _BorderPainter(
    this.decoration,
    this.indicatorThickness,
    this.tabController,
    this.colors,
    VoidCallback onChanged,
  )   : assert(decoration != null),
        assert(indicatorThickness >= 0),
        assert(tabController != null),
        super(onChanged);

  final CustomTabIndicator decoration;
  final double indicatorThickness;
  final List<Color> colors;
  final TabController tabController;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final start = Offset(
        offset.dx, configuration.size!.height - (indicatorThickness / 2));
    final end = Offset(offset.dx + configuration.size!.width,
        configuration.size!.height - (indicatorThickness / 2));
    final paint = Paint();

    paint.color = colors[tabController.index % colors.length];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = indicatorThickness;
    // paint.shader = ui.Gradient.linear(
    //   Offset(0.5, 0.5),
    //   Offset(offset.dx, offset.dy),
    //   // endOffset,
    //   [
    //     paint.color,
    //     Colors.black,
    //   ],
    // );
    canvas.drawLine(start, end, paint);
  }
}
