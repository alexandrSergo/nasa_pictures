import 'package:nasa_app/viewer/view.dart';

class TextBlock extends StatelessWidget {
  const TextBlock({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: <Color>[
            const Color.fromARGB(249, 22, 22, 22).withOpacity(0.55),
            const Color.fromARGB(248, 53, 53, 53).withOpacity(0.45),
            const Color.fromARGB(248, 36, 36, 36).withOpacity(0.35),
          ]
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.white70), textAlign: TextAlign.center,)),
    );
  }
}