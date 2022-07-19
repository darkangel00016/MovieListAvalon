import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_list/configs/colors.dart';
import 'package:movie_list/configs/sizes.dart';
import 'package:movie_list/configs/styles.dart';
import 'package:movie_list/responses/movie.dart';
import 'package:movie_list/screens/home/pages/detail.dart';

class MovieItemWidget extends StatelessWidget {

  final Movie item;

  const MovieItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return MovieDetailPage(item);
          }));
        },
        child: Card(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: item.image,
                progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(height: 100, child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Sizes.generalMargin),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(item.title, style: GeneralStyles.titleGeneral),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: Sizes.generalMargin,
                  right: Sizes.generalMargin,
                  bottom: Sizes.generalMargin
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: ColorConstants.yellow,),
                    Text("${item.voteAverage}", style: GeneralStyles.label)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}