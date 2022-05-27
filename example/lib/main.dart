import 'package:flutter/material.dart';
import 'package:flutter_snackbars/message_snackbars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'SnackBar Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: 'SnackBar Demo Page'),
      );
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 400 ? 400.0 : null;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => MessageSnackBar.base(
                message: "A simple basic snackbar",
              ).show(context),
              child: const Text("Show message"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.error(
                message: "Something bad has happened!",
              ).show(context),
              child: const Text("Show error"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.loading(
                message: "Loading...",
              ).show(context),
              child: const Text("Show loading"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.success(
                message: "Success!!!",
              ).show(context),
              child: const Text("Show success"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.base(
                message: "A floating basic snackbar",
                behavior: SnackBarBehavior.floating,
                width: width,
              ).show(context),
              child: const Text("Show floating message"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.error(
                message: "Something bad has happened!",
                behavior: SnackBarBehavior.floating,
                width: width,
              ).show(context),
              child: const Text("Show floating error"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.loading(
                message: "Loading...",
                behavior: SnackBarBehavior.floating,
                width: width,
              ).show(context),
              child: const Text("Show floating loading"),
            ),
            ElevatedButton(
              onPressed: () => MessageSnackBar.success(
                message: "Success!!!",
                behavior: SnackBarBehavior.floating,
                width: width,
              ).show(context),
              child: const Text("Show floating success"),
            ),
          ],
        ),
      ),
    );
  }
}
