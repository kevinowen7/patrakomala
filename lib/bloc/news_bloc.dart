import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if(event is FetchNews){
      ApiReturnValue<List<News>> news = await NewsServices.getNews();
      yield(NewsLoaded(news));
    }else if(event is FetchNewsDetail){
      ApiReturnValue<News> news = await NewsServices.getNewsDetail(event.newsId);
      yield(NewsDetailLoaded(news));
    }else if(event is FilterNews){
      ApiReturnValue<List<News>> news = await NewsServices.getNewsFilter(event.title);
      yield(NewsFilterLoaded(news));
    }
  }
}
