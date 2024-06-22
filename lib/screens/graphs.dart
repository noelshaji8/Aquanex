import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Graphs extends StatefulWidget {
  const Graphs({super.key});

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  final controllertemp = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'https://thingspeak.com/channels/2336234/charts/1?width=auto&height=auto&color=000000&bgcolor=ffffff&dynamic=true&results=1500&type=line&update=15&yaxismax=35&yaxismin=15'));

  final controllerph = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'https://thingspeak.com/channels/2336234/charts/2?color=000000&bgcolor=ffffff&height=auto&width=auto&dynamic=true&results=1500&type=line&update=15&yaxismax=14&yaxismin=0'));

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 1);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        color: Colors.black,
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                height: screenHeight,
                width: screenWidth * 1.72,
                child: PageView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  children: [
                    WebViewWidget(controller: controllerph),
                    WebViewWidget(controller: controllertemp)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
