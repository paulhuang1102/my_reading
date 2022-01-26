import 'package:hive/hive.dart';

// Run build to generate
part 'vocabulary_model.g.dart';


@HiveType(typeId: 1)
class Vocabulary {
  @HiveField(0)
  final String word;
  
  @HiveField(1)
  final String bookId;

  Vocabulary({
    required this.word,
    required this.bookId,
  });
}
