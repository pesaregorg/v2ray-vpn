// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'text', 'url', 'address', 'remark', 'selected'],
  );
  return ConfigModel(
    id: json['id'] as String,
    url: json['url'] as String,
    address: json['address'] as String,
    remark: json['remark'] as String,
    selected: (json['selected'] as num).toInt(),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$ConfigModelToJson(ConfigModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'url': instance.url,
      'address': instance.address,
      'remark': instance.remark,
      'selected': instance.selected,
    };
