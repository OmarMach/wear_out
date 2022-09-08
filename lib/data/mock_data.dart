class Product {
  final String name;
  final String description;
  final String coverImage;
  final int? salePercentage;
  final int price;
  final int stock;
  final List<String> sizes;
  final List<String> images = [];

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.coverImage,
    this.salePercentage,
    this.sizes = const [],
  });
}

final List<Product> products = [
  Product(
    name: 'Living room lamp',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen. ',
    price: 15,
    stock: 100,
    coverImage: 'https://s.alicdn.com/@sc04/kf/H3226cd173ffc42b5a1d92d5e6443a504i.jpg_300x300.jpg',
  ),
  Product(
    name: 'Lamp',
    description: 'LED lamp with ',
    price: 15,
    stock: 100,
    coverImage: 'https://s.alicdn.com/@sc04/kf/H3226cd173ffc42b5a1d92d5e6443a504i.jpg_300x300.jpg',
  ),
];

final List<Product> topSalesProducts = [
  Product(
      name: 'Blue Dress',
      description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
      price: 1200,
      stock: 100,
      salePercentage: 12,
      sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      coverImage:
          'https://images.unsplash.com/photo-1611091041358-603235165458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  Product(
    name: 'Blue Ocean Dress',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen. ',
    price: 750,
    stock: 100,
    salePercentage: 25,
    sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    coverImage:
        'https://images.unsplash.com/photo-1603951905114-db2982953f53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80',
  ),
  Product(
    name: 'Red Dress',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 500,
    stock: 100,
    sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    coverImage:
        'https://images.unsplash.com/photo-1601842161362-b13547a84c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
  ),
  Product(
      name: 'Blue Dress',
      description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
      price: 1200,
      stock: 100,
      sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      coverImage:
          'https://images.unsplash.com/photo-1611091041358-603235165458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  Product(
      name: 'White Dress',
      description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
      price: 1750,
      stock: 100,
      sizes: ['XS', 'S'],
      coverImage:
          'https://images.unsplash.com/photo-1608614009119-79e4dea7a27e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  Product(
    name: 'Air Jordan',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 1750,
    stock: 100,
    sizes: ['36', '37', '38', '39', '40', '41'],
    coverImage:
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  ),
  Product(
    name: 'Casual Sneakers',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 344,
    stock: 100,
    salePercentage: 30,
    sizes: ['36', '37', '38', '39', '40', '41', '42', '43', '44', '45'],
    coverImage:
        'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80',
  ),
];

final List<Product> discoverProducts = [
  Product(
    name: 'Small Purse',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 120,
    stock: 3,
    coverImage:
        'https://images.unsplash.com/photo-1601992490256-4b3342c775e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=972&q=80',
  ),
  Product(
    name: 'Fancy Watch',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 2500,
    stock: 12,
    coverImage:
        'https://images.unsplash.com/photo-1602268394487-9e6ed811a177?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
  ),
  Product(
    name: 'High Heels',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 2500,
    stock: 12,
    coverImage:
        'https://images.unsplash.com/photo-1590099033615-be195f8d575c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGhlZWxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Chic Perfume',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 2500,
    stock: 12,
    salePercentage: 50,
    coverImage:
        'https://images.unsplash.com/photo-1590736704728-f4730bb30770?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=948&q=80',
  ),
];

final List<Product> menAccessoires = [
  Product(
    name: 'Time Watch',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 120,
    stock: 3,
    coverImage:
        'https://images.unsplash.com/photo-1584613862210-af0d37109e7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  ),
  Product(
    name: 'An other Time Watch',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 3400,
    stock: 2,
    coverImage:
        'https://images.unsplash.com/photo-1531929796702-8dcf9c4e49d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVuJTIwYWNjZXNzb2lyZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Light brown sunglasses',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 230,
    stock: 2,
    coverImage:
        'https://images.unsplash.com/photo-1614252369475-531eba835eb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VuZ2xhc3NlcyUyMG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Biker gaunglets',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 100,
    stock: 2,
    coverImage:
        'https://images.unsplash.com/photo-1612462767153-e8fd5ef189f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3VuZ2xhc3NlcyUyMG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Weird copper ring',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 4300,
    salePercentage: 20,
    stock: 2,
    coverImage:
        'https://images.unsplash.com/photo-1569098446737-c22abf95abf7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3VuZ2xhc3NlcyUyMG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Abidass handbag',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 75,
    salePercentage: 30,
    stock: 2,
    coverImage:
        'https://images.unsplash.com/photo-1557327838-9a5d011670b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
];
final List<Product> limitedEditionProductsMen = [
  Product(
    name: 'White suit, not that good',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 3000,
    stock: 1,
    coverImage:
        'https://images.unsplash.com/photo-1621331938577-42f137e5d5f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Cool leather Jacket',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 4000,
    stock: 1,
    coverImage:
        'https://images.unsplash.com/photo-1551283279-166ab6d719af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Luis Vuiton expensive stuff',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 230,
    stock: 1,
    coverImage:
        'https://images.unsplash.com/photo-1580934427136-e7a058ef8902?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Cool image I wanted to put here',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 230,
    stock: 1,
    coverImage:
        'https://images.unsplash.com/photo-1530282095308-b3071841c3ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzB8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    name: 'Grey coat',
    description: 'Lorem ipsum sit dolor amen lorem ipsum sit dolor amen lorem ipsum sit dolor amen',
    price: 2300,
    stock: 1,
    coverImage:
        'https://images.unsplash.com/photo-1614548142401-ce00952f66da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHN1bmdsYXNzZXMlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ),
];

List<Product> get allProducts {
  final List<Product> all = [];
  all.addAll(menAccessoires);
  all.addAll(topSalesProducts);
  all.addAll(limitedEditionProductsMen);
  all.addAll(discoverProducts);
  all.addAll(products);
  return all;
}
