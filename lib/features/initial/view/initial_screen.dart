import 'package:nasa_app/features/search/view/search_screen.dart';
import 'package:nasa_app/viewer/view.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: Constants.kBackgroundDecoration,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InitialButton(text: 'Search', onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen(),));
                    })
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextBlock(text: 'Harness the secrets of the universe with NASA')
                  ],
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}