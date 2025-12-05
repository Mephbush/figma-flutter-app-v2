import 'package:flutter/widgets.dart';

class FaIcon extends Icon {
  final BlendMode? blendMode;
  final FontWeight? fontWeight;

  const FaIcon(
    super.icon, {
    super.key,
    super.size,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.color,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
    super.applyTextScaling,
    this.blendMode,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    assert(this.textDirection != null || debugCheckHasDirectionality(context));
    final TextDirection textDirection =
        this.textDirection ?? Directionality.of(context);

    final IconThemeData iconTheme = IconTheme.of(context);

    final bool applyTextScaling =
        this.applyTextScaling ?? iconTheme.applyTextScaling ?? false;

    final double tentativeIconSize = size ?? iconTheme.size ?? kDefaultFontSize;

    final double iconSize = applyTextScaling
        ? MediaQuery.textScalerOf(context).scale(tentativeIconSize)
        : tentativeIconSize;

    final double? iconFill = fill ?? iconTheme.fill;
    final double? iconWeight = weight ?? iconTheme.weight;
    final double? iconGrade = grade ?? iconTheme.grade;
    final double? iconOpticalSize = opticalSize ?? iconTheme.opticalSize;
    final List<Shadow>? iconShadows = shadows ?? iconTheme.shadows;

    final IconData? icon = this.icon;
    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(width: iconSize, height: iconSize),
      );
    }

    final double iconOpacity = iconTheme.opacity ?? 1.0;
    Color? iconColor = color ?? iconTheme.color!;
    Paint? foreground;
    if (iconOpacity != 1.0) {
      iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    }
    if (blendMode != null) {
      foreground = Paint()
        ..blendMode = blendMode!
        ..color = iconColor;
      iconColor = null;
    }

    final TextStyle fontStyle = TextStyle(
      fontVariations: <FontVariation>[
        if (iconFill != null) FontVariation('FILL', iconFill),
        if (iconWeight != null) FontVariation('wght', iconWeight),
        if (iconGrade != null) FontVariation('GRAD', iconGrade),
        if (iconOpticalSize != null) FontVariation('opsz', iconOpticalSize),
      ],
      inherit: false,
      color: iconColor,
      fontSize: iconSize,
      fontFamily: icon.fontFamily,
      fontWeight: fontWeight,
      package: icon.fontPackage,
      fontFamilyFallback: icon.fontFamilyFallback,
      shadows: iconShadows,
      height: 1.0,
      leadingDistribution: TextLeadingDistribution.even,
      foreground: foreground,
    );

    Widget iconWidget = RichText(
      overflow: TextOverflow.visible,
      textDirection: textDirection,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: fontStyle,
      ),
    );

    if (icon.matchTextDirection) {
      switch (textDirection) {
        case TextDirection.rtl:
          iconWidget = Transform(
            transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1),
            alignment: Alignment.center,
            transformHitTests: false,
            child: iconWidget,
          );
        case TextDirection.ltr:
          break;
      }
    }

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(child: iconWidget),
    );
  }
}
