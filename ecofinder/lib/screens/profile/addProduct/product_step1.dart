import 'package:ecofinder/providers/product.dart';
import 'package:ecofinder/screens/profile/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductStep1 extends StatefulWidget {
  @override
  _ProductStep1State createState() => _ProductStep1State();
}

class _ProductStep1State extends State<ProductStep1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    ProductProvider productProvider = Provider.of(context);

    final content = productProvider.createObject;
    TextEditingController _titleController = TextEditingController(
      text: content['title'] != null ? content['title'] : '',
    );
    TextEditingController _descriptionController = TextEditingController(
      text: content['description'] != null ? content['description'] : '',
    );
    TextEditingController _priceController = TextEditingController(
      text: content['price'] != null ? content['price'].toString() : '',
    );

    String _title, _description, _price;

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: _titleController.text,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Este campo é obrigatório';
                return null;
              },
              onSaved: (String val) {
                setState(() {
                  _title = val;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            TextFormField(
              initialValue: _priceController.text,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço (R\$)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Este campo é obrigatório';
                return null;
              },
              onSaved: (String val) {
                setState(() {
                  _price = val;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            Container(
              child: TextFormField(
                initialValue: _descriptionController.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Descrição",
                  border: OutlineInputBorder(),
                ),
                onSaved: (String val) {
                  setState(() {
                    _description = val;
                  });
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Buttons(
              hasBackButton: false,
              provider: productProvider,
              isValid: () {
                return _formKey.currentState.validate();
              },
              stepContent: () {
                _formKey.currentState.save();
                Map<String, dynamic> stepContent = {
                  'title': _title,
                  'price': _price,
                  'description': _description,
                };

                return stepContent;
              },
            ),
          ],
        ),
      ),
    );
  }
}
