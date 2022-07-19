import 'package:flutter/material.dart';
import 'package:movie_list/generated/l10n.dart';

import 'widgets/error_dialog.dart';

abstract class Messages {

  void showError(BuildContext context, String text, {String? icon}) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return ErrorDialog(
              S.current.error,
              text,
              icon: icon,
          );
        });
  }

}