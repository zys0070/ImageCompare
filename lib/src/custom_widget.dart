import 'package:image_compare/src/rect_clipper.dart';
import 'package:flutter/material.dart';

class ImageCompare extends StatefulWidget {
  final Widget beforeImage;
  final Widget afterImage;
  final double? imageHeight;
  final double? imageWidth;
  final double imageCornerRadius;
  final Color thumbColor;
  final double thumbRadius;
  final Color? overlayColor;
  final bool isVertical;
  final double clipFactor;
  final Function(double)? onChanged;
  final double thumbWidth;

  const ImageCompare({
    Key? key,
    required this.beforeImage,
    required this.afterImage,
    this.imageHeight,
    this.imageWidth,
    this.imageCornerRadius = 8.0,
    this.thumbColor = Colors.white,
    this.thumbRadius = 8.0,
    this.overlayColor,
    this.isVertical = false,
    this.clipFactor = 0.5,
    this.onChanged,
    this.thumbWidth = 2.0,
  }) : super(key: key);

  @override
  _ImageCompareState createState() => _ImageCompareState();
}

class _ImageCompareState extends State<ImageCompare> {
  double _clipFactor = 0.0;

  @override
  void initState() {
    super.initState();
    _clipFactor = widget.clipFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: widget.isVertical
              ? EdgeInsets.symmetric(vertical: widget.thumbWidth)
              : EdgeInsets.symmetric(horizontal: widget.thumbWidth),
          child: SizedImage(
            widget.afterImage,
            widget.imageHeight,
            widget.imageWidth,
            widget.imageCornerRadius,
          ),
        ),
        Padding(
          padding: widget.isVertical
              ? EdgeInsets.symmetric(vertical: widget.thumbWidth)
              : EdgeInsets.symmetric(horizontal: widget.thumbWidth),
          child: ClipPath(
            clipper: widget.isVertical
                ? RectClipperVertical(_clipFactor)
                : RectClipper(_clipFactor),
            child: SizedImage(
              widget.beforeImage,
              widget.imageHeight,
              widget.imageWidth,
              widget.imageCornerRadius,
            ),
          ),
        ),
        Positioned.fill(
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 0.0,
              overlayShape: SliderComponentShape.noThumb,
              overlayColor: widget.overlayColor,
              thumbShape: CustomThumbShape(
                  widget.thumbRadius, widget.thumbColor, widget.thumbWidth),
            ),
            child: widget.isVertical
                ? RotatedBox(
                    quarterTurns: 1,
                    child: Slider(
                      value: _clipFactor,
                      onChanged: (double factor) {
                        setState(() => this._clipFactor = factor);
                        if (widget.onChanged != null) {
                          widget.onChanged!(factor);
                        }
                      },
                    ),
                  )
                : Slider(
                    value: _clipFactor,
                    onChanged: (double factor) {
                      setState(() => this._clipFactor = factor);
                      if (widget.onChanged != null) {
                        widget.onChanged!(factor);
                      }
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

class SizedImage extends StatelessWidget {
  final Widget _image;
  final double? _height, _width, _imageCornerRadius;

  const SizedImage(
      this._image, this._height, this._width, this._imageCornerRadius,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_imageCornerRadius!),
      child: SizedBox(
        height: _height,
        width: _width,
        child: _image,
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double _thumbRadius;
  final Color _thumbColor;
  final double _thumbStrokeWidth;

  CustomThumbShape(this._thumbRadius, this._thumbColor, this._thumbStrokeWidth);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double>? activationAnimation,
      Animation<double>? enableAnimation,
      bool? isDiscrete,
      TextPainter? labelPainter,
      required RenderBox parentBox,
      SliderThemeData? sliderTheme,
      TextDirection? textDirection,
      double? value,
      double? textScaleFactor,
      Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = _thumbStrokeWidth
      ..color = _thumbColor
      ..style = PaintingStyle.fill;

    final Paint paintStroke = Paint()
      ..isAntiAlias = true
      ..strokeWidth = _thumbStrokeWidth
      ..color = _thumbColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      _thumbRadius,
      paintStroke,
    );

    canvas.drawCircle(
      center,
      _thumbRadius,
      paint,
    );

    canvas.drawRect(
        Rect.fromCenter(
            center: center,
            width: _thumbStrokeWidth,
            height: parentBox.size.height),
        paint);
  }
}
