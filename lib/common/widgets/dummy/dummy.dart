import 'package:ebuy/features/shop/models/category_model.dart';
import 'package:ebuy/utils/constants/image_strings.dart';

class EDummyData{
  ///List of all Categories
  static final List<CategoryModel> categories =[
    //Category
    CategoryModel(id: '1', name: EImages.sport, image: 'Sport', isFeatured: true),
    CategoryModel(id: '2', name: EImages.furniture, image: 'Furniture', isFeatured: true),
    CategoryModel(id: '3', name: EImages.electronics, image: 'Electronics', isFeatured: true),
    CategoryModel(id: '4', name: EImages.cloth, image: 'Cloth', isFeatured: true),
    CategoryModel(id: '5', name: EImages.animal, image: 'Animal', isFeatured: true),
    CategoryModel(id: '6', name: EImages.shoe, image: 'Shoe', isFeatured: true),
    CategoryModel(id: '7', name: EImages.cosmetics, image: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', name: EImages.jewelery, image: 'Jewelry', isFeatured: true),

    //Subcategories
    CategoryModel(id: '8', name: EImages.sport, image: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', name: EImages.sport, image: 'Sport Suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', name: EImages.sport, image: 'Sport Equipments', parentId: '1',  isFeatured: false),

    CategoryModel(id: '11', name: EImages.sport, image: 'Bedroom Furniture', parentId: '2', isFeatured: false),
    CategoryModel(id: '12', name: EImages.sport, image: 'Kitchen Furniture', parentId: '2', isFeatured: false),
    CategoryModel(id: '13', name: EImages.sport, image: 'Office Furniture', parentId: '2',  isFeatured: false),

    CategoryModel(id: '14', name: EImages.sport, image: 'Kitchen Electronic', parentId: '3', isFeatured: false),
    CategoryModel(id: '15', name: EImages.sport, image: 'Tinny Electronic', parentId: '3', isFeatured: false),
    CategoryModel(id: '16', name: EImages.sport, image: 'Large Electronic', parentId: '3',  isFeatured: false),
  ];
}