import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonInput extends StatefulWidget {
  final double? width;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final Color? hintColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool enableObscureIcon;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? boxInputColor;
  final double? inputHeight;
  final bool showCounter;
  final OutlineInputBorder? border;
  final AutovalidateMode? autovalidateMode;
  final Color? borderColor;

  const CommonInput({
    super.key,
    this.width,
    this.maxLength,
    this.hintText,
    this.hintColor,
    this.labelText,
    this.labelStyle,
    this.obscureText = false,
    this.enableObscureIcon = false,
    this.enabled,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.suffixIcon,
    this.padding,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines,
    this.prefixIcon,
    this.boxInputColor,
    this.inputHeight,
    this.showCounter = false,
    this.border,
    this.autovalidateMode,
    this.borderColor,
  });

  @override
  State<CommonInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CommonInput> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  void togglePasswordVisibility() {
    setState(() => isObscure = !isObscure);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      child: FormField(
        validator:
            widget.validator != null
                ? (_) => widget.validator!(widget.controller?.text)
                : null,
        builder: (FormFieldState state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                maxLines: isObscure ? 1 : widget.maxLines,
                onFieldSubmitted: widget.onFieldSubmitted,
                textInputAction: widget.textInputAction,
                focusNode: widget.focusNode,
                enabled: widget.enabled,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                autovalidateMode: widget.autovalidateMode,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                maxLength: widget.maxLength,
                obscureText: isObscure,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  labelText: widget.labelText,

                  labelStyle:
                      widget.labelStyle ??
                      TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        // color: Colors.white,
                      ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: widget.hintColor ?? Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border:
                      widget.border ??
                      OutlineInputBorder(
                        borderSide:
                            widget.borderColor != null
                                ? BorderSide(color: widget.borderColor!)
                                : BorderSide(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                  focusedBorder:
                      widget.border ??
                      OutlineInputBorder(
                        borderSide:
                            widget.borderColor != null
                                ? BorderSide(color: widget.borderColor!)
                                : BorderSide(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon:
                      widget.enableObscureIcon
                          ? IconButton(
                            onPressed: togglePasswordVisibility,
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          )
                          : widget.suffixIcon,
                  counterText: widget.showCounter ? null : '',
                ),
              ),
              if (state.hasError)
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          state.errorText!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
