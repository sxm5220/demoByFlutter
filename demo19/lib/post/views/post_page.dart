import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/post/bloc/post_bloc.dart';

import 'widgets/post_body.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc()..add(PostFetch()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Infinte List'),
        ),
        body: const PostBody(),
      ),
    );
  }
}
