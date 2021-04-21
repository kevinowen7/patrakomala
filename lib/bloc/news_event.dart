part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent{
  @override
  List<Object> get props => [];
}
class FetchNewsDetail extends NewsEvent{
  final newsId;
  FetchNewsDetail(this.newsId);
  @override
  List<Object> get props => [newsId];
}
class FilterNews extends NewsEvent{
  final String title;
  FilterNews(this.title);
  @override
  List<Object> get props => [title];
}



