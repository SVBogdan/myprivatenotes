import 'package:flutter/material.dart';
import 'package:myprivatenotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'We have sent you a password reset link',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
