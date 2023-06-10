import 'package:nasa_app/viewer/view.dart';

part 'nasa_pictures_event.dart';
part 'nasa_pictures_state.dart';

class NasaPicturesBloc extends Bloc<NasaPicturesEvent, NasaPicturesState> {
  NasaPicturesBloc() : super(NasaPicturesInitial()) {
    on<LoadNasaPictures>(_loadNasaPictures);
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
}
