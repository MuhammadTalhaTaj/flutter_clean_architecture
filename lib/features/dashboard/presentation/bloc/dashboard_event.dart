import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends DashboardEvent {
  final int pageIndex;

  ChangePageEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}