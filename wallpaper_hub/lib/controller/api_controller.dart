import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/data/api_key.dart';
import 'dart:convert' as convert;

Future getTrendingWallpapers() async {
  var response = await http
      .get(Uri.parse("https://api.pexels.com/v1/curated?per_page=1"), headers: {
    "Authorization": APIKEY,
  });

  // print(response.body.toString());
  Map<String, dynamic> jsonData = convert.jsonDecode(response.body);
  jsonData['photos'].forEach((element) {
    print(element);
  });
}
