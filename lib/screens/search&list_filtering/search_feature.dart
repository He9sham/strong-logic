import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  final TextEditingController searchController = TextEditingController();
  List<Map> products = [
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Brown Women Bag",
      "price": 70,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "White Watch 40",
      "price": 130,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1541643600914-78b084683601?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Men Chanel Perfume",
      "price": 2000,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Black Modern Glasses",
      "price": 1400,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D",
      "title": "Men Nike Shoes",
      "price": 150,
    },
  ];
  List<Map> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  /// search filter function to filter the products
  void searchFilter(String keyword) {
    setState(() {
      filteredProducts = products.where((product) {
        final title = product['title'].toString().toLowerCase();
        final input = keyword.toLowerCase();
        return title.contains(input);
      }).toList();
    });
  }

  /// filter by price
  void filterByPrice() {
    setState(() {
      filteredProducts = List.from(products);

      filteredProducts.sort((a, b) => b['price'].compareTo(a['price']));
    });
  }

  /// filter by alpha
  void filterByAlpha() {
    setState(() {
      filteredProducts = List<Map>.from(products);

      filteredProducts.sort((a, b) => b['title'].compareTo(a['title']));
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade900,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 120),
              // Text field for search
              SizedBox(
                height: 45,
                child: TextField(
                  controller: searchController,
                  onChanged: searchFilter,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search),
                    suffixIcon:
                        searchController.text.isNotEmpty &&
                            searchController.text != ' '
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                searchController.clear();
                                searchFilter('');
                              });
                            },
                            child: Icon(CupertinoIcons.xmark),
                          )
                        : SizedBox.shrink(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: 'Search',
                    helperStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    focusedBorder: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),

              SizedBox(height: 50),
              // category filter
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        searchFilter('Men');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          'Men',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        searchFilter('Women');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          'Women',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        searchFilter('Nike');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          'Nike',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        searchFilter('');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // sort filter
              Row(
                children: [
                  IconButton(
                    onPressed: filterByPrice,
                    icon: Icon(Icons.sort, color: Colors.white),
                  ),
                  Text('Sort by price', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: filterByAlpha,
                    icon: Icon(Icons.list_sharp, color: Colors.white),
                  ),
                  Text('A - Z', style: TextStyle(color: Colors.white)),

                  Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filteredProducts = List<Map>.from(products);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.clear, color: Colors.white, size: 15),

                          SizedBox(width: 5),
                          Text(
                            'Clear Filter',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              Column(
                children: List.generate(filteredProducts.length, (index) {
                  final product = filteredProducts[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.network(
                        product['image'],
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    ),
                    title: Text(
                      product['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '${product['price']}\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
