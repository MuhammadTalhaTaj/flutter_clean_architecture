import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {

}

class PageChangedState extends DashboardState {
  final int pageIndex;

  PageChangedState(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}