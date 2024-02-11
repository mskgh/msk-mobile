import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  void _addMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isSender: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: size * 0.02),
              SizedBox(
                height: 75,
                child: Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundColor: const Color(0xFFECE7FF),
                        child: Image.asset(
                          "assets/images/msklogo.png",
                        ),
                      ),
                      title: const Text('MyStoreKeeper'),
                      subtitle: const Text('Active Now')),
                ),
              ),
              SizedBox(height: size * 0.01),
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _messages[index];
                  },
                ),
              ),
              const Divider(height: 2.0),
              _InputField(addMessage: _addMessage),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
          alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(15),
                    topLeft: const Radius.circular(15),
                    bottomLeft: isSender
                        ? const Radius.circular(0)
                        : const Radius.circular(15),
                    bottomRight: isSender
                        ? const Radius.circular(15)
                        : const Radius.circular(0),
                  ),
                  color: isSender ? Colors.grey : Color(0xFF1D4771)),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu-Regular',
                      fontWeight: FontWeight.w300,
                      color: Colors.white)))),
    );
  }
}

class _InputField extends StatefulWidget {
  final Function(String) addMessage;

  const _InputField({required this.addMessage});

  @override
  __InputFieldState createState() => __InputFieldState();
}

class __InputFieldState extends State<_InputField> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      widget.addMessage(text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(hintText: 'message'),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF1D4771),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }
}
