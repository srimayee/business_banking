import 'package:flutter_driver/driver_extension.dart';
import 'package:business_banking/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  var textInput = TestTextInput();
  Function(String) handler = (message) {
    switch (message) {
      case 'type transfer amount 10.5':
        textInput.enterText('10.5');
        textInput.receiveAction(TextInputAction.done);
        textInput.unregister();
        break;
      case 'prepare':
        textInput.register();
        break;
    }
  };
  enableFlutterDriverExtension(handler: handler);
  app.main();
}
