class ConfigEntity {
  final String id;
  final String text;
  final String address;
  final String url;
  final String remark;
  final bool selected;

  ConfigEntity({
    required this.id,
    required this.text,
    required this.address,
    required this.remark,
    required this.selected,
    required this.url
  });
}