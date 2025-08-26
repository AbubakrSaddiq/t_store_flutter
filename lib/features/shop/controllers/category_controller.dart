import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading =false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;
      //   fetch categories from any data source (firebase, api)
      final categories = await _categoryRepository.getAllCategories();

      //   update the category list
      allCategories.assignAll(categories);

      //   filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      StoreLoaders.errorSnackBar(title: 'Oh Snap it!', message: e.toString());
    } finally {
      //   remove loader
      isLoading.value = false;
    }
  }

  ///load selected category data
  ///get category or sub-category products
}
