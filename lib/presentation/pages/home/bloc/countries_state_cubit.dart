import 'package:nebot/domain/entities/countries.dart';

abstract class CountriesDisplayState{}

class CountriesLoading extends CountriesDisplayState{}

class CountriesLoaded extends CountriesDisplayState {
  final List<CountryEntity> countryEntities;

  CountriesLoaded({required this.countryEntities});
}


class CountriesLoadedFailure extends CountriesDisplayState{
  final String errorMessage;
  CountriesLoadedFailure({required this.errorMessage});
}