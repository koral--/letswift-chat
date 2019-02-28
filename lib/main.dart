import 'package:flutter/material.dart';

void main() => runApp(LetSwiftChatApp());

class LetSwiftChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LetSwift Chat"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  child: _messages[index],
                  key: Key(_messages[index]._message),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      _messages.removeAt(index);
                    });
                  },
                );
              },
              itemCount: _messages.length,
              reverse: true,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Theme.of(context).primaryColor,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Send message"),
              onSubmitted: (String text) {
                final animationController = AnimationController(
                    vsync: this, duration: Duration(seconds: 1));
                final chatMessage = ChatMessage(text, animationController);
                setState(() {
                  _messages.insert(0, chatMessage);
                });
                animationController.forward();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messages.forEach((ChatMessage chatMessage) {
      chatMessage._animationController.dispose();
    });
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String _message;
  final AnimationController _animationController;

  ChatMessage(this._message, this._animationController);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircleAvatar(
              child: const Text("K"),
            ),
          ),
          Text(_message),
        ],
      ),
      sizeFactor:
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }
}
