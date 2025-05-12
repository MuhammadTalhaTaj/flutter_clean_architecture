import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';

import '../core/constants/imports.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final VoidCallback onChange;

  const CustomCheckBox({
    required this.value,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      height: 23,
      width: 23,
      decoration: BoxDecoration(
          color: value ? context.onPrimary : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: context.onPrimary)),
      child: Center(
          child: value
              ? Icon(
            Icons.check,
            color: context.primary,
            size: 20,
          )
              : null),
    );
  }
}
