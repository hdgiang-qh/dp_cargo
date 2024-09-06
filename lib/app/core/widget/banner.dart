import 'package:flutter/material.dart';

class ColoredCorner extends StatelessWidget {
  final Color color;
  final double size;
  final Widget child;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final VoidCallback? onTap;
  final bool visibility;

  const ColoredCorner({
    this.color = Colors.red,
    this.size = 50,
    required this.child,
    this.icon = Icons.home,
    this.iconSize = 24,
    this.iconColor = Colors.white,
    this.onTap,
    this.visibility = true,
  });

  @override
  Widget build(BuildContext context) {
    if (visibility) {
      return Stack(
        children: [
          child,
          Positioned(
            top: 0,
            right: 0,
            child: CustomPaint(
              painter: _TrianglePainter(color),
              size: Size(size, size),
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
          ),
        ],
      );
    }
    return child;
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) => false;
}
