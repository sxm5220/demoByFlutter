import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/post.dart';
import '../post_repository.dart';
import '../service/http_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<PostFetch>((event, emit) async {
      if (state is PostFetching || state is PostReachedBottom) return;
      if (state is! PostInitial) emit(PostFetching());
      List<Post> newPosts =
          await HttpService.fetchPosts(repository.posts.length);
      if (newPosts.isNotEmpty) {
        repository.posts.addAll(newPosts);
        emit(PostFetchedDone());
      } else {
        emit(PostReachedBottom());
      }
    });
  }
}
