import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Icon? icon;
  final AppButtonOptions? options;

  AppButtonWidget({
    required this.onPressed,
    this.text,
    this.icon,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    var bOptions = (options == null) ? AppButtonOptions() : options;
    var bRadius = BorderRadius.circular(bOptions!.borderRadius ?? 0);

    return Material(
      color: bOptions.color ?? colorScheme.primary,
      elevation: bOptions.elevation ?? 0,
      borderRadius: bRadius,
      child: InkWell(
        borderRadius: bRadius,
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            // borderRadius: bRadius,
            border: Border.fromBorderSide(
              (bOptions.borderSide ??
                  BorderSide(color: Colors.transparent, width: 0)),
            ),
            borderRadius: bRadius,
          ),
          width: bOptions.width,
          height: bOptions.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              _text(bOptions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return (icon != null
        ? Padding(
            padding: EdgeInsets.only(right: text != null ? 4.0 : 0.0),
            child: icon)
        : Divider());
  }

  Widget _text(AppButtonOptions bOptions) {
    return (text != null
        ? SizedBox(
            child: Text(text ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                textAlign: TextAlign.center,
                style: bOptions.textStyle))
        : Divider());
  }
}

class AppButtonOptions {
  double? width;
  double? height;
  Color? color;
  TextStyle? textStyle;
  double? elevation;
  BorderSide? borderSide;
  double? borderRadius;

  AppButtonOptions({
    this.width = 130.0,
    this.height = 40.0,
    this.color = AppTheme.primaryColor,
    this.textStyle,
    this.elevation = 0,
    this.borderSide,
    this.borderRadius = 12,
  });
}

extension HexColor on String {
  static Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  Color toColor() {
    return _getColorFromHex(this);
  }
}

extension NumExtension on num {
  get width => SizedBox(width: this.toDouble());

  get height => SizedBox(height: this.toDouble());
}

extension ContextMediaQuery on BuildContext {

  MediaQueryData get media => MediaQuery.of(this);

  double width({double percent = 100}) {
    return media.size.width * (percent / 100);
  }

  double height({double percent = 100}) {
    return media.size.height * (percent / 100);
  }

}

class ScaleAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Function() onTap;

  ScaleAnimationWidget({
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 80),
  });

  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      value: 1.0,
      vsync: this,
      lowerBound: 0.97,
      upperBound: 1.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (e) {
        _controller.reverse();
      },
      onTapUp: (e) {
        _controller.forward();
      },
      onTapCancel: () {
        _controller.forward();
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
