import 'package:flutter/material.dart';
import 'package:flutter_request_api/models/movie.dart';

class MovieDetail extends StatelessWidget{
  final Movie movie;
  final String imPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);
  
 @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imPath + movie.posterPath; 
    } else {
      path = 'https://www.freeiconspng.com/uploads/no-image-icon-11.PNG';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: height / 1.5,
              child: Image.network(path),
            ),
            Container(
              child: Text(
                movie.overview,
                style: TextStyle(fontSize: 18),
              ),
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}