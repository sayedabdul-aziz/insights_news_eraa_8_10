part of 'news_cubit.dart';

class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsSuccessState extends NewsState {
  final NewsModel model;

  NewsSuccessState({required this.model});
}

final class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState({required this.error});
}

final class SearchLoadingState extends NewsState {}

final class SearchSuccessState extends NewsState {
  final NewsModel model;

  SearchSuccessState({required this.model});
}

final class SearchErrorState extends NewsState {
  final String error;

  SearchErrorState({required this.error});
}
