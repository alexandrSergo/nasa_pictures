part of 'nasa_pictures_bloc.dart';

abstract class NasaPicturesEvent extends Equatable {}

class LoadNasaPictures extends NasaPicturesEvent {
  LoadNasaPictures(this.completer);

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class SearchNasaPictures extends NasaPicturesEvent {
  SearchNasaPictures(this.query, this.nasaList);

  final String query;
  final List<dynamic> nasaList;

  @override
  List<Object?> get props => [query];

}
