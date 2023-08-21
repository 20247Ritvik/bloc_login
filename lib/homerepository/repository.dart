import 'dart:convert';
import 'package:http/http.dart';
import '../model/modelclass.dart';

class HomeRepository {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>> getAll() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> posts = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
