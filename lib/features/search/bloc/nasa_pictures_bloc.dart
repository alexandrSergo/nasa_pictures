import 'package:nasa_app/viewer/view.dart';

part 'nasa_pictures_event.dart';
part 'nasa_pictures_state.dart';

class NasaPicturesBloc extends Bloc<NasaPicturesEvent, NasaPicturesState> {
  NasaPicturesBloc(this.api) : super(NasaPicturesInitial()) {
    on<LoadNasaPictures>(_loadNasaPictures, transformer: droppable());
    on<SearchNasaPictures>(_searchNasaPictures, transformer: sequential());
  }

  final NasaApi api;

  Future<void> _loadNasaPictures(LoadNasaPictures event, Emitter<NasaPicturesState> emit) async {
    final List<NasaPicture>? nasaList = await api.getNasaPictures();
    if (nasaList != null) {
      emit(NasaPicturesLoaded(nasaList));
      event.completer?.complete(); //?
    } else {
      emit(NasaPicturesLoadingFailure());
    }
   }

   void _searchNasaPictures(SearchNasaPictures event, Emitter<NasaPicturesState> emit) {
    emit(NasaPicturesLoading());
    final List<NasaPicture> nasaList = event.nasaList;
    final String query = event.query;

    final newNasaList = nasaList.where((element) => (element.title.toLowerCase().trim()).contains(query.toLowerCase().trim())).toList();
    if (newNasaList.length > 3) {
      emit(NasaPicturesLoaded(newNasaList));
    }
   }
}
