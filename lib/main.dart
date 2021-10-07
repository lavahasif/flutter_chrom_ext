import 'dart:convert';
import 'dart:js';
import 'dart:js_util';

import 'package:chrom_ext/Api/ChromeDownload.dart';
import 'package:chrom_ext/chrome.dart';
import 'package:chrom_ext/libs.dart';
import 'package:chrom_ext/model/Recent.dart' as d;
import 'package:chrom_ext/util/ChromeCompleter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Api/ChromeBookmarks.dart';

// JsObject get _bookmarks => chrome['bookmarks'];
Future<void> main() async {
  log(loadTimes().commitLoadTime);
  // log(commitLoadTime());
  Alert(chromebookmarks.MAX_WRITE_OPERATIONS_PER_HOUR);

  try {
    chromeDownloads.showDefaultFolder();
    Alert(chromeDownloads.DangerType!["ACCEPTED"]);
    var rec = await chromebookmarks.getRecent(2);
    var tree = await chromebookmarks.getTree();
    rec.forEach((element) {
      Alert('==>R${element.title}');
    });
    tree.forEach((element) {
      Alert('==>T${element.title}${element.dateAdded}');
    });

    // recent.forEach((element) {
    //   Alert(element);
    // });
  } catch (e) {
    print(e);
    Alert(e.toString());
  }
  // await Seperate();

  runApp(const MyApp());
}

