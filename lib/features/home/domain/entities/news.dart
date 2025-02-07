import 'package:equatable/equatable.dart';
import 'package:headspace_test/features/home/domain/entities/source.dart';





class NewsEntity extends Equatable{
  final String? author;
  final String? title;
  final  String? description;
  final  String? url;
  final  String? urlToImage;
  final  String? publishedAt;
  final  String? content;
  final SourceEntity? source;

const  NewsEntity(
      {this.author,
        this.title,
        this.source,
        this.description,
        this.url,
         this.urlToImage,
        this.publishedAt,
        this.content});



  @override
  List<Object?> get props => [author,title,description,url,urlToImage,publishedAt,content, source];
}