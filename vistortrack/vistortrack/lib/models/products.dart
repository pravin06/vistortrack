import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<Product>> getBeers() async {
  final String url = 'https://api.punkapi.com/v2/beers';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  print(streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List)));
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Product.fromJSON(data));
}

class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;

  Product.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        tagline = jsonMap['tagline'],
        description = jsonMap['description'],
        image_url = jsonMap['image_url'];
}
