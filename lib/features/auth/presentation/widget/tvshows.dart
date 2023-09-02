import 'package:flutter/material.dart';
import 'package:movie_app/core/util/text.dart';
import 'package:movie_app/features/auth/presentation/widget/description.dart';

class TvShows extends StatelessWidget {
  final List tvshow;
  const TvShows({super.key, required this.tvshow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText('', color: Colors.white, size: 26.0, text: 'Popular Tv Shows',),
          const SizedBox(height: 10,),
          Container(height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvshow.length,
            itemBuilder: (context,index)
            {
              return InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tvshow[index]['title'] ?? tvshow[index]['name'], description: tvshow[index]['overview']??'', bannerurl: 'httpS://image.tmdb.org/t/p/w500'+tvshow[index]['backdrop_path'], posterurl: 'httpS://image.tmdb.org/t/p/w500'+tvshow[index]['poster_path'], vote: tvshow[index]['vote_average'].toString(), launch_on: tvshow[index]['release_date']??tvshow[index]['first_air_date'])));
                },
                child: Container(width: 230,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 230,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage('httpS://image.tmdb.org/t/p/w500'+tvshow[index]['backdrop_path']),fit: BoxFit.cover)
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child:  ModifiedText('', color: Colors.white, size: 14.0, text: tvshow[index]['name'] ?? 'Loading',),
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