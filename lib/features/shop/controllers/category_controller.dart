import 'package:ebuy/data/repositories/category_repository.dart';
import 'package:ebuy/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();


  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async{
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source(Firestore, API, etc).
      final categories = await _categoryRepository.getAllCategories();

      //update the categories list
      allCategories.assignAll(categories);

      //filter the feature categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch (e) {
        throw 'Error in category controller';
    }finally{
      isLoading.value = false;
    }
  }
}