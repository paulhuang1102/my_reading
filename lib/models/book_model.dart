import 'package:hive/hive.dart';

// Run build to generate
part 'book_model.g.dart';


@HiveType(typeId: 0)
class Book extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String userId;

  Book({
    required this.id,
    required this.name,
    required this.userId,
  });
}
