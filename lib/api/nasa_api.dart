import 'package:nasa_app/viewer/view.dart';

class NasaApi {
  
  static Future<List?> getNasaPictures() async {
    final dio = Dio();
    try {
      final response = await dio.get(  // Constants.nasaAPICall = https://images-api.nasa.gov/search
        Constants.nasaAPICall,
        queryParameters: {
          "keywords": "galaxy",
          "media_type": "image",
          "year_start": 2015
        },
      );
      if (response.statusCode == 200) {
        
        final List res = (response.data["collection"]["items"]).map((v) {
          final String url = v["links"][0]["href"];
          final String title = v["data"][0]["title"];
          return NasaPicture(url: url, title: title);
        }).toList();

        res.shuffle();
        return res;
      } else {
        return null;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }

  
}