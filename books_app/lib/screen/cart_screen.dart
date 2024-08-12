import 'package:flutter/material.dart';

import '../Modle/modle.dart';
import '../main.dart';
import 'payment_screen.dart';

class CartPage extends StatefulWidget {
  _createPageState createState() => _createPageState();
}

class _createPageState extends State<CartPage> {
  void _removeFromeCart(Book book) {
    setState(() {
      cart.remove(book);
    });
  }

  void _clearCart() {
    setState(() {
      cart.clear();
    });
  }
  double _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var book in cart) {
      totalPrice += double.tryParse(book.price) ?? 0.0;
    }
    return totalPrice;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => _clearCart(),
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final book = cart[index];
                        return ListTile(
                          leading: Image.asset(book.imageURL),
                          title: Text(book.title),
                          subtitle: Text("\$" + book.price),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () => _removeFromeCart(book),
                          ),
                        );
                      }),
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          "Total: \$${_calculateTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaymentPage(onPaymentSuccess: _clearCart),
                              ),
                            );

                            //
                          },
                          child: Text("pay Now"),
                        )
                      ],
                    )),
              ],
            ),
    );
    // );
  }
}