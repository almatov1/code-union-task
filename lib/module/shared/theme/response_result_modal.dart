import 'package:flutter/cupertino.dart';

class ResponseResultModal {
  static Future<void> dialogBuilder({
    required BuildContext context,
    required bool success,
    String? error,
  }) async {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(success ? 'Успешно!' : 'Ошибка!'),
        content: error != null ? Text(error) : null,
        actions: [
          CupertinoDialogAction(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
