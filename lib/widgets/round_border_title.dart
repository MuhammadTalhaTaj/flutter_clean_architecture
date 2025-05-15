import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';

import '../core/constants/imports.dart';

class RoundBorderTitle extends StatelessWidget {
  final String title;
  final bool showBackIcon;
  const RoundBorderTitle({
    this.showBackIcon=false,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
          border: Border(bottom: BorderSide(color: context.lightGrey)),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      padding: EdgeInsets.symmetric(horizontal: showBackIcon?5:20, vertical: 25),
      child: Row(
        children: [
          if( showBackIcon)...[
            BackButton(),
            16.w,
          ],
          Text(
            title,
            style: context.titleLarge,
          ),
        ],
      ),
    );
  }
}
