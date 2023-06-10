//import 'package:flutter/cupertino.dart';s
import 'package:nasa_app/viewer/view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NasaPicturesBloc bloc = NasaPicturesBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(LoadNasaPictures(null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: Constants.kBackgroundDecoration,
          child: Stack(
            children: [
              RefreshIndicator(
                color: Colors.white,
                backgroundColor: Colors.white12,
                onRefresh: () async {
                  final completer = Completer();
                  bloc.add(LoadNasaPictures(completer));
                  return completer.future;
                },
                child: BlocBuilder<NasaPicturesBloc, NasaPicturesState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is NasaPicturesLoaded) {
                      final dataList = state.nasaList;
                      return SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column( 
                            children: List.generate(dataList.length, (index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NasaPictureWidget(nasaPicture: dataList[index],)
                                ],
                              );
                            }),
                          ),
                        )
                      );
                    }
                    if (state is NasaPicturesLoadingFailure) {
                      return const ConnectionErrorWidget();
                    }
                    return const LoadingWidget();
                  },
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
                )
              ),
              // Positioned(
              //   top: 70,
              //   right: 20,
              //   left: 20,
              //   child: SizedBox(
              //     height: 60,
              //     child: CupertinoSearchTextField(
              //       controller: controller,
              //       style: const TextStyle(color: Colors.white70),
              //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              //       itemSize: 22,
              //       placeholder: 'Search',
              //       onChanged: (String value) {
                      
              //       },
              //     ),
              //   )
              // ),
            ], 
          ),
        )
      )
    );
  }
}