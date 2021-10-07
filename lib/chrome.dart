@JS() // sets the context, in this case being `window`
library chrome; // required library declaration

import 'package:js/js.dart'; // Pull in our dependency

// @JS('chrome.loadTimes') // annotates `log` function to call `console.log`
// external String loadTimes();

@JS('chrome.loadTimes.commitLoadTime') // annotates `log` function to call `console.log`
external String commitLoadTime();

@JS('chrome.bookmarks.MAX_WRITE_OPERATIONS_PER_HOUR') // annotates `log` function to call `console.log`
external num get MAX_WRITE_OPERATIONS_PER_HOUR;

@JS('chrome.loadTimes')
class loadTimes {
  external int get commitLoadTime;
}

@JS('chrome.bookmarks.getRecent')
external dynamic getRecent(num index);

@JS('window.books')
external dynamic book(num index);

@JS('chrome.bookmarks.getTree')
external dynamic getTree();

@JS('chrome.csi')
external dynamic csi();

@JS('chrome.bookmarks')
class bookmarks {
  @JS('chrome.bookmarks.getRecent')
  external dynamic getRecent(num index);

  external int get MAX_WRITE_OPERATIONS_PER_HOUR;
}

@JS('chrome.downloads.showDefaultFolder')
external showDefaultFolder();

@JS('chrome.downloads')
class downloads {
  external dynamic getRecent(num index);

  external showDefaultFolder();
}

@JS()
abstract class Recent {
  external num get dateAdded;

  external set dateAdded(num v);

  external String get id;

  external set id(String v);

  external num get index;

  external set index(num v);

  external String get parentId;

  external set parentId(String v);

  external set title(String v);

  external set url(String v);

  external String get title;

  external String get url;
}

@JS()
abstract class down {
  external String get aCCEPTED;

  external String get cONTENT;

  external String get fILE;

  external String get hOST;

  external String get sAFE;

  external String get uNCOMMON;

  external String get uNWANTED;

  external String get uRL;
}
