
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState(){
    super.initState();
    _imageUrlController.addListener(updateImage);
  }

  @override
  void didChangedDependecies(){
    super.didChangeDependencies();
    if(_formData.isEmpty){
      final arg = ModalRoute.of(context)?.settings.arguments;
      if(arg !=null){
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.id;
        _formData['price'] = product.id;
        _formData['description'] = product.id;
        _formData['urlImage'] = product.id;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  void updateImage(){
      setState(() {});
  }

  bool isValidImageUrl(String url){
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath?? false;

    bool endWithFile = url.toLowerCase().endsWith('.png') || 
    url.toLowerCase().endsWith('.jpg') ||
    url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endWithFile;
  }

  void submitForm(){
    if(_formKey.currentState!.validate()){
      return;
    }

    Provider.of<ProductList>(context, listen: true).saveProduct(_formData);

    Navigator.of(context).pop();
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
              initialValue: _formData['name']?.toString(),
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocus);
              },
              onSaved: (name)=> _formData['name'] = name ?? "",
              validator: (name){
                if(name!.trim().isEmpty){
                  return "Nome esta invalido";
                }
                return null;
              },
            ),
             TextFormField(
               initialValue: _formData['price']?.toString(),
              decoration: const InputDecoration(labelText: 'Preço'),
              focusNode: _priceFocus,
              textInputAction: TextInputAction.next,
               onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descicaoFocus);
              },
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
               onSaved: (price)=> _formData['price'] = double.parse(price ?? '0'),
               validator: (_price){
                 final priceString = _price?? "";
                 final price = double.tryParse(priceString) ?? -1;
                if(price <= 0){
                  return "Informe um preço valido";
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: _formData['description']?.toString(),
              decoration: const InputDecoration(labelText: 'Descricao'),
              textInputAction: TextInputAction.next,
              focusNode: _descicaoFocus,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onSaved: (description)=> _formData['description'] = description ?? "",
               validator: (description){
                if(description!.trim().isEmpty){
                  return "Descricao esta vazia";
                }
                return null;
              },
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
                     validator: (_image){
                       final imageUrl = _image ?? "";
                       if(isValidImageUrl(imageUrl)){
                         return 'Informe uma url';
                       }
                       return null;
                     },
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