import 'package:flutter/material.dart';

class FormUser extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String name;
    String lastName;

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Align(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(25),
            constraints: BoxConstraints(
              minWidth: 300
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 2),
                      spreadRadius: 2)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'campo obrigatorio';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Nome",
                            ),
                            onChanged: (text) => name = text,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'campo obrigatorio';
                              }
                              return null;
                            },
                            decoration: InputDecoration(hintText: "Sobrenome"),
                            onChanged: (text) => lastName = text,
                          ),
                        ],
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      final isValid = _formKey.currentState.validate();
                      if (isValid) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Olá ${name + ' ' + lastName}'),
                              );
                            });
                      }
                    },
                    child: Text("Validar"))
              ],
            ),
          ),
        ));
  }
}
