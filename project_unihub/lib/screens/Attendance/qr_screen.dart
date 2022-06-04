import 'package:flutter/material.dart';
import 'package:project_unihub/screens/Attendance/qr_generate_screen.dart';
import 'package:project_unihub/screens/Attendance/qr_scan_screen.dart';

class QrReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Code Scanner',
      theme: ThemeData.dark(),
      home: QrScreen(),
    );
  }
}

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrGenerateScreen())),
              child: Text("Qr Code Generator"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepOrange[700]),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrScanScreen())),
              child: Text("Qr Code Scanner"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepOrange[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
