import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerateScreen extends StatefulWidget {
  const QrGenerateScreen({Key? key}) : super(key: key);

  @override
  _QrGenerateScreenState createState() => _QrGenerateScreenState();
}

class _QrGenerateScreenState extends State<QrGenerateScreen> {
  String data = "https://docs.google.com/forms/d/e/1FAIpQLSeKxIKhl56vK9iwYASZYhky3Oa_VezzrxTH1O5Z0xPAjuNifA/viewform?usp=sf_link";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Color(0xFFFF5722), title: Text("Qr Code Generator"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: QrImage(
            data: data,
            version: QrVersions.auto,
            backgroundColor: Colors.black,
            foregroundColor: Colors.deepOrange,
            size: 300,
            padding: EdgeInsets.all(10),
            gapless: true,
            errorStateBuilder: (context, error) => Text("Error"),
            errorCorrectionLevel: QrErrorCorrectLevel.L,
            constrainErrorBounds: true,
            dataModuleStyle: QrDataModuleStyle(
              color: Colors.black,
              dataModuleShape: QrDataModuleShape.circle,
            ),
            eyeStyle: QrEyeStyle(
              color: Colors.black,
              eyeShape: QrEyeShape.circle,
            ),
            embeddedImage: AssetImage("assets/flutter_logo.png"),
            embeddedImageStyle: QrEmbeddedImageStyle(

              size: Size(50, 50),
            ),
            embeddedImageEmitsError: false,
            semanticsLabel: "Qr Code",
          ),
        ),
      ),
    );
  }
}
