import 'package:aula18/Pages/FormUser/form_user_controller.dart';
import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FormController controller = FormController();

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Align(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(25),
            constraints: BoxConstraints(minWidth: 300),
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
                            onChanged: (text) => controller.setName(text),
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'campo obrigatorio';
                              }
                              return null;
                            },
                            decoration: InputDecoration(hintText: "Sobrenome"),
                            onChanged: (text) => controller.setLast(text),
                          ),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      Text('Salvar: ${controller.name}'),
                                      ElevatedButton(
                                          onPressed: () {
                                            controller.saveUser();
                                            Navigator.pop(context, true);
                                          },
                                          child: Text('salvar'))
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                      child: Text("Validar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          controller.deleteUser();
                        });
                      },
                      child: Text("Deletar"),
                    ),
                  ],
                ),
                FutureBuilder<String>(
                    future: controller.fullName,
                    builder: (context, snapshot) {
                      return Text(snapshot.data ?? '');
                    })
              ],
            ),
          ),
        ));
  }
}
