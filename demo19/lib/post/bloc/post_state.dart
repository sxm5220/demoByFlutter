part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostFetching extends PostState {}

class PostFetchedDone extends PostState {}

class PostReachedBottom extends PostState {}

class PostFetchedFailure extends PostState {}
