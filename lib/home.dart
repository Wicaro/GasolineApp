// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';


class home extends StatefulWidget {
  const home({
    Key ? key
  }): super(key: key);

  @override
  State < home > createState() => _homeState();
}

class _homeState extends State < home > {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();

  String _resultText = "";

 void _calcule(){

   double? priceAlcool = double.tryParse( _controllerAlcool.text );
   double? priceGasoline = double.tryParse( _controllerGasoline.text );

   if( priceAlcool == null || priceGasoline == null){
     setState(() {
       _resultText = "Número inválido, digite números maiores que 0 e utilizando (.)";
     });
   }else{

     if( (priceAlcool / priceGasoline ) >= 0.7){
       setState(() {
         _resultText = "Melhor abastecer com gasolina";
       });
     }else{
       setState(() {
         _resultText = "Melhor abastecer com alcool";
       });
     }

   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                  ),
                  style: TextStyle(
                    fontSize: 22
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço da Gasolina, ex: 2.59"
                  ),
                  style: TextStyle(
                    fontSize: 22
                  ),
                  controller: _controllerGasoline,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    onPressed:_calcule,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _resultText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}