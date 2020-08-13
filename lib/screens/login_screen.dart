import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_cliente/screens/create_account_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar", style: TextStyle(color: Colors.white),),
        actions: [
          FlatButton(
        child:  Text("Criar conta", style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CreateAccountScreen() )
              );
            },
      )
        ],
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
              validator: (text) {
                if(text.isEmpty || text.length < 6) return "Senha inválida";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){},
                child: Text("Esqueci a senha"),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16.0,),
           SizedBox(
             height: 44.0,
             child:  RaisedButton(
               child: Text("Entrar", style: TextStyle(fontSize: 18.0, color: Colors.white),),
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
