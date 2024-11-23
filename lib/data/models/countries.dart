import 'package:nebot/domain/entities/countries.dart';

class CountryModel {
  final int id;
  final String name;
  final String image;

  CountryModel({required this.id,required this.name,required this.image});

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] ,
      image: map['image'] ,
      id: map['id'] ,

    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }

}
extension CountryXModel on CountryModel{
  CountryEntity toEntity(){
    return CountryEntity(
      id: id,
      image: image,
      name: name
    );
  }
}