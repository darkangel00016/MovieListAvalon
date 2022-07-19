import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/configs/colors.dart';
import 'package:movie_list/configs/styles.dart';
import 'package:movie_list/generated/l10n.dart';
import 'package:movie_list/screens/home/providers/main.dart';
import 'package:provider/provider.dart';

class MovieEmptyWidget extends StatelessWidget {

  const MovieEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return Visibility(
              visible: provider.items.isEmpty,
              child: Container(
                color: ColorConstants.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(S.current.noMovies, textAlign: TextAlign.center, style: GeneralStyles.titleGeneral,)
                    )
                  ],
                ),
              )
          );
        },
      ),
    );
  }

}