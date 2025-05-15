import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../features/dashboard/presentation/bloc/dashboard_event.dart';
import '../features/dashboard/presentation/bloc/dashboard_state.dart';
import '../gen/assets.gen.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        int currentTab = 0;
        if (state is PageChangedState) {
          currentTab = state.pageIndex;
        }

        return SafeArea(
          child: Container(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(top: BorderSide(width: 0.5, color: context.lightGrey)),
                ),
                width: double.infinity,
                height: 68,
                child: Row(
                  children: [
                    navItem(
                      context,
                      currentTab == 0 ? Assets.icons.sHome : Assets.icons.home,
                      'Home',
                      currentTab == 0,
                      onTap: () => context.read<DashboardBloc>().add(ChangePageEvent(0)),
                    ),
                    navItem(
                      context,
                      currentTab == 1 ? Assets.icons.sActivities : Assets.icons.activities,
                      'Activities',
                      currentTab == 1,
                      onTap: () => context.read<DashboardBloc>().add(ChangePageEvent(1)),
                    ),
                    navItem(
                      context,
                      currentTab == 2 ? Assets.icons.sWellbeing : Assets.icons.wellbeing,
                      'Well-being',
                      currentTab == 2,
                      onTap: () => context.read<DashboardBloc>().add(ChangePageEvent(2)),
                    ),
                    navItem(
                      context,
                      currentTab == 3 ? Assets.icons.sCommunity : Assets.icons.community,
                      'Community',
                      currentTab == 3,
                      onTap: () => context.read<DashboardBloc>().add(ChangePageEvent(3)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget navItem(BuildContext context, String icon, String title, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, color: selected ? context.primary : null, height: 22),
              5.h,
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: context.bodySmall!.copyWith(
                    color: selected ? context.primary : null,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}