part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}
class NewsLoaded extends NewsState {
  final ApiReturnValue<List<News>> news;
  NewsLoaded(this.news);
  @override
  List<Object> get props => [news];
}
class NewsDetailLoaded extends NewsState {
  final ApiReturnValue<News> news;
  NewsDetailLoaded(this.news);
  @override
  List<Object> get props => [news];
}
class NewsFilterLoaded extends NewsState {
  final ApiReturnValue<List<News>> news;
  NewsFilterLoaded(this.news);
  @override
  List<Object> get props => [news];
}
