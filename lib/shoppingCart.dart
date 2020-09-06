import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;

  @override
  String toString() {
    return this.name;
  }
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () => onCartChanged(product, !inCart),
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      trailing: CupertinoSwitch(
        value: !inCart,
        onChanged: (bool value) {
          onCartChanged(product, !inCart);
          if(value){
            print("checked");
          }else{
            print("unchecked");
          }
        },
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  void initState() {
    super.initState();
    print("init State called");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose called");
  }

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    print(product.toString());
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物车"),
      ),
      body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products
              .map((Product product) => ShoppingListItem(
                    product: product,
                    inCart: _shoppingCart.contains(product),
                    onCartChanged: _handleCartChanged,
                  ))
              .toList()),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: "购物App",
    home: ShoppingList(
      products: [Product(name: "鸡蛋"), Product(name: "面包"), Product(name: "蛋糕")],
    ),
  ));
}
