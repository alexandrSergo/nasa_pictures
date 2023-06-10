import 'package:nasa_app/viewer/view.dart';

class ConnectionErrorWidget extends StatelessWidget {
  const ConnectionErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('404', textAlign: TextAlign.center,),
    );
  }
}