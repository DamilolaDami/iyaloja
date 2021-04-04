class BestSelling {
  final String img;
  final String title;
  final String quantity;
  final String price;

  BestSelling({this.img, this.title, this.price, this.quantity});
}

List<BestSelling> bestselling = [
  BestSelling(
      img: 'assets/images/eggs.jpg',
      title: 'Eggs',
      quantity: '1 mudu',
      price: '550'),
  BestSelling(
      img: 'assets/images/fanice.jpg',
      title: 'Fanice Ice Cream',
      quantity: '1 mudu',
      price: '350'),
  BestSelling(
      img: 'assets/images/milo.jpg',
      title: 'Milo',
      quantity: '1 mudu',
      price: '600'),
  BestSelling(
      img: 'assets/images/macaroni.jpg',
      title: 'Macaroni',
      quantity: '1 tuber',
      price: '700'),
  BestSelling(
      img: 'assets/images/garri.jpg',
      title: 'Garri',
      quantity: '1 ',
      price: '1000'),
  BestSelling(
      img: 'assets/images/rice.jpg',
      title: 'Rice',
      quantity: '1 mudu',
      price: '550'),
];
