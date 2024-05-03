import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  static const name = "movie-screen";

  final String movieId;
  const MoviePage({super.key, required this.movieId});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends  State<MoviePage> {

  @override
  void initState() {
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
