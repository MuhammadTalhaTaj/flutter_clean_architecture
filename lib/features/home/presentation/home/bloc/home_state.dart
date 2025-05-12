abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProgressLoaded extends HomeState {
  final List<ProgressModel> progressList;

  ProgressLoaded(this.progressList);
}






class ProgressModel {
  final bool value;
  final String day;

  ProgressModel(this.value, this.day);
}