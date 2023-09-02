import 'package:flutter/material.dart';
import 'package:movie_app/core/util/text.dart';
import 'package:movie_app/features/auth/presentation/widget/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText('', color: Colors.white, size: 26.0, text: 'Top Rated Movies',),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated.length,
            itemBuilder: (context,index)
            {
              return InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'] ?? toprated[index]['name'], description: toprated[index]['overview']??'', bannerurl: 'httpS://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'], posterurl: 'httpS://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], vote: toprated[index]['vote_average'].toString(), launch_on: toprated[index]['release_date']??toprated[index]['first_air_date'])));
                },
                child: Container(width: 140,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('httpS://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']))
                      ),
                    ),
                    Container(
                      child:  ModifiedText('', color: Colors.white, size: 14.0, text: toprated[index]['title'] ?? 'Loading',),
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