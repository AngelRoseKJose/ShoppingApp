import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Dimensions {

  @JsonKey(name: 'width')
  final double width;
   @JsonKey(name: 'height')
  final double height;
   @JsonKey(name: 'depth')
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return _$DimensionsFromJson(json);
  }
}

@JsonSerializable()
class Review {
  @JsonKey(name: 'rating')
  final int rating;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'reviewerName')
  final String reviewerName;
  @JsonKey(name: 'reviewerEmail')
  final String reviewerEmail;

  Review(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});

  factory Review.fromJson(Map<String, dynamic> json) {
    return _$ReviewFromJson(json);
  }
}

@JsonSerializable()
class Product {

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'discountPercentage')
  final double discountPercentage;
  @JsonKey(name: 'rating')
  final double rating;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'tags')
  final List<String> tags;
  @JsonKey(name: 'brand')
  final String brand;
  @JsonKey(name: 'sku')
  final String sku;
  @JsonKey(name: 'weight')
  final double weight;
  @JsonKey(name: 'dimensions')
  final Dimensions dimensions;
  @JsonKey(name: 'warrantyInformation')
  final String warrantyInformation;
  @JsonKey(name: 'shippingInformation')
  final String shippingInformation;
  @JsonKey(name: 'availabilityStatus')
  final String availabilityStatus;
  @JsonKey(name: 'reviews')
  final List<Review> reviews;
  @JsonKey(name: 'returnPolicy')
  final String returnPolicy;
  @JsonKey(name: 'minimumOrderQuantity')
  final int minimumOrderQuantity;
  @JsonKey(name: 'meta')
  final Map<String, dynamic> meta;
  @JsonKey(name: 'images')
  final List<String> images;
  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }
}
