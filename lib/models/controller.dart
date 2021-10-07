import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:watch/models/categoryModel.dart';



class AppController extends Model{
  
  List<CategoryModel> allCategories = [];


  getData() async {


    http.Response _response = await http.get(Uri.parse('https://watches-f54ef-default-rtdb.firebaseio.com/categories.json'));

    Map<String, dynamic> _data = json.decode(_response.body);

    _data.forEach((k, v) {
      CategoryModel _newCategory = CategoryModel(k, v['categoryName'], v['categoryImage'], []);
      allCategories.add(_newCategory);
    });

    notifyListeners();
  }
}



// ScopedModel StateManagment Approach => package used to write state managment
// StateManagment => abilty to share data between screens & notify any listeners on changes


// ScopedModel Approach Includ 3 Classes:
    // Model => class that controller inherit from to ability to shar and listen on data 
    // ScopedModel => class to be on the top of app tree
    // ScopedModelDecendendt => class to be as a parent for the widget that needs to share and listen on data