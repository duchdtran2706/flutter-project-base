import 'package:flutter/material.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:flutter_project_base/shared/common/validation_model.dart';
import 'package:flutter_project_base/shared/extensions/object_extensions.dart';

class AppFormField<T> extends StatefulWidget {
  const AppFormField({
    super.key,
    this.value,
    this.onChanged,
    this.decoration,
    this.error,
  });

  final ValidationModel<T>? value;
  final ErrorEntity? error;
  final ValueChanged<T?>? onChanged;
  final InputDecoration? decoration;

  @override
  State<AppFormField<T>> createState() => _AppFormFieldState<T>();
}

class _AppFormFieldState<T> extends State<AppFormField<T>> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value?.value?.toString());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppFormField<T> oldWidget) {
    if (_controller.text != widget.value?.value?.toString() &&
        widget.value?.value != null) {
      _controller.text = widget.value!.value.toString();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var _decorator = widget.decoration ?? const InputDecoration();
    if (widget.error is ValidationError &&
        widget.error?.code == widget.value?.key) {
      _decorator = _decorator.copyWith(errorText: widget.error?.message);
    }
    return TextField(
      controller: _controller,
      onChanged: (value) => widget.onChanged?.call(value.as<T>()),
      decoration: _decorator,
    );
  }
}
