import 'package:flutter/material.dart';
import 'package:movie_app/core/util/text.dart';
import 'package:movie_app/features/auth/presentation/widget/toprated.dart';
import 'package:movie_app/features/auth/presentation/widget/trending.dart';
import 'package:movie_app/features/auth/presentation/widget/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tvshows=[];
  final String apikey='b4bfde6eb01818660e5875ca1186d0ea';
  final String readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNGJmZGU2ZWIwMTgxODY2MGU1ODc1Y2ExMTg2ZDBlYSIsInN1YiI6IjY0ZjFjMDgwOTdhNGU2MDBmZWE5MWM4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ttD6JsutU-uHL9Cz_Y1Htau8BJVcp2ojC5wRuTHs398';
  
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies()async
  {
    TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    )
    );
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshowsresult=await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies=trendingresult['results'];
      topratedmovies=topratedresult['results'];
      tvshows=tvshowsresult['results'];
    });
    print(trendingmovies);
    print('---------------------------------------------');
    print(topratedmovies);
    print('---------------------------------------------');
    print(tvshows);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  const ModifiedText('', color: Colors.white, size: 20.0, text: 'Movies App❤️',),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TvShows(tvshow: tvshows),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}