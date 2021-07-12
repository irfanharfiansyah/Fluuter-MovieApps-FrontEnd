import 'package:flutter/material.dart';
import 'package:flutter_application_http_request/service/http_sevice.dart';
import 'package:flutter_application_http_request/style/font_style.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  List movies2;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    movies2 = await service.getTopMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
      movies2 = movies2;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1B1B),
      appBar: AppBar(
        backgroundColor: Color(0xFF242121),
        title: Text(
          "Movie App",
          style: pop.copyWith(
              color: Color(0xffF8F3E3), fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xffF8F3E3),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 9),
              height: 40.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text("All", style: TextStyle(color: Colors.white)),
                      backgroundColor: Color(0xffFF2047),
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "Action",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text("Adventure",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text("Comedie",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 20, top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated',
                    style: beb.copyWith(
                        color: Color(0xffF8C25C),
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Color(0xffF8F3E3),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 370.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
                itemBuilder: (context, int position) => Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  width: 200,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => MovieDetail(movies2[position]),
                          );
                          Navigator.push(context, route);
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF353232),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10)), //<--custom shape
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                movies2[position].posterPath,
                            fit: BoxFit.fitWidth,
                            height: 280,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              movies2[position].title,
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              style: pop.copyWith(
                                  fontSize: 13,
                                  color: Color(0xffF8F3E3),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            movies2[position].releaseDate,
                            style: pop.copyWith(
                                fontSize: 13, color: Color(0xffF8C25C)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Color(0xffF8C25C),
                              ),
                              Text(
                                movies2[position].voteAverage.toString(),
                                style: pop.copyWith(
                                    color: Color(0xffF8F3E3), fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: beb.copyWith(
                        color: Color(0xffF8C25C),
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
                itemBuilder: (context, int position) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            MaterialPageRoute route = MaterialPageRoute(
                              builder: (_) => MovieDetail(movies[position]),
                            );
                            Navigator.push(context, route);
                          },
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                movies[position].posterPath,
                            height: 165,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 210,
                            child: Text(
                              movies[position].title,
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              style: pop.copyWith(
                                  fontSize: 20,
                                  color: Color(0xffF8F3E3),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            movies[position].releaseDate,
                            style: pop.copyWith(
                              color: Color(0xffF8C25C),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    size: 17,
                                    color: (index <
                                            (movies2[index].voteAverage / 2)
                                                .floor())
                                        ? Color(0xffF8C25C)
                                        : Color(0xffF8F3E3)),
                              ),
                              Text(
                                movies[position].voteAverage.toString(),
                                style: pop.copyWith(color: Color(0xffF8F3E3)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
