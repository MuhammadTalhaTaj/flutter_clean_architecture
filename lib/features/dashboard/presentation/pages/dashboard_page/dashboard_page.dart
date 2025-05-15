import 'package:clean_architecture_bloc/features/community_view/presentaiton/community_view.dart';
import 'package:clean_architecture_bloc/features/wellbeing_view/presentaiton/wellbeing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/lazy_stackindex.dart';
import '../../../../../widgets/nav_bar.dart';
import '../../../../activities_view/presentaiton/activities_view.dart';
import '../../../../home/presentation/home/home.dart';
import '../../bloc/dashboard_bloc.dart';
import '../../bloc/dashboard_event.dart';
import '../../bloc/dashboard_state.dart';

class DashboardView extends StatelessWidget {
  final int? index;

  const DashboardView({this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(ChangePageEvent(index ?? 0)),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: LazyIndexedStack(
              index:state is PageChangedState? state.pageIndex:0,
              children: const [
                HomeView(),
                ActivitiesView(),
                WellbeingView(),
                CommunityView(),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const NavBar(),
          );
        },
      ),
    );
  }
}