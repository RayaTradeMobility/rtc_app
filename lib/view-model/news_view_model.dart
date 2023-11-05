import '../models/categories_news_model.dart';
import '../repo/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  // Future<NewsModel> fetchNewsChannelHeadlinesApi(
  //     String channelName) async {
  //   final response = await _rep.getCard(channelName);
  //   return response;
  // }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}
