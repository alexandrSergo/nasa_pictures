import 'package:nasa_app/viewer/view.dart';

class NasaApi {
  final dio = Dio();

  Future<List<NasaPicture>?> getNasaPictures() async {
    try {
      final response = await dio.get(
        Constants.nasaAPICall,
        queryParameters: {
          "keywords": "galaxy",
          "media_type": "image",
          "year_start": 2015
        },
      );
      if (response.statusCode == 200) {
        
        final List res = (NasaPicture.getJsonList(response.data)).map((v) {
          return NasaPicture.fromJson(v);
        }).toList();

        res.shuffle();
        return List<NasaPicture>.from(res);
      } else {
        return null;
      }
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    }
    return null;
  }
}