import 'package:equatable/equatable.dart';

class LicenseResponse extends Equatable {
  final String key;
  final String name;
  final String spdxId;
  final String url;
  final String nodeId;

  const LicenseResponse({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory LicenseResponse.fromJson(Map<String, dynamic> json) {
    return LicenseResponse(
      key: json['key'] as String,
      name: json['name'] as String,
      spdxId: json['spdx_id'] as String,
      url: json['url'] as String,
      nodeId: json['node_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url,
      'node_id': nodeId,
    };
  }

  @override
  List<Object> get props => [key, name, spdxId, url, nodeId];
}
