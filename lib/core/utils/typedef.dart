import 'package:dartz/dartz.dart';
import 'package:small_kindness/core/consts/const_classes.dart';


typedef ResultFuture<T> = Future<Either<Failure, Success<T>>>;

typedef ResultVoid = ResultFuture<void>;


