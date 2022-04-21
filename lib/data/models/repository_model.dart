// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/repository.dart';

class RepositoryModel extends Repository {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RepositoryModel({
    required this.id,
    required this.name,
    required this.fullName,
    this.description = '',
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
          id: id,
          name: name,
          fullName: fullName,
          url: url,
          createdAt: createdAt,
          updatedAt: updatedAt,
          description: description,
        );

  @override
  List<Object?> get props => [id, name, fullName, url];

  factory RepositoryModel.fromJSON(Map<String, dynamic> json) =>
      RepositoryModel(
        id: json['id'],
        name: '${json['name']}',
        fullName: '${json['full_name']}',
        url: '${json['html_url']}',
        description: '${json['description']}',
        createdAt: DateTime.parse('${json['created_at']}'),
        updatedAt: DateTime.parse('${json['updated_at']}'),
      );
}
