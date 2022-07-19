import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/configs/colors.dart';
import 'package:movie_list/configs/sizes.dart';
import 'package:movie_list/configs/styles.dart';
import 'package:movie_list/generated/l10n.dart';
import 'package:movie_list/responses/movie.dart';

class MovieDetailPage extends StatelessWidget {

  final Movie item;

  const MovieDetailPage(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: item.poster,
                progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(height: 100, child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Sizes.generalMargin),
                child: Text(item.title, style: GeneralStyles.titleGeneral,),
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
                    Text("${item.voteAverage}", style: GeneralStyles.label,)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: Sizes.generalMargin,
                    right: Sizes.generalMargin,
                    bottom: Sizes.generalMargin
                ),
                child: Row(
                  children: [
                    Text("${S.current.originalTitle}: ", style: GeneralStyles.boldLabel),
                    Text(item.originalTitle, style: GeneralStyles.label),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: Sizes.generalMargin,
                    right: Sizes.generalMargin,
                    bottom: Sizes.generalMargin
                ),
                child: Row(
                  children: [
                    Text("${S.current.releaseDate}: ", style: GeneralStyles.boldLabel),
                    Text(item.releaseDate, style: GeneralStyles.label),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: Sizes.generalMargin,
                  right: Sizes.generalMargin
                ),
                child: Text(S.current.storyLine, style: GeneralStyles.boldLabel),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Sizes.generalMargin),
                child: Text(item.overview, style: GeneralStyles.label),
              ),
            ],
          ),
        )
      ),
    );
  }

}