import 'package:flutter/material.dart';
import 'package:orders_app/scope-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/helper/ensure-visible.dart';

class RestaurantsEditPage extends StatefulWidget {
  final Widget child;

  RestaurantsEditPage({Key key, this.child}) : super(key: key);

  _RestaurantsEditState createState() => _RestaurantsEditState();
}

class _RestaurantsEditState extends State<RestaurantsEditPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _minFocusNode = FocusNode();
  final _maxFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  final Map<String, dynamic> _formData = {
    'id': null,
    'title': null,
    'type': null,
    'description': null,
    'min': null,
    'max': null,
    'image': 'https://s3.envato.com/files/150255091/01_preview4.jpg',
    'phone': null,
    'address': null,
    'userId': null,
  };

  Widget _buildTitleTextFiled() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        // initialValue: restaurants != null : restaurants.name,
        decoration: InputDecoration(hintText: 'Resturant Name'),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Restaurant name is required';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildTypeTextFiled() {
    return EnsureVisibleWhenFocused(
      focusNode: _typeFocusNode,
      child: TextFormField(
        focusNode: _typeFocusNode,
        // initialValue: restaurants != null : restaurants.name,
        decoration: InputDecoration(hintText: 'Resturant Type ex: Fast food'),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Restaurant type is required';
          }
        },
        onSaved: (String value) {
          _formData['type'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextFiled() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        // initialValue: restaurants != null : restaurants.name,
        decoration: InputDecoration(hintText: 'Description'),
        maxLines: 4,
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Description is required';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildMinPriceTextField() {
    return EnsureVisibleWhenFocused(
        focusNode: _minFocusNode,
        child: TextFormField(
            focusNode: _minFocusNode,
            // initialValue: product == null ? '' : product.price.toString(),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Min Price',
              prefixText: 'AED',
            ),
            // validator: (String value) {
            //   if (value.isEmpty ||
            //       !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            //     return 'Min price is required and should be a number';
            //   }
            // },
            onSaved: (String value) {
              _formData['min'] = double.parse(value);
            }));
  }

  Widget _buildMaxPriceTextField() {
    return EnsureVisibleWhenFocused(
        focusNode: _maxFocusNode,
        child: TextFormField(
            focusNode: _maxFocusNode,
            // initialValue: product == null ? '' : product.price.toString(),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Max Price',
              prefixText: 'AED',
            ),
            // validator: (String value) {
            //   if (value.isEmpty ||
            //       !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            //     return 'Max price is required and should be a number';
            //   }
            // },
            onSaved: (String value) {
              _formData['max'] = double.parse(value);
            }));
  }

  Widget _buildPhoneTextFiled() {
    return EnsureVisibleWhenFocused(
      focusNode: _phoneFocusNode,
      child: TextFormField(
        focusNode: _phoneFocusNode,
        // initialValue: restaurants != null : restaurants.name,
        decoration: InputDecoration(hintText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Phone is required';
          }
        },
        onSaved: (String value) {
          _formData['phone'] = value;
        },
      ),
    );
  }

  Widget _buildAddressTextFiled() {
    return EnsureVisibleWhenFocused(
      focusNode: _addressFocusNode,
      child: TextFormField(
        focusNode: _addressFocusNode,
        // initialValue: restaurants != null : restaurants.name,
        decoration: InputDecoration(hintText: 'Address'),
        // validator: (String value) {
        //   if (value.isEmpty || value.length < 3) {
        //     return 'a is required';
        //   }
        // },
        onSaved: (String value) {
          _formData['address'] = value;
        },
      ),
    );
  }

  _submitForm(MainModel model) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    // MainModel model = MainModel();
    model.addRestaurant(
        model.authenticatedUser.id,
        model.authenticatedUser.email,
        _formData['title'],
        _formData['type'],
        _formData['description'],
        _formData['min'],
        _formData['max'],
        _formData['phone'],
        _formData['address'],
        _formData['image'], model);
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          child: Text('Save'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
          onPressed: () => _submitForm(model),
        );
      },
    );
  }

  Widget _buildContentPage(BuildContext context, targetPadding) {
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
              _buildTitleTextFiled(),
              _buildTypeTextFiled(),
              _buildDescriptionTextFiled(),
              _buildMinPriceTextField(),
              _buildMaxPriceTextField(),
              _buildPhoneTextFiled(),
              _buildAddressTextFiled(),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWith;
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Profile'),
        ),
        body: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
          return _buildContentPage(context, targetPadding);
        }));
  }
}
