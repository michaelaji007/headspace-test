import 'dart:convert';

import 'package:headspace_test/features/home/data/models/source_model.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/entities/source.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {super.author,
      super.title,
      super.description,
      super.url,
      super.urlToImage,
      super.publishedAt,
      super.content,
      super.source});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
    );
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
      source: map['source_id'] != null ? Source.fromMap({
        'source_id': map['source_id'],
        'source_name': map['source_name'],
      }) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,

      'source': source != null ? (source as Source).toJson() : null,
    };
  }

  Map<String, dynamic> toMap() {
    var map = {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };

    if (source != null) {
      map.addAll({
        'source_id': source!.id,
        'source_name': source!.name,
      });
    }

    return map;
  }
}
