import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class CallPage extends StatefulWidget {
  final String channelName;
  const CallPage({super.key, required this.channelName});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  AgoraClient? client;

  @override
  void initState() {
    initAgora(widget.channelName);
    super.initState();
  }

  void initAgora(String channelName) async {
    client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
            appId: '56e3156668634e27b1ca06c6782d627b',
            channelName: channelName,
            username: "user"));
    await client!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client!,
              layoutType: Layout.floating,
              enableHostControls: true,
            ),
            AgoraVideoButtons(
              client: client!,
              addScreenSharing: false,
            ),
          ],
        ),
      ),
    );
  }
}
