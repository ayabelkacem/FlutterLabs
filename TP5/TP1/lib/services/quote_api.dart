import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../Models/quote.dart';

part 'quote_api.g.dart';

@RestApi(baseUrl: 'https://zenquotes.io/api')
abstract class QuoteApi {
  factory QuoteApi(Dio dio) = _QuoteApi;

  @GET('/quotes')
  Future<List<Quote>> getQuotes();
}
