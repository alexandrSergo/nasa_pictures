import 'package:nasa_app/viewer/view.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(249, 22, 22, 22),
              Color.fromARGB(248, 53, 53, 53),
              Color.fromARGB(248, 36, 36, 36),
            ]
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 35, color: Colors.white54),)),
      ),
    );
  }
}