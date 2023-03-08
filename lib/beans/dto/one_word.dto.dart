import 'package:json_annotation/json_annotation.dart';
import 'package:littlewords/beans/dto/word.dto.dart';

part 'one_word.dto.g.dart';


// Géneration du .g.dart avec la commande:
// flutter pub run build_runner build
@JsonSerializable()
class OneWordsDTO {
  OneWordsDTO(this.data);

  final WordDTO? data;

  Map<String, dynamic> toJson() => _$OneWordsDTOToJson(this);

  factory OneWordsDTO.fromJson(Map<String, dynamic> json) =>
      _$OneWordsDTOFromJson(json);
}
