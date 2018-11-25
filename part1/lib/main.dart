import 'package:flutter/material.dart';

const String _name = "Dilum";

void main() => runApp(new FriendlychatApp());

class FriendlychatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Friendly Chat",
      home: new ChatScreen(),
    );
  }
  
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();

  Widget _buildTextComposer()=> new IconTheme(                                            //new
      data: new IconThemeData(color: Colors.deepOrange), //new
      child: new Container(                                     //modified
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                    hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textEditingController.text)),
            ),
          ],
        ),
      ),                                                             //new
    );

  //this method will fire when user clicks on the submit button of the textField
  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Friendlychat"),
          backgroundColor: Colors.deepOrange,
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
              ),
          ),

          new Divider(height: 2.0,),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),


    );
  }
}

class ChatMessage extends StatelessWidget{
  ChatMessage({this.text});
  final String text;

  @override
  Widget build(BuildContext context) => new Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: new CircleAvatar(
            child: new Text(_name[0]),
          ),
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        )
      ],
    ),
  );

}


