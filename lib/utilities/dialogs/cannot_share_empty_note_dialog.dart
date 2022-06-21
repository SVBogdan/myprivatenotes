import 'package:flutter/material.dart';
import 'package:myprivatenotes/extension/buildcontext/loc.dart';
import 'package:myprivatenotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: context.loc.sharing,
      content: context.loc.cannot_share_empty_note_prompt,
      optionsBuilder: () => {
            context.loc.ok: null,
          });
}
