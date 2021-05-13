


class BookModel {
  String title;
  String subTitle;
  String image;
  BookModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}


List<BookModel> books_list = [
BookModel(title: 'Livro sobre o mundo',subTitle: 'sobre o mundo mesmo',image:'assets/images/book1.jpg'),
BookModel(title: 'Livro sobre o mundo',subTitle: 'sobre o mundo mesmo',image:'assets/images/book2.jpg'),
BookModel(title: 'Livro sobre o mundo',subTitle: 'sobre o mundo mesmo',image:'assets/images/book3.jpg'),
BookModel(title: 'Livro sobre o mundo',subTitle: 'sobre o mundo mesmo',image:'assets/images/book4.jpg'),
BookModel(title: 'Livro sobre o mundo',subTitle: 'sobre o mundo mesmo',image:'assets/images/book5.jpg'),

];
