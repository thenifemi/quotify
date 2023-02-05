import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'quotes.dart';

abstract class QuotesInterface {
  Future<Either<Failure, Quotes>> getQuotes();
}
