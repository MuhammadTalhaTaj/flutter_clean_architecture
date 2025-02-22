// import 'dart:async';
// import 'dart:io';
//
// import 'package:clean_architecture_bloc/core/constants/constants.dart';
// import 'package:clean_architecture_bloc/core/resources/data_state.dart';
// import 'package:clean_architecture_bloc/features/daily_news/data/data_sources/remote/news_api_services.dart';
// import 'package:clean_architecture_bloc/features/daily_news/data/models/article.dart';
// import 'package:clean_architecture_bloc/features/daily_news/domain/entities/article.dart';
// import 'package:clean_architecture_bloc/features/daily_news/domain/repository/article_repository.dart';
// import 'package:dio/dio.dart';
//
// class ArticleRepositoryImpl implements ArticleRepository {
//   final NewsApiServices _newsApiServices;
//
//   ArticleRepositoryImpl(this._newsApiServices);
//
//   @override
//   Future<DataState<List<ArticleModel>>> getNewsArticles() async {
//     try {
//       final articles = await NewsApiServicesOwn.getArticles();
//       return DataSuccess(articles);
//     } catch (e) {
//       // Log the error for debugging purposes
//       print('Error fetching articles: $e');
//       return DataFailed('Failed to fetch articles: $e');
//     }
//   }
//
// }