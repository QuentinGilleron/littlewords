// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_word.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneWordsDTO _$OneWordsDTOFromJson(Map<String, dynamic> json) => OneWordsDTO(
      json['data'] == null
          ? null
          : WordDTO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OneWordsDTOToJson(OneWordsDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
