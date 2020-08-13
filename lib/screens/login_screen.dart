import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_cliente/models/user_model.dart';
import 'package:loja_virtual_cliente/screens/create_account_screen.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar", style: TextStyle(color: Colors.white),),
          actions: [
            FlatButton(
              child: Text("Criar conta",
                style: TextStyle(color: Colors.white, fontSize: 16.0),),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen())
                );
              },
            )
          ],
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "E-mail"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha inválida";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        if(_emailController.text.isEmpty){
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Insira seu e-mail para recuperação!",),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              )
                          );
                        } else {
                          model.recoverPassword(email: _emailController.text);
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Verifique seu e-mail",),
                                backgroundColor: Theme.of(context).primaryColor,
                                duration: Duration(seconds: 2),
                              )
                          );
                        }
                      },
                      child: Text("Esqueci a senha"),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Entrar",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          model.signIn(email: _emailController.text,
                              password: _passwordController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail
                          );
                        }
                      },
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao logar com o usuário!",),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        )
    );
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    }
    );
  }
}