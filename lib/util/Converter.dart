import 'package:chrom_ext/model/Recent.dart';

typedef fromJsons<T> = T Function(Map<String, dynamic> source);

class Converter<T extends Recent> {
  fromJsons<T> fromjson;

  var fromjsons;

  // fromJsons<T> fromjsons;

  List<T>? getList(List list) {
    List<T> data = [];
    list.forEach((element) {
      // Alert(element);
      data.add(fromjson(element));
    });
    return data;
  }

  Converter(this.fromjson);
}
