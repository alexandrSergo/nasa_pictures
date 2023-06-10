part of 'nasa_pictures_bloc.dart';

abstract class NasaPicturesState extends Equatable {}

class NasaPicturesInitial extends NasaPicturesState {

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NasaPicturesLoading extends NasaPicturesState {

  @override
  List<Object?> get props => [];
}

class NasaPicturesLoaded extends NasaPicturesState {
  NasaPicturesLoaded(
    this.nasaList
  );
  final List<dynamic> nasaList;

  @override
  List<Object?> get props => [nasaList];
}

class NasaPicturesLoadingFailure extends NasaPicturesState {

  @override
  List<Object?> get props => [];
}
