import 'package:flutter/material.dart';
import 'package:orders_app/models/product.dart';
import '../widgets/helper/ensure-visible.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope-models/main.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  Widget _buildTitleTextField(Product product) {
    return EnsureVisibleWhenFocused(
        focusNode: _titleFocusNode,
        child: TextFormField(
            focusNode: _titleFocusNode,
            initialValue: product == null ? '' : product.title,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (String value) {
              if (value.isEmpty || value.length < 3) {
                return 'Title is required';
              }
            },
            onSaved: (String value) {
              _formData['title'] = value;
            }));
  }

  Widget _buildDescriptionTextField(Product product) {
    return EnsureVisibleWhenFocused(
        focusNode: _descriptionFocusNode,
        child: TextFormField(
            focusNode: _descriptionFocusNode,
            initialValue: product == null ? '' : product.description,
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (String value) {
              if (value.isEmpty || value.length < 3) {
                return 'Description is required';
              }
            },
            onSaved: (String value) {
              _formData['description'] = value;
            }));
  }

  Widget _buildPriceTextField(Product product) {
    return EnsureVisibleWhenFocused(
        focusNode: _priceFocusNode,
        child: TextFormField(
            focusNode: _priceFocusNode,
            initialValue: product == null ? '' : product.price.toString(),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
            }));
  }

  void _submitForm(model, 
      Function addProduct, Function updateProduct, Function setSelectedProduct,
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    if (selectedProductIndex == null) {
      addProduct(model, _formData['title'], _formData['description'],
          _formData['image'], _formData['price']);
    } else {
      updateProduct(_formData['title'], _formData['description'],
          _formData['image'], _formData['price']);
    }

    Navigator.pushReplacementNamed(context, '/products')
        .then((_) => setSelectedProduct(null));
  }

  Widget _buildPageContent(
      BuildContext context, targetPadding, Product product) {
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
                _buildTitleTextField(product),
                _buildDescriptionTextField(product),
                _buildPriceTextField(product),
                SizedBox(
                  height: 10.0,
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          child: Text('Save'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
          onPressed: () => _submitForm(model, model.addProduct, model.updateProduct,
              model.selectProduct, model.selectedProductIndex),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;

    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, targetPadding, model.selectedProduct);

        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
