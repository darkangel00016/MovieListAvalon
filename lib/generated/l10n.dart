// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Movie list`
  String get appName {
    return Intl.message(
      'Movie list',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `There is not movies on the list`
  String get noMovies {
    return Intl.message(
      'There is not movies on the list',
      name: 'noMovies',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get anErrorHasOccurred {
    return Intl.message(
      'An error has occurred',
      name: 'anErrorHasOccurred',
      desc: '',
      args: [],
    );
  }

  /// `There is a error connection`
  String get errorConnection {
    return Intl.message(
      'There is a error connection',
      name: 'errorConnection',
      desc: '',
      args: [],
    );
  }

  /// `Original title`
  String get originalTitle {
    return Intl.message(
      'Original title',
      name: 'originalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Release date`
  String get releaseDate {
    return Intl.message(
      'Release date',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Story line`
  String get storyLine {
    return Intl.message(
      'Story line',
      name: 'storyLine',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Top rated`
  String get topRated {
    return Intl.message(
      'Top rated',
      name: 'topRated',
      desc: '',
      args: [],
    );
  }

  /// `By top`
  String get byTopRated {
    return Intl.message(
      'By top',
      name: 'byTopRated',
      desc: '',
      args: [],
    );
  }

  /// `By popular`
  String get byPopular {
    return Intl.message(
      'By popular',
      name: 'byPopular',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred, tap over the screen to try again.`
  String get tryAgain {
    return Intl.message(
      'An error has occurred, tap over the screen to try again.',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
