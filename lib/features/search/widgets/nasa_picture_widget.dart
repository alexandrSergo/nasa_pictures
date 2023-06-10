import 'package:nasa_app/viewer/view.dart';

class NasaPictureWidget extends StatelessWidget {
  const NasaPictureWidget({super.key, required this.nasaPicture});
  final NasaPicture nasaPicture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      //height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 400,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(nasaPicture.url).image,
                  fit: BoxFit.cover,
                )
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(nasaPicture.title, style: const TextStyle(fontSize: 15, color: Colors.white54), textAlign: TextAlign.center,)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}