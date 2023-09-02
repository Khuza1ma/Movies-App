import 'package:flutter/material.dart';
import 'package:movie_app/core/util/text.dart';
import 'package:movie_app/features/auth/presentation/widget/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText('', color: Colors.white, size: 26.0, text: 'Trending Movies',),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context,index)
            {
              return InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'] ?? trending[index]['name'], description: trending[index]['overview']??'', bannerurl: 'httpS://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'], posterurl: 'httpS://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), launch_on: trending[index]['release_date']??trending[index]['first_air_date'])));
                },
                child: Container(width: 140,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('httpS://image.tmdb.org/t/p/w500'+trending[index]['poster_path']))
                      ),
                    ),
                    Container(
                      child:  ModifiedText('', color: Colors.white, size: 14.0, text: trending[index]['title'] ?? trending[index]['name'],),
                    )
                  ],
                ),),
              );
            }),
          )
        ],
      ),
    );
  }
}