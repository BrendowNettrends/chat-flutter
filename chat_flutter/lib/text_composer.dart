import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);
  Function(String) sendMessage;
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  final TextEditingController _controller = TextEditingController();

  bool _isCompoosing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isCompoosing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {

            },
          ),
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
                onChanged: (text) {
                  setState(() {
                    _isCompoosing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text) {
                  widget.sendMessage(text);
                  _reset();
                },
              )
          ),
          IconButton(
              icon: Icon(Icons.send), color: Colors.green,
              onPressed: _isCompoosing ? () {
                widget.sendMessage(_controller.text);
                _reset();
              } : null
          ),
        ]
      ),
    );
  }
}
