import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lion_tax/mainTree.dart';
import 'package:lion_tax/Widgets/lionTaxButton.dart';

void main() {
  runApp(LionTaxApp());
}

class LionTaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'LionTax App',
      debugShowCheckedModeBanner: false,
      routes: {'mainTree': (context) => MainTree()},
      home: Home(),
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor: const Color(0xffC77054),
        primaryColor: const Color(0xffC77054),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, data) => Column(
          children: [
            Container(
              width: data.maxWidth,
              height: data.maxHeight * 0.35,
              child: LayoutBuilder(
                builder: (ctx, data) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: data.maxHeight * 0.2),
                      child: Text(
                        'From ViniCODE',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: data.maxWidth,
              height: data.maxHeight * 0.65,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      child: Image.asset('assets/images/liontax logo2.png'),
                    ),
                    LionTaxButton(
                      txt: 'COMEÇAR',
                      fn: () => Navigator.pushNamed(context, 'mainTree'),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
