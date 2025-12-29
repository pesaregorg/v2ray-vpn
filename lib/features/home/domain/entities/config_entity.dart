class ConfigEntity {
  final int id;
  final String text;
  final String address;
  final String url;
  final String remark;
  final bool selected;
  final int? ping;

  ConfigEntity({
    required this.id,
    required this.text,
    required this.address,
    required this.remark,
    required this.selected,
    required this.url,
    this.ping
  });

  ConfigEntity copyWith({
    int? id,
    String? text,
    String? address,
    String? remark,
    bool? selected,
    String? url,
    int? ping,

  }) {
    return ConfigEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      address: address ?? this.address,
      remark: remark ?? this.remark,
      selected: selected ?? this.selected,
      url: url ?? this.url,
      ping: ping ?? this.ping
    );
  }
}