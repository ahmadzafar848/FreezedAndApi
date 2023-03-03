import 'dart:convert';

import 'package:http/http.dart';

import '../models/post_model/post_model.dart';

class ApiService{
  final String _baseUrl='https://jsonplaceholder.typicode.com';
  final String _fetchPostsUrl='/posts';
  Future<List<PostModel>> fetchPosts()async{
    Response response=await get(Uri.parse(_baseUrl+_fetchPostsUrl));
    if(response.statusCode==200){
      try{
       List list= jsonDecode(response.body);
       return list.map((e) => PostModel.fromJson(e)).toList();
      }catch(e){
        print(e.toString());
      }
    }
    return [];
  }
}