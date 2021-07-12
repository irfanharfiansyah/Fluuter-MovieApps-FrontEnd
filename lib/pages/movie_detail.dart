import 'package:flutter/material.dart';
import 'package:flutter_application_http_request/models/movie.dart';
import 'package:flutter_application_http_request/style/font_style.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = "https://image.tmdb.org/t/p/w500";

  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {})
        ],
      ),
      backgroundColor: Color(0xFF1D1B1B),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(path),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF1D1B1B),
                    Color(0xFF1D1B1B).withOpacity(0.8),
                    Color(0xFF1D1B1B).withOpacity(0.5),
                    Colors.transparent,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: beb.copyWith(
                          fontSize: 30,
                          color: Color(0xffF8F3E3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        movie.releaseDate,
                        style: pop.copyWith(
                          color: Color(0xffF8C25C),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            movie.voteAverage.toString(),
                            style: beb.copyWith(
                              fontSize: 18,
                              color: Color(0xffF8F3E3),
                            ),
                          ),
                          ...List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                size: 17,
                                color: (index < (movie.voteAverage / 2).floor())
                                    ? Color(0xffF8C25C)
                                    : Color(0xffF8F3E3)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Overview",
                style: pop.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Text(
                movie.overview,
                style: pop.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
