import 'package:flutter/material.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';

class BInput extends StatefulWidget {
  final String? label;
  final int? labelFontWeight;
  final bool? disabled;
  final IconData? prependIconName;
  final IconData? appendIconName;
  final Function(TextEditingController controlle)? prependIconPress;
  final Function(TextEditingController controlle)? appendIconPress;
  final bool? obscureText;
  final Function(TextEditingController controller, String value)? onChange;
  final TextInputType? inputType;
  final String? errorText;
  const BInput(
      {Key? key,
      this.errorText,
      this.label,
      this.disabled,
      this.prependIconName,
      this.appendIconName,
      this.prependIconPress,
      this.appendIconPress,
      this.obscureText,
      this.onChange,
      this.inputType,
      this.labelFontWeight})
      : super(key: key);

  @override
  State<BInput> createState() => _BInputState();
}

class _BInputState extends State<BInput> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? 'NA',
          style: useGetTextVariant('text-2',
              fontWeight: widget.labelFontWeight ?? 400,
              color:
                  widget.errorText != null ? Colors.redAccent : Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          keyboardType: widget.inputType,
          obscureText: widget.obscureText ?? false,
          controller: controller,
          onChanged: (value) {
            if (widget.onChange != null) {
              setState(() {
                widget.onChange!(controller, value);
              });
            }
          },
          decoration: InputDecoration(
              errorText: widget.errorText,
              suffixIcon: widget.appendIconName != null
                  ? IconButton(
                      icon: Icon(widget.appendIconName),
                      onPressed: () {
                        widget.appendIconPress!(controller);
                      })
                  : null,
              prefixIcon: widget.prependIconName != null
                  ? IconButton(
                      icon: Icon(widget.prependIconName),
                      onPressed: () {
                        widget.prependIconPress!(controller);
                      })
                  : null,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        ),
      ],
    );
  }
}
