import 'package:flutter/cupertino.dart';
import 'package:nasa_app/viewer/view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NasaPicturesBloc bloc = NasaPicturesBloc();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(LoadNasaPictures(null));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                        physics: const BouncingScrollPhysics(),
                        child: Column( 
                          children: List.generate(dataList.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NasaPictureWidget(nasaPicture: dataList[index],)
                              ],
                            );
                          }),
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
              Positioned(
                top: 4,
                right: 20,
                left: 70,
                child: SizedBox(
                  height: 60,
                  child: BlocBuilder<NasaPicturesBloc, NasaPicturesState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return Visibility(
                        visible: state is NasaPicturesLoaded ? true : false,
                        child: CupertinoSearchTextField(
                          controller: controller,
                          style: const TextStyle(color: Colors.white70),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                          itemSize: 22,
                          placeholder: 'Search',
                          onChanged: (String value) {
                            if ((state is NasaPicturesLoaded) && (value.isNotEmpty)) {
                              bloc.add(SearchNasaPictures(value, state.nasaList));
                            } else {
                              bloc.add(LoadNasaPictures(null));
                            }
                          },
                        ),
                      );
                    }, 
                  ),
                )
              ),
            ], 
          ),
        )
      )
    );
  }
}