import 'package:nasa_app/viewer/view.dart';

class Constants {
  static const String nasaAPICall = 'https://images-api.nasa.gov/search';

  static const BoxDecoration kBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/initial_background.jpg"),
      fit: BoxFit.cover,
    ),
  );
}

