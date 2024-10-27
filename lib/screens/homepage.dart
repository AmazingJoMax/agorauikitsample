import 'package:agorauikit/screens/call_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _channelController = TextEditingController();
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call App'),
      ),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(padding: const EdgeInsets.all(10.0), child: TextFormField(
          controller: _channelController,
          decoration: InputDecoration(
            labelText: 'Channel Name',
            hintText: 'testcall',
            errorText: isError ? 'Channel name is mandatory' : null,
            border: const OutlineInputBorder()
          ),
         ),),
          ElevatedButton(
            onPressed: () {
              if (_channelController.text.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(channelName: _channelController.text)));
              }else{
                setState(() {
                  isError = true;
                });
              }
            },
            child: const Text('Join Call'),
          )
        ],
      )),
    );
  }
}