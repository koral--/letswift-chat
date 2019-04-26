import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(FlutterPubApp());

class FlutterPubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale("en"), Locale("ar")],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter pub app"),
      ),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.0),
              child: Text("Test start"),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 20.0),
              child: Text("Test end"),
            ),
          ),
        ],
      )
    );
  }

}
