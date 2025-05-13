import 'package:clean_architecture_bloc/core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';
import 'package:clean_architecture_bloc/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:clean_architecture_bloc/features/home/presentation/home/bloc/home_state.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/cusotm_check_box.dart';
import '../../../../widgets/event_card.dart';
import '../../../../widgets/topic_card.dart';
import '../../data/models/home_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Welcome Back,',
          style: TextStyle(color: context.primary, fontSize: 24),
        ),
        actions: const [
          Icon(Icons.settings),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Assets.images.temp2.image(
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                10.w,
                Text('john', style: context.bodyLarge),
                20.w,
              ],
            ).paddingOnly(left: 20),
            20.h,
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weekly Progress',
                        style: context.titleMedium!
                            .copyWith(color: context.onPrimary)),
                    4.h,
                    Text('10/15 Activities',
                        style: context.titleSmall!
                            .copyWith(color: context.onPrimary)),
                    18.h,
                    state is ProgressLoaded
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: state.progressList
                                .map((e) => Column(
                                      children: [
                                        CustomCheckBox(
                                          value: e.value,
                                          onChange: () {},
                                        ),
                                        3.h,
                                        Text(e.day,
                                            style: context.bodyLarge!.copyWith(
                                                color: context.onPrimary,
                                                fontSize: 17)),
                                      ],
                                    ))
                                .toList(),
                          )
                        : const CircularProgressIndicator()
                  ],
                ),
              ).paddingSymmetric(20, 0),
            ),
            20.h,
            Text('Upcoming Events', style: context.headLineSmall)
                .paddingOnly(left: 20),
            20.h,
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => EventCard(
                  item: CommunityEventModel(),
                  width: 220,
                ),
                separatorBuilder: (_, __) => 20.w,
                itemCount: 5,
              ).paddingSymmetric(5, 0),
            ),
            20.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Things', style: context.headLineSmall),
                InkWell(
                  onTap: () {},
                  child: Text('See all', style: context.bodyLarge),
                ),
              ],
            ).paddingSymmetric(20, 0),
            10.h,
            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TopicCard(
                  item: CommunityArticleModel(),
                  width: 170,
                ),
                separatorBuilder: (_, __) => 20.w,
                itemCount: 5,
              ).paddingSymmetric(5, 0),
            ),
            40.h,
          ],
        ),
      ),
    );
  }
}
