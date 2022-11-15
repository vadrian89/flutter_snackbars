import 'package:flutter/material.dart';
import 'package:flutter_snackbars/icon_snackbars.dart';
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
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
        ),
        home: const MyHomePage(title: 'SnackBar Demo Page'),
      );
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: TabBarView(
            controller: _controller,
            children: const [
              _MessageSnackBars(),
              _IconSnackBars(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).primaryColorDark,
            child: TabBar(
              controller: _controller,
              tabs: const [
                Tab(text: "Message snackbars"),
                Tab(text: "Icon snackbars"),
              ],
            ),
          ),
        ),
      );
}

class _IconSnackBars extends StatelessWidget {
  const _IconSnackBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => IconSnackBar.base(
                icon: const Icon(Icons.info),
                message: "A simple basic snackbar",
                action: SnackBarAction(
                  label: "Close",
                  onPressed: () => print("Action tapped"),
                ),
              ).show(context),
              child: const Text("Show message"),
            ),
            ElevatedButton(
              onPressed: () => IconSnackBar.error(
                message: "Something bad has happened!",
              ).show(context),
              child: const Text("Show error"),
            ),
            ElevatedButton(
              onPressed: () => IconSnackBar.loading(
                message: "Loading...",
              ).show(context),
              child: const Text("Show loading"),
            ),
            ElevatedButton(
              onPressed: () => IconSnackBar.success(
                message: "Success!!!",
              ).show(context),
              child: const Text("Show success"),
            ),
          ],
        ),
      );
}

class _MessageSnackBars extends StatelessWidget {
  const _MessageSnackBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 400 ? 400.0 : null;
    return Center(
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
    );
  }
}
