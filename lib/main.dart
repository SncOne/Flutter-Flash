import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 3),
                  builder: (_, c) {
                    return Flash.bar(
                      barrierDismissible: true,
                      controller: c,
                      backgroundColor: Colors.black87,
                      position: FlashPosition.bottom,
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.zero,
                      child: FlashBar(
                        title: const Text(
                          "Snackbar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        content: const Text(
                          "Snackbar Usage",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Snackbar Action'),
                          )
                        ],
                      ),
                      borderColor: Colors.purple,
                      brightness: Brightness.light,
                    );
                  },
                );
              },
              child: const Text('Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 3),
                  builder: (_, c) {
                    return Flash(
                      controller: c,
                      barrierDismissible: false,
                      alignment: const Alignment(0, 0.8),
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor: Colors.black87,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          "Toast Usage",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Toast Message'),
            ),
            ElevatedButton(
              onPressed: () {
                context.showFlashDialog(
                  persistent: true,
                  title: const Text('Dialog Title'),
                  content: const Text('Dialog Content'),
                  negativeActionBuilder: (context, controller, _) {
                    return TextButton(
                      onPressed: () {
                        controller.dismiss();
                      },
                      child: const Text('No'),
                    );
                  },
                  positiveActionBuilder: (context, controller, _) {
                    return TextButton(
                        onPressed: () {
                          controller.dismiss();
                        },
                        child: const Text('Yes'));
                  },
                );
              },
              child: const Text('Dialog Message'),
            ),
          ],
        ),
      ),
    );
  }
}
