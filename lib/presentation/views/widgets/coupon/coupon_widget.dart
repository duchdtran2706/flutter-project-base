import 'package:flutter/material.dart';

import 'coupon_clipper.dart';
import 'coupon_decoration_painter.dart';

/// Provides a coupon card widget
class CouponWidget extends StatelessWidget {
  /// Creates a vertical coupon card widget that takes two children
  /// with the properties that defines the shape of the card.
  const CouponWidget({
    Key? key,
    required this.firstChild,
    required this.secondChild,
    this.width,
    this.height = 95,
    this.borderRadius = 2,
    this.curveRadius = 8,
    this.dottedLinePosition = 84,
    this.backgroundColor,
    this.decoration,
    this.hasShadow = false,
    this.border,
    this.dottedRadius = 2,
    this.dottedSpacing = 4,
  }) : super(key: key);

  /// The small child or first.
  final Widget firstChild;

  /// The big child or second.
  final Widget secondChild;

  final double? width;

  final double height;

  /// Border radius value.
  final double borderRadius;

  /// The curve radius value, which specifies its size.
  final double curveRadius;

  final double dottedLinePosition;

  final double dottedRadius;
  final double dottedSpacing;

  /// The background color value.
  ///
  /// Ignored if `decoration` property is used.
  final Color? backgroundColor;

  /// The decoration of the entire widget
  ///
  /// Note: `boxShadow` property in the `BoxDecoration` won't do an effect,
  /// and you should use the `shadow` property of `CouponWidget` itself instead.
  final Decoration? decoration;

  /// A shadow applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponWidget(
  ///   shadow: BoxShadow(
  ///     color: Colors.black56,
  ///     blurRadius: 10,
  ///   ),
  /// )
  /// ```
  final bool hasShadow;

  /// A custom border applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponWidget(
  ///   border: BorderSide(
  ///     width: 2,
  ///     color: Colors.black,
  ///   ),
  /// )
  /// ```
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    final clipper = CouponClipper(
      borderRadius: borderRadius,
      curveRadius: curveRadius,
      dottedLinePosition: dottedLinePosition,
      dottedRadius: dottedRadius,
      dottedSpacing: dottedSpacing,
    );

    return CustomPaint(
      painter: CouponDecorationPainter(
        shadow: hasShadow
            ? const BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 12,
                offset: Offset(6, 6),
                spreadRadius: 0,
              )
            : null,
        border: border,
        clipper: clipper,
      ),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          width: width,
          height: height,
          decoration: decoration ?? BoxDecoration(color: backgroundColor),
          child: Row(
            children: [
              SizedBox(
                width: dottedLinePosition,
                height: double.maxFinite,
                child: firstChild,
              ),
              Expanded(child: secondChild),
            ],
          ),
        ),
      ),
    );
  }
}
