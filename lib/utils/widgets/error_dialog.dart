import 'package:flutter/material.dart';
import 'package:movie_list/configs/sizes.dart';
import 'package:movie_list/configs/styles.dart';
import 'package:movie_list/generated/l10n.dart';

class ErrorDialog extends StatelessWidget {

  static const String typeErrorNetwork = "errorNetwork";
  static const String typeError = "error";

  late final String _title;
  late final String _text;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget content = Text(_text);
    Widget title = Text(_title);
    if (icon != null) {
      if (icon == typeError) {
        title = const Center(child: Icon(Icons.warning, size: 48,));
      }
      if (icon == typeErrorNetwork) {
        title = const Center(child: Icon(Icons.network_check, size: 48,));
      }
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
              margin: const EdgeInsets.only(bottom: Sizes.generalMargin),
              child: Text(_title, textAlign: TextAlign.left, style: GeneralStyles.boldLabel,)
          ),
          Flexible(child: Text(_text))
        ],
      );
    }
    return AlertDialog(
      title: title,
      content: content,
      actions: <Widget>[
        TextButton(
          child: Text(S.current.accept),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  ErrorDialog(final String title, final String text, {Key? key,  this.icon }) : super(key: key) {
    _title = title;
    _text = text;
  }

}