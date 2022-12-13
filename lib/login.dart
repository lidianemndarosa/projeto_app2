import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPass = TextEditingController();
  bool _eye = true;

  String emailAccess = "teste@teste.com";
  String passAccess = "1234";

  String _emailFill = "";
  String _passFill = "";

  void _validaLogin(String email, String pass) {
    if(email.isEmpty){
      setState(() {
        _emailFill = "Preencha este campo";
      });
    } else {
      setState(() {
        _emailFill = "";
      });
    }
    if(pass.isEmpty){
      setState(() {
        _passFill = "Preencha este campo";
      });
    } else {
      setState(() {
        _passFill = "";
      });
    }

    if (email.isNotEmpty && pass.isNotEmpty) {
      if(email == emailAccess && pass == passAccess) {
        showDialog(
          context: context,
          builder: (context) => MyAlertOk()
          );
    } else {
      showDialog(
        context: context,
        builder: (context) => MyAlertFail()
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: Image.asset("assets/images/nativetalk.jpeg"),
              ),
              
              //Campo de text email
              Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Digite seu email",
                      helperText: _emailFill,
                      helperStyle: TextStyle(
                        color: Colors.red
                      )
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 18),
                    controller: _ctrlEmail),
              ),

              //Campo de senha
              Container(
                padding:
                    EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Senha",
                        hintText: "Digite sua senha",
                        helperText: _passFill,
                        helperStyle: TextStyle(
                          color: Colors.red
                        ),
                        suffixIcon: IconButton(
                          icon: (_eye)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _eye = !_eye;
                            });
                          },
                        )),
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18),
                    obscureText: _eye,
                    controller: _ctrlPass),
              ),

              //Botão de login
              ElevatedButton(
                  onPressed: () {
                    _validaLogin(_ctrlEmail.text, _ctrlPass.text);
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      width: 150,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      ))),
              
              Container(
                 padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text('\\nativetalk'),
                        ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text('\\nativetalk'),
                        ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text('\\nativetalk'),
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////////////// AlertDialog - Ok ////////////////

class MyAlertOk extends StatelessWidget {
  const MyAlertOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Login realizado com sucesso!"),
      title: Text("App 2 - QI"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: (){
            //Seremos direcionados para outra tela
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyLogin()
              )
            );
          },
          child: Text("Ir para home")
        )
      ],
    );
  }
}

///////////////// AlertDialog - Fail //////////////////

class MyAlertFail extends StatelessWidget {
  const MyAlertFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("App 2 - QI"),
      content: Text("Email ou senha inválidos."),
      actions: <Widget>[
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text("Tentar novamente")
        )
      ],
    );
  }
}
