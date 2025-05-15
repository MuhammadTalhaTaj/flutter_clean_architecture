
import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/widget_extension.dart';

import '../../../core/constants/imports.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/round_border_title.dart';
import '../../../widgets/topic_card.dart';
import '../../home/data/models/home_model.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RoundBorderTitle(title: 'Community',),
              Column(
                children: [
                   Text("Community View", style: context.headLineSmall),
                ],
              ).paddingAll(20),
            ],
          ),
        ),
      ),
    );
  }
}




