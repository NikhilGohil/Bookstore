class Bookmodel {
  String description, id, admin_user_id, bookName, author;
  int discountPrice, quantity, price;

  Bookmodel(
      {required this.description,
      required this.id,
      required this.admin_user_id,
      required this.author,
      required this.bookName,
      required this.discountPrice,
      required this.price,
      required this.quantity});
}
