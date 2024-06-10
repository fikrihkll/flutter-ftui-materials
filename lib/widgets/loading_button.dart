import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {

  final bool isLoading;
  final Function() onPressed;
  final String text;
  final Color? buttonColor;
  const LoadingButton({
    super.key,
    this.isLoading = false,
    this.buttonColor,
    required this.onPressed,
    required this.text
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {

  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return MaterialButton(
        color: widget.buttonColor ?? _theme.colorScheme.primary,
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: widget.isLoading ? (
            const CircularProgressIndicator()
        ) : (
            Text(widget.text)
        )
    );
  }
}
