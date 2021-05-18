import 'package:flutter/material.dart';

class FormUser extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String name;
    String lastName;

    return Scaffold(
      appBar: AppBar(title: Text("Form user"),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:25.0, horizontal: 50),
        child: Column(
          children: [
            Text(
              "Informe seu nome e sobrenome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'campo obrigatorio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Nome"
                    ),
                    onChanged: (text) => name = text,
                  ),
                  TextFormField(
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'campo obrigatorio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Sobrenome"
                    ),
                    onChanged: (text) => lastName = text,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      final isValid = _formKey.currentState.validate();
                      if(isValid){
                        showDialog(
                          context: context, 
                          builder: (context){
                            return AlertDialog(
                              title: Text('${name +' '+ lastName}'),
                            );
                          }
                        );
                      }
                    }, 
                    child: Text("Validar")
                  )
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}