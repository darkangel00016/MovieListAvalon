import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_list/configs/apis.dart';
import 'package:movie_list/configs/colors.dart';
import 'package:movie_list/configs/sizes.dart';
import 'package:movie_list/configs/styles.dart';
import 'package:movie_list/core/mvi.dart';
import 'package:movie_list/generated/l10n.dart';
import 'package:movie_list/utils/messages.dart';
import 'package:provider/provider.dart';

import 'providers/main.dart';
import 'providers/movie_source.dart';
import 'widgets/empty.dart';
import 'widgets/list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with Messages {

  ValueNotifier<bool> loading = ValueNotifier(false);
  ValueNotifier<bool> tryAgain = ValueNotifier(false);

  void _loadData(MovieSourceType type) async {
    if (widget.globalKey.currentContext == null) {
      return;
    }
    var provider = Provider.of<MainProvider>(widget.globalKey.currentContext!, listen: false);
    loading.value = true;
    var response = await Api.items(type);
    try {
      switch (response.intent) {
        case MviApiIntents.SUCCESS:
          loading.value = false;
          provider.setItems(response.getData().results);
          break;
        case MviApiIntents.FAILURE:
          throw Exception(response.error);
        case MviApiIntents.UNKNOWN:
          throw Exception(S.current.anErrorHasOccurred);
      }
    } catch (e) {
      loading.value = false;
      tryAgain.value = true;
      String message = e.toString();
      if (e is SocketException) {
        message = S.current.errorConnection;
      }
      if (e is TimeoutException) {
        message = S.current.errorConnection;
      }
      showError(widget.globalKey.currentContext!, message);
    }
  }

  void _listenerSort() {
    if (widget.globalKey.currentContext == null) {
      return;
    }
    var provider = Provider.of<MovieSourceProvider>(widget.globalKey.currentContext!, listen: false);
    provider.addListener(() {
      _loadData(provider.type);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadData(MovieSourceType.Popular);
      _listenerSort();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => MovieSourceProvider()),
      ],
      child: Scaffold(
        key: widget.globalKey,
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Text(S.current.appName)
              ),
              Consumer<MovieSourceProvider>(
                builder: (_, provider, __) {
                  return SizedBox(
                    width: double.infinity,
                    child: Text(provider.getTitle(), style: GeneralStyles.subtitle,)
                  );
                },
              )
            ],
          ),
          actions: [
            Consumer<MovieSourceProvider>(
              builder: (_, provider, __) {
                String text = S.current.byTopRated;
                if (provider.isTopRated()) {
                  text = S.current.byPopular;
                }
                return InkWell(
                  onTap: () {
                    provider.toggle();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(text, style: GeneralStyles.label,),
                        Icon(Icons.sort, color: ColorConstants.white,)
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: SafeArea(
            child: Stack(
              children: [
                const MovieList(),
                const MovieEmptyWidget(),
                ValueListenableBuilder<bool>(
                    valueListenable: loading,
                    builder: (context, value, child) {
                      return value?child!:Container();
                    },
                    child: Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Center (
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(),
                            Text(S.current.loading)
                          ],
                        ),
                      ),
                    )
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: tryAgain,
                    builder: (context, value, child) {
                      return value?child!:Container();
                    },
                    child: Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          var provider = Provider.of<MovieSourceProvider>(widget.globalKey.currentContext!, listen: false);
                          tryAgain.value = false;
                          _loadData(provider.type);
                        },
                        child: Container(
                          height: double.infinity,
                          color: ColorConstants.backdrop,
                          child: Center (
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.refresh, size: Sizes.iconHD, color: ColorConstants.white,),
                                Container(
                                  margin: const EdgeInsets.only(top: Sizes.generalMargin),
                                  child: Text(S.current.tryAgain, textAlign: TextAlign.center, style: GeneralStyles.label.copyWith(color: ColorConstants.white),)
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                )
              ],
            )
        )
      ),
    );
  }
}