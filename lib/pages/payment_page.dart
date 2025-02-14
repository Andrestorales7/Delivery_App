import 'package:example_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String cardNumber = '';
    String expiryDate = '';
    String cardHolderName = '';
    String cvvCode = '';
    bool isCvvFocused = false;

    //usuario desea pagar
    void userTappedPay(){
      if(formKey.currentState!.validate()){
        //solo mostrar dialogo si el formulario es valido
        showDialog(context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirmar pago"),
          content: SingleChildScrollView(child: ListBody(
            children: [
              Text("Numero de Tarjeta: $cardNumber"),
              Text("Fecha de Vencimiento: $expiryDate"),
              Text("Titular de tarjeta: $cardHolderName"),
              Text("CVV: $cvvCode"),
            ],
          )
          ),
          actions: [
            //Boton de cancelar
            TextButton(
                 onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"),
                  ),

            //boton de confirmar
            TextButton(
                 onPressed: () => {
                  Navigator.pop(context),
                  Navigator.push(
                       context, MaterialPageRoute(
                        builder: (context) => DeliveryProgressPage()
                      ),
                    )
                 },
                    child: const Text("Si"),
                  )
          ],
        ), 
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Ir a Pagar"),
        ),
        body: Column(
            children: [
                //tarjeta de credito
                CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    onCreditCardWidgetChange: (p0) {
                      
                    },
                ),

                //credit card form
                CreditCardForm(

                    cardNumber: cardNumber, 
                    expiryDate: expiryDate, 
                    cardHolderName: cardHolderName, 
                    cvvCode: cvvCode, 
                    onCreditCardModelChange: (data) {
                        setState(() {
                          cardNumber = data.cardNumber;
                          expiryDate = data.expiryDate;
                          cardHolderName = data.cardHolderName;
                          cvvCode = data.cvvCode;
                        });
                      
                    }, 
                    formKey: formKey
                    ),

                    const Spacer(),

                    MyButton(onTap: userTappedPay,
                    text: "Pagar ahora",
                    ),
                    const SizedBox(height: 25,)



            ],
        ),
    );
  }
}