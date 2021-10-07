import 'package:watch/models/watchModel.dart';



class CategoryModel{

  String id;
  String categoryName;
  String categoryImage;
  List<WatchModel> watches;

  CategoryModel(this.id, this.categoryName, this.categoryImage, this.watches);
}