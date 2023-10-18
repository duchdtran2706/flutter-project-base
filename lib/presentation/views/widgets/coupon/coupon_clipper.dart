import 'dart:math';

import 'package:flutter/material.dart';

/// Clips a widget to the form of a coupon card shape
class CouponClipper extends CustomClipper<Path> {
  /// Paints a coupon shape around any widget.
  ///
  /// Usage:
  /// ```dart
  /// ClipPath(
  ///   clipper: CouponClipper(
  ///     // optional (defaults to TextDirection.ltr), works when
  ///     // curveAxis set to Axis.vertical
  ///     direction: Directionality.of(context),
  ///   ),
  ///   // width and height are important depending on the type
  ///   // of the text direction
  ///   child: Container(
  ///     width: 350,
  ///     height: 400,
  ///     color: Colors.purple,
  ///   ),
  /// ),
  /// ```
  const CouponClipper({
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.dottedLinePosition = 100,
    this.dottedRadius = 8,
    this.dottedSpacing = 12,
  }) : assert(
          dottedLinePosition > borderRadius,
          "'curvePosition' should be greater than the 'borderRadius'",
        );

  /// Border radius value.
  final double borderRadius;

  /// The curve radius value, which specifies its size.
  final double curveRadius;

  /// The curve position, which specifies the curve position depending
  /// on the its child's size.
  final double dottedLinePosition;

  final double dottedRadius;
  final double dottedSpacing;

  @override
  Path getClip(Size size) {
    final Radius arcRadius = Radius.circular(borderRadius);

    // border radius arc points
    final Offset bottomLeftArc = Offset(borderRadius, size.height);
    final Offset bottomRightArc =
        Offset(size.width, size.height - borderRadius);
    final Offset topRightArc = Offset(size.width - borderRadius, 0);
    final Offset topLeftArc = Offset(0, borderRadius);
    final Offset leftArc = Offset(0, size.height / 2 + curveRadius);
    final Offset rightArc = Offset(size.width, size.height / 2 - curveRadius);

    final Path borderPath = Path()
      // top left
      ..moveTo(0, borderRadius)
      // left
      ..lineTo(0, size.height / 2 - curveRadius)
      ..arcToPoint(leftArc, radius: const Radius.circular(pi))
      // bottom left
      ..lineTo(0, size.height - borderRadius)
      ..arcToPoint(bottomLeftArc, radius: arcRadius, clockwise: false)
      // bottom right
      ..lineTo(size.width - borderRadius, size.height)
      ..arcToPoint(bottomRightArc, radius: arcRadius, clockwise: false)
      // right
      ..lineTo(size.width, size.height / 2 + curveRadius)
      ..arcToPoint(rightArc, radius: const Radius.circular(pi))
      // top right
      ..lineTo(size.width, borderRadius)
      ..arcToPoint(topRightArc, radius: arcRadius, clockwise: false)
      // top left
      ..lineTo(borderRadius, 0)
      ..arcToPoint(topLeftArc, radius: arcRadius, clockwise: false);

    final dottedPath = Path()..moveTo(dottedLinePosition, 0);

    var dottedCenter = 0.0;
    while (dottedCenter < size.height) {
      dottedPath.addOval(
        Rect.fromCircle(
          center: Offset(dottedLinePosition, dottedCenter),
          radius: dottedRadius,
        ),
      );
      dottedCenter += dottedSpacing + 2 * dottedRadius;
    }

    return Path.combine(PathOperation.difference, borderPath, dottedPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
