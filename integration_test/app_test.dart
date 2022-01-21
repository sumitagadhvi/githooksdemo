import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logindemowithtest/main.dart'as app;

void main(){
  group('', (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('full App test', (tester)async{
      app.main();
     await tester.pumpAndSettle();
      final emailField=find.byType(TextFormField).first;
      final passwordFormField=find.byType(TextFormField).last;
      final loginButton=find.byType(ElevatedButton).first;

     await tester.enterText(emailField, 'gadhvisumita06@gmail.com');
     await tester.enterText(passwordFormField, 'Sumita@67');
    await  tester.pumpAndSettle();

     await tester.tap(loginButton);
     await tester.pumpAndSettle();
    });
  });
}