import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post.dart';

const _numOfFetchAtOnce = 10;

const _authority = 'jsonplaceholder.typicode.com';
const _unencodedPath = '/posts';

class HttpService {
  static Future<List<Post>> fetchPosts(int startIndex) async {
    Uri uri = Uri.https(
      _authority,
      _unencodedPath,
      <String, String>{'_start': '$startIndex', '_limit': '$_numOfFetchAtOnce'},
    );
    final response = await http.Client().get(uri);
    if (response.statusCode != 200) throw Exception('error fetching posts');
    var jsonDatas = json.decode(response.body) as List;
    return jsonDatas.map((e) => Post.fromJson(e)).toList();
  }
}
