import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_request_api/pages/movie_detail.dart';
import 'package:flutter_request_api/service/http_service.dart';

class MovieList extends StatefulWidget{
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList>{
  //String result ="";
  int moviesCount=0;
  List movies=[];
  HttpService service = HttpService();

  Future initialize() async{
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }


  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[position].title),
              subtitle: Text( 
                'Rating = ' +movies[position].voteAverage.toString(),
              ),
              onTap: (){
                MaterialPageRoute route = MaterialPageRoute(builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        }
      ),
    );
  }
}