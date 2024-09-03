class Bookmodel {
  String description, id, bookName, author;
  String? admin_user_id;
  int discountPrice, quantity, price;
  bool wishList, addedToCart;

  Bookmodel(
      {required this.description,
      required this.id,
      required this.admin_user_id,
      required this.author,
      required this.bookName,
      required this.discountPrice,
      required this.price,
      required this.quantity,
      this.addedToCart = false,
      this.wishList = false});
}
