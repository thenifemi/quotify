import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../domain/quotes/failure.dart';
import '../../domain/quotes/quotes.dart';
import '../../domain/quotes/quotes_interface.dart';

@LazySingleton(as: QuotesInterface)
class QuotesRepository implements QuotesInterface {
  @override
  Future<Either<Failure, Quotes>> getQuotes() async {
    const url = "https://quotable.io/quotes?page=1&limit=10&tags=technology";

    try {
      final Response response = await http.get(Uri.parse(url));

      switch (response.statusCode) {
        case 200:
          final quotesBox = await Hive.openBox<Quotes>('quotes');
          quotesBox.put('quotes', quotesFromJson(response.body));

          return right(quotesFromJson(response.body));

        case 403:
          return left(const Failure.serverError());

        case 404:
          return left(const Failure.notFound());

        default:
          return left(const Failure.unexpected());
      }
    } on SocketException catch (_) {
      return left(const Failure.noInternet());
    }
  }
}
