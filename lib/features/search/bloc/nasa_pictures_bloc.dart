import 'package:nasa_app/viewer/view.dart';

part 'nasa_pictures_event.dart';
part 'nasa_pictures_state.dart';

class NasaPicturesBloc extends Bloc<NasaPicturesEvent, NasaPicturesState> {
  NasaPicturesBloc() : super(NasaPicturesInitial()) {
    on<LoadNasaPictures>(_loadNasaPictures, transformer: droppable());
    on<SearchNasaPictures>(_searchNasaPictures, transformer: sequential());
  }

   Future<void> _loadNasaPictures(LoadNasaPictures event, Emitter<NasaPicturesState> emit) async {
    final nasaList = await NasaApi.getNasaPictures();
    if (nasaList != null) {
      emit(NasaPicturesLoaded(nasaList));
      event.completer?.complete(); //?
    } else {
      emit(NasaPicturesLoadingFailure());
    }
   }

   void _searchNasaPictures(SearchNasaPictures event, Emitter<NasaPicturesState> emit) {
    final List<dynamic> nasaList = event.nasaList;
    final String query = event.query;

    final newNasaList = nasaList.where((element) => (element.title.toLowerCase()).contains(query.toLowerCase())).toList();
    if (newNasaList.length > 3) {
      emit(NasaPicturesLoaded(newNasaList));
    }
   }
}
