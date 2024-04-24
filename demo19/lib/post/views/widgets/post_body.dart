import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/post/bloc/post_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/post.dart';
import 'loading_skeleton.dart';

class PostBody extends StatefulWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostFetchedFailure) {
          return const Center(child: Text('failed to fetch posts'));
        }
        if (state is PostInitial) {
          return Wrap(
            runSpacing: 16,
            children: List.generate(10, (_) => const LoadingSkeleton()),
          );
        }
        List<Post> posts = context.watch<PostBloc>().repository.posts;
        return ListView.builder(
          controller: _scrollController,
          itemCount:
              (state is PostReachedBottom) ? posts.length : posts.length + 1,
          itemBuilder: (context, index) {
            return index == posts.length
                ? loadingWidget()
                : listWidget(posts[index]);
          },
        );
      },
    );
  }

  Widget loadingWidget() {
    return Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
        color: Colors.greenAccent,
        size: 50,
      ),
    ); //const LoadingSkeleton()
  }

  Widget listWidget(Post post) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      dense: true,
      isThreeLine: true,
      leading: Text('${post.id}', style: Theme.of(context).textTheme.caption),
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }

  void _onScroll() {
    if (_isScrollBottom) context.read<PostBloc>().add(PostFetch());
  }

  bool get _isScrollBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll > maxScroll * 0.9;
  }
}
