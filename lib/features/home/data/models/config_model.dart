import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';

part 'config_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfigModel extends Equatable{
  @JsonKey(required: true)
  final int id;
  @JsonKey(required: true)
  final String text;
  @JsonKey(required: true)
  final String url;
  @JsonKey(required: true)
  final String address;
  @JsonKey(required: true)
  final String remark;
  @JsonKey(required: true)
  final int selected;

  const ConfigModel({
    required this.id,
    required this.url,
    required this.address,
    required this.remark,
    required this.selected,
    required this.text
  });


  ConfigModel copyWith({
    String? text,
    String? url,
    String? address,
    String? remark,
    int? selected,
    int? id
  }) {
    return ConfigModel(
      id: id ?? this.id,
      text: text ?? this.text,
      url: url ?? this.url,
      address: address ?? this.address,
      remark: remark ?? this.remark,
      selected: selected ?? this.selected
    );
  }




  @override
  List<Object?> get props => [id, text, url, address, remark, selected];



  factory ConfigModel.fromEntity(ConfigEntity entity) {
    return ConfigModel(
      id: entity.id,
      text: entity.text,
      url: entity.url,
      address: entity.address,
      remark: entity.remark,
      selected: entity.selected ? 1 : 0
    );
  }

  ConfigEntity toEntity() {
    return ConfigEntity(
      id: id,
      text: text,
      url: url,
      address: address,
      remark: remark,
      selected: selected == 1 ? true : false
    );
  }

  factory ConfigModel.fromJson(Map<String, dynamic> json) => _$ConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigModelToJson(this);




}