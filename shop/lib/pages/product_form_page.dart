
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({ Key? key }) : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {

  final _priceFocus = FocusNode();
  final _descicaoFocus = FocusNode();
  final _imageFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey();
  final _formData = Map<String, Object>();

  @override
  void initState(){
    super.initState();
    _imageUrlController.addListener(updateImage);
  }

  void updateImage(){
      setState(() {});
  }

  void submitForm(){
    //if(_formKey.currentState!.validate()) return;
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: _formData['name'] as String ,
      description: _formData['description']  as String,
      price: _formData['price']  as double,
      imageUrl: _formData['urlImage']  as String
      );
  }


  @override
  void dispose(){
    super.dispose();
    _priceFocus.dispose();
    _descicaoFocus.dispose();
    _imageFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Produtos"),
        actions: [
          IconButton(
            onPressed: () => submitForm(),
            icon: const Icon(Icons.save),)
        ],
      ),
      
      body: Form(
        key: _formKey,
        child: ListView(
          children:  [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocus);
              },
              onSaved: (name)=> _formData['name'] = name ?? "",
            ),
             TextFormField(
              decoration: const InputDecoration(labelText: 'Preço'),
              focusNode: _priceFocus,
              textInputAction: TextInputAction.next,
               onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descicaoFocus);
              },
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
               onSaved: (price)=> _formData['price'] = double.parse(price ?? '0'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descricao'),
              textInputAction: TextInputAction.next,
              focusNode: _descicaoFocus,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onSaved: (description)=> _formData['Description'] = description ?? "",
            ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _imageUrlController,
                    decoration: const InputDecoration(labelText: 'Url da image'),
                    textInputAction: TextInputAction.done,
                    focusNode: _imageFocus,
                    keyboardType: TextInputType.url,
                    onFieldSubmitted: (_) => submitForm(),
                     onSaved: (urlImage)=> _formData['urlImage'] = urlImage ?? "",
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                    ? const Text("Informe a url")
                    : FittedBox(child: Image.network(_imageUrlController.text),
                    fit: BoxFit.cover,),
                  ),              
                ],
              ),
          ],
        ),
        ),
    );
  }
}