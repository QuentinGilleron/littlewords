// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_word.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneWordDTO _$OneWordsDTOFromJson(Map<String, dynamic> json) => OneWordDTO(
      json['data'] == null
          ? null
          : WordDTO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OneWordsDTOToJson(OneWordDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
