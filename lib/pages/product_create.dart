import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function deleteProduct;
  ProductCreatePage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
 final Map<String, dynamic> _formData = {
   'title': null,
   'description': null,
   'price': null,
   'imageUrl': 'assets/food.jpg'
 };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Title'),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Title is required';
          }
        },
        onSaved: (String value) {
            _formData['title'] = value;
        });
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Description'),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Description is required';
          }
        },
        onSaved: (String value) {
            _formData['description'] = value;
        });
  }

  Widget _buildPriceTextField() {
    return TextFormField(
        textAlign: TextAlign.center,
        // keyboardType: TextInputType.number,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
// inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]'))],
        decoration: InputDecoration(
          labelText: 'Price',
          prefixText: 'AED',
        ),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should be a number';
          }
        },
        onSaved: (String value) {
            _formData['price'] = double.parse(value);
        });
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: targetPadding),
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                _buildTitleTextField(),
                _buildDescriptionTextField(),
                _buildPriceTextField(),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('Save'),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: _submitForm,
                )
              ],
            ),
          ),
        ));
  }
}
