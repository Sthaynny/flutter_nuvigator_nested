import 'package:flutter/material.dart';
import 'package:flutter_nuvigator_nested/flows/first/route.dart';
import 'package:flutter_nuvigator_nested/flows/second/route.dart';
import 'package:nuvigator/next.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Nuvigator.routes(
        initialRoute: 'home',
        screenType: materialScreenType,
        routes: [
          HomeRoute(),
          FirstFlowRoute(),
          SecondFlowRoute(),
        ],
      ),
    );
  }
}

class HomeRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings settings) {
    final nuvigator = Nuvigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Toque no botão para mudar de página',
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Primeiro fluxo'),
              onPressed: () => nuvigator.open('first-flow'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text('Segundo fluxo'),
                onPressed: () => nuvigator.open('second-flow')),
          ],
        ),
      ),
    );
  }

  @override
  String get path => 'home';

  @override
  ScreenType get screenType => materialScreenType;
}
