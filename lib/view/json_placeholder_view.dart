import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../core/model.dart';
import '../core/preferences/shared_manager.dart';



class JsonPlaceHolderView extends StatefulWidget {
  @override
  _JsonPlaceHolderViewState createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView> {
  @override
  void initState() {
    super.initState();
  }

  Future<Post> getJsonPlaceHolderDatas() async {
    final _response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    
    final _mapJson = json.decode(_response.body);
    var post = Post.fromJson(_mapJson);
    await SharedManager.inistance.saveJsonModel(SharedKeys.postData, post);
   print(SharedManager.inistance.getJsonModel<Post>( SharedKeys.postData,Post(body: "",id: 1,title: "",userId: 5),));
    

 
    return post;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center, child: _placeHolderDatasWidget),
    );
  }

  Widget get _placeHolderDatasWidget => FutureBuilder<Post>(
        future: getJsonPlaceHolderDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(snapshot.data!.title??"Salam"),
              subtitle: Text(snapshot.data!.title??"Salam"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
}