import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar conta", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Nome completo"
              ),
              validator: (text){
                if(text.isEmpty && text.length < 5) return "Escreva seu nome";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty && !text.contains("@")) return "Escreva seu e-mail";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
              validator: (text){
                if(text.isEmpty && text.length < 7) return "Escreva sua senha";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Endereço"
              ),
              validator: (text){
                if(text.isEmpty && text.length < 5) return "Escreva seu endereço";
              },
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child:  RaisedButton(
                child: Text("Criar conta", style: TextStyle(fontSize: 18.0, color: Colors.white),),
                onPressed: () {
                  if(_formKey.currentState.validate()){

                  }
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