Future<void> Seperate() async {
  // chromebookmarks.MAX_WRITE_OPERATIONS_PER_HOUR;
  // context.callMethod('alert', ['Hello from Dart!']);
  JsObject chrome = context['chrome'];
  var console = context['console'];
  var Json = context['JSON'];
  JsObject loadTime = chrome.callMethod("loadTimes");

  // getTree().then((value) {
  //   var bcc = Json.callMethod('stringify', []);
  //   context.callMethod('alert', [bcc]);
  // });

  // var bc = Json.callMethod('stringify', [name]);

  // d.Recent data = d.Recent.fromJson(name);
  // data.o!.forEach((element) {
  //   context.callMethod('alert', [element?.title]);
  // });
  try {
    showDefaultFolder();
    var bookmarks = chrome["bookmarks"];
    // var bc = await bookmarks.callMethod('getRecent', [1]);
    Alert(bookmarks["MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE"]);
    var bookmarks2 = (bookmarks as JsObject);

    var callMethod = bookmarks2.callMethod("getRecent", [1]);
    Alert(await promiseToFuture(callMethod));
    // var books = bookmarks();
    var bc = bookmarks2.callMethod("getTree");
    var name = await promiseToFuture(bc);
    // var name = await promiseToFuture(books.getRecent(2));
    // json.decode(bc);
    // Alert("=====>${json.encode(bc)}");
    // Alert("=====>${json.encode(name)}");
    // Alert("=====>${json.decode(bc)}");
    // Alert("=====>${JsObject.jsify(name[0])}");
    // Alert("=====>${json.encode(name[0])}");
    // Alert("=====>${JsonEncoder(name)}");
    // var cd = Json.callMethod('parse', [name]);

    var replaceAll =
        getdata(name).replaceAll('{"o":', "").replaceAll("]}", "]");
    List decode = json.decode(replaceAll);
    // Alert("=====>${decode}");
    // Alert("=====>${decode[0]}");
    // Alert("=====>${decode}");
    // Alert("=====>${d.Recent.fromJson(decode[0]).title}");
    decode.forEach((element) {
      // Alert("=====>${element.toString()}");
      Alert("=====>${d.Recent.fromJson(element).title}");
    });

    // Alert("=====>$cd}");
    // var o2 = (d.Recent.fromJson(cd));
    // Alert(json.decode(name));
    // Alert(o2);
    // Alert("===>${o2!.length}");
    // var recent = o2![0];
    // Alert(recent?.title);
  } catch (e) {
    context.callMethod('alert', [e.toString()]);
  }

  var csi2 = csi();
  // var Json = context['JSON'];
  var ty = Json.callMethod('stringify', [csi2]);
  var args = [ty];
  // context.callMethod('alert', args);

  // getTree().then((value) {
  //   var bcc = Json.callMethod('stringify', [value]);
  //   context.callMethod('alert', [bcc]);
  // });
  //
  // bc = Json.callMethod('stringify', [name]);
  // context.callMethod('alert', [bc]);
  // object["bk"]=object.callMethod('greet', ['JavaScript']);
  // bool s = object.hasProperty("commitLoadTime");
  // var c = object["commitLoadTime"];
  // JsObject cd = object.callMethod("loadTimes");
  // var ts = cd["commitLoadTime"];
  // print(ts);
  // context.callMethod('alert', [ts]);
  // object['greeting'] = 'Hello';
  // object['greet'] = (name) => "${object['greeting']} $name";
  // var message = object.callMethod('greet', ['JavaScript']);
  //
  // // var bk = bookmarks.callMethod('getRecent', ['1']);
  // // bookmarks.callMethod('log', [message]);
  // context.callMethod('chrome.downloads.showDefaultFolder');
  // showDefaultFolder();
  // var bookmarks2 = bookmarks();
  // var download = downloads();
  // download
  //     .showDefaultFolder(); // context.callMethod('alert', [MAX_WRITE_OPERATIONS_PER_HOUR]);
  // var recent = await bookmarks2.getRecent(1);
  // recent.then((value) => console.callMethod('log', [value]));
  // context.callMethod('alert', [recent]);

  // context.callMethod('alert', [bookmarks]);
  // context.callMethod('alert', [bk]);

  // chromebookmarks.MAX_WRITE_OPERATIONS_PER_HOUR;
  // context.callMethod('alert', ['Hello from Dart!']);

  // context.callMethod('alert', args);

  // getTree().then((value) {
  //   var bcc = Json.callMethod('stringify', [value]);
  //   context.callMethod('alert', [bcc]);
  // });
  //
  // bc = Json.callMethod('stringify', [name]);
  // context.callMethod('alert', [bc]);
  // object["bk"]=object.callMethod('greet', ['JavaScript']);
  // bool s = object.hasProperty("commitLoadTime");
  // var c = object["commitLoadTime"];
  // JsObject cd = object.callMethod("loadTimes");
  // var ts = cd["commitLoadTime"];
  // print(ts);
  // context.callMethod('alert', [ts]);
  // object['greeting'] = 'Hello';
  // object['greet'] = (name) => "${object['greeting']} $name";
  // var message = object.callMethod('greet', ['JavaScript']);
  //
  // // var bk = bookmarks.callMethod('getRecent', ['1']);
  // // bookmarks.callMethod('log', [message]);
  // context.callMethod('chrome.downloads.showDefaultFolder');
  // showDefaultFolder();
  // var bookmarks2 = bookmarks();
  // var download = downloads();
  // download
  //     .showDefaultFolder(); // context.callMethod('alert', [MAX_WRITE_OPERATIONS_PER_HOUR]);
  // var recent = await bookmarks2.getRecent(1);
  // recent.then((value) => console.callMethod('log', [value]));
  // context.callMethod('alert', [recent]);

  // context.callMethod('alert', [bookmarks]);
  // context.callMethod('alert', [bk]);
  // try {
  //   var recent = await chromebookmarks.getRecent(2);
  //   Alert(recent);
  //   recent.forEach((element) {
  //     Alert(element);
  //   });
  // } catch (e) {
  //   print(e);
  // }
  // var recent = await chromebookmarks.getRecentsp(2, (items) {
  //   var getdata2 = getdata(items);
  //   Alert(getdata2);
  //   List decode = json.decode(getdata2);
  //   decode.forEach((element) {
  //     Alert(d.Recent.fromJson(element).title);
  //   });
  //   Alert(json.decode(items));
  //   Alert(json.encode(items));
  // });
}

String getdata(value) {
  var Json = context['JSON'];
  return Json.callMethod('stringify', [value]);
}

void Alert(bc) {
  context.callMethod('alert', [bc]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
