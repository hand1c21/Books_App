import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  final VoidCallback onPaymentSuccess;

  PaymentPage({required this.onPaymentSuccess});

  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocuseed = false;

  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName,
               cvvCode: cvvCode, 
               showBackView: isCvvFocuseed,
                onCreditCardWidgetChange: (CreditCardButton){}
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CreditCardForm(
                          formKey: fromkey,
                          cardNumber: cardNumber,
                          obscureCvv: true,
                          obscureNumber: true,
                          cvvCode: cvvCode,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(fromkey.currentState!.validate()){
                              widget.onPaymentSuccess();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Payment Successful!')
                                ),
                              );
                              Navigator.pop(context);
                            }else{
                              print('invalid');
                            }
                          }, 
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Text(
                              'invalidate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                          
                          )
                      ],
                    ),
                  ),
                )
          ],
        )
      ),
    );

  }
  void onCreditCardModelChange(CreditCardModel CreditCardModel) {
    setState(() {
      cardNumber = CreditCardModel.cardNumber;
      expiryDate = CreditCardModel.expiryDate;
      cardHolderName = CreditCardModel.cardHolderName;
      cvvCode = CreditCardModel.cvvCode;
      isCvvFocuseed = CreditCardModel.isCvvFocused;
    });
  }
}
