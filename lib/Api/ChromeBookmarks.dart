import 'package:chrom_ext/model/Recent.dart';
import 'package:chrom_ext/model/Tree.dart';
import 'package:chrom_ext/util/ChromeCompleter.dart';
import 'package:chrom_ext/util/Converter.dart';
import 'package:js/js_util.dart';

/**
 * Accessor for the `chrome.bookmarks` namespace.
 */
final ChromeBookmarks chromebookmarks = new ChromeBookmarks();

class ChromeBookmarks extends ChromeApi {
  @override
  // TODO: implement available
  bool get available => _bookmarks != null;

  JsObject get _bookmarks => chrome['bookmarks'];

  int get MAX_WRITE_OPERATIONS_PER_HOUR =>
      _bookmarks['MAX_WRITE_OPERATIONS_PER_HOUR'];

  int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE =>
      _bookmarks['MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE'];

  Future<List<Recent>> getRecent(int numberOfItems) {
    if (_bookmarks == null) _throwNotAvailable();
    Converter<Recent> converter = new Converter<Recent>(Recent.fromJsons);

    var completer = new Completer<List<Recent>>();
    var callback = (e) {
      List<Recent> data = [];
      try {
        var list = stringfy(e);

        completer.complete(converter.getList(list));
      } catch (e) {
        print(e);

        completer.complete(data);
      }
    };
    _bookmarks.callMethod('getRecent', [numberOfItems, callback]);
    return completer.future;
  }

  Future<List<Tree>> getTree() {
    if (_bookmarks == null) _throwNotAvailable();
    Converter<Tree> converter = Converter<Tree>(Tree.fromJsons);

    var completer = new Completer<List<Tree>>();
    var callback = (e) {
      List<Tree> data = [];
      try {
        var list = stringfy(e);
        //   List<Tree> data = [];
        //   list.forEach((element) {
        //     data.add(Tree.fromJson(element));
        //   });
        completer.complete(data = converter.getList(list)!);
      } catch (e) {
        print(e);

        completer.complete(data);
      }
    };
    _bookmarks.callMethod('getTree', [callback]);
    return completer.future;
  }

  Future<List<BookmarkTreeNode>> getRecents(int numberOfItems) {
    if (_bookmarks == null) _throwNotAvailable();

    _bookmarks.callMethod('getRecent', [numberOfItems]);
    return promiseToFuture(_bookmarks.callMethod('getRecent', [numberOfItems]));
  }

  Future<List<BookmarkTreeNode>> getRecentsp(int numberOfItems, callback) {
    if (_bookmarks == null) _throwNotAvailable();

    _bookmarks.callMethod('getRecent', [numberOfItems]);
    return promiseToFuture(
        _bookmarks.callMethod('getRecent', [numberOfItems, callback]));
  }
}

void _throwNotAvailable() {
  throw new UnsupportedError("'chrome.browsingData' is not available");
}

BookmarkTreeNodeUnmodifiable _createBookmarkTreeNodeUnmodifiable(
        String value) =>
    BookmarkTreeNodeUnmodifiable.VALUES
        .singleWhere((ChromeEnum e) => e.value == value);

class BookmarkTreeNode extends ChromeObject {
  BookmarkTreeNode(
      {String? id,
      String? parentId,
      int? index,
      String? url,
      String? title,
      var dateAdded,
      var dateGroupModified,
      BookmarkTreeNodeUnmodifiable? unmodifiable,
      List<BookmarkTreeNode>? children}) {
    if (id != null) this.id = id;
    if (parentId != null) this.parentId = parentId;
    if (index != null) this.index = index;
    if (url != null) this.url = url;
    if (title != null) this.title = title;
    if (dateAdded != null) this.dateAdded = dateAdded;
    if (dateGroupModified != null) this.dateGroupModified = dateGroupModified;
    if (unmodifiable != null) this.unmodifiable = unmodifiable;
    if (children != null) this.children = children;
  }

  BookmarkTreeNode.fromProxy(JsObject jsProxy) : super.fromProxy(jsProxy);

  /**
   * The unique identifier for the node. IDs are unique within the current
   * profile, and they remain valid even after the browser is restarted.
   */
  String get id => jsProxy['id'];

  set id(String value) => jsProxy['id'] = value;

  /**
   * The `id` of the parent folder.  Omitted for the root node.
   */
  String get parentId => jsProxy['parentId'];

  set parentId(String value) => jsProxy['parentId'] = value;

  /**
   * The 0-based position of this node within its parent folder.
   */
  int get index => jsProxy['index'];

  set index(int value) => jsProxy['index'] = value;

  /**
   * The URL navigated to when a user clicks the bookmark. Omitted for folders.
   */
  String get url => jsProxy['url'];

  set url(String value) => jsProxy['url'] = value;

  /**
   * The text displayed for the node.
   */
  String get title => jsProxy['title'];

  set title(String value) => jsProxy['title'] = value;

  /**
   * When this node was created, in milliseconds since the epoch (`new
   * Date(dateAdded)`).
   */
  dynamic get dateAdded => jsProxy['dateAdded'];

  set dateAdded(var value) => jsProxy['dateAdded'] = jsify(value);

  /**
   * When the contents of this folder last changed, in milliseconds since the
   * epoch.
   */
  dynamic get dateGroupModified => jsProxy['dateGroupModified'];

  set dateGroupModified(var value) =>
      jsProxy['dateGroupModified'] = jsify(value);

  /**
   * Indicates the reason why this node is unmodifiable. The [managed] value
   * indicates that this node was configured by the system administrator or by
   * the custodian of a supervised user. Omitted if the node can be modified by
   * the user and the extension (default).
   */
  BookmarkTreeNodeUnmodifiable get unmodifiable =>
      _createBookmarkTreeNodeUnmodifiable(jsProxy['unmodifiable']);

  set unmodifiable(BookmarkTreeNodeUnmodifiable value) =>
      jsProxy['unmodifiable'] = jsify(value);

  /**
   * An ordered list of children of this node.
   */
  List<BookmarkTreeNode> get children =>
      listify(jsProxy['children'], _createBookmarkTreeNode)
          as List<BookmarkTreeNode>;

  set children(List<BookmarkTreeNode> value) =>
      jsProxy['children'] = jsify(value);
}

class BookmarkTreeNodeUnmodifiable extends ChromeEnum {
  static const BookmarkTreeNodeUnmodifiable MANAGED =
      const BookmarkTreeNodeUnmodifiable._('managed');

  static const List<BookmarkTreeNodeUnmodifiable> VALUES = const [MANAGED];

  const BookmarkTreeNodeUnmodifiable._(String str) : super(str);
}

BookmarkTreeNode? _createBookmarkTreeNode(JsObject jsProxy) =>
    jsProxy == null ? null : new BookmarkTreeNode.fromProxy(jsProxy);
