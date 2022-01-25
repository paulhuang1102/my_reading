import 'package:hive/hive.dart';

// Run build to generate
part 'book_model.g.dart';


@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  final String name;
  
  @HiveField(1)
  final String userId;

  Book({
    required this.name,
    required this.userId,
  });
}
