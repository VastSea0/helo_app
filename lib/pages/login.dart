import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login to App',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 350,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                  color: Theme.of(context).colorScheme.surface),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login Page",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome Again",
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    'https://img.icons8.com/?size=480&id=pCvIfmctRaY8&format=png',
                    height: 150,
                    width: 150,
                  )
                ],
              )),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(35),
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Your Mail",
                        ),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // TextField içine yazılan metin rengi
                        )),
                    const SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Your Password",
                            suffixIcon: Icon(Icons.lock)),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // TextField içine yazılan metin rengi
                        )),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          child: Text("Login"),
                          style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all(
                                  Size(double.infinity, 50))),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
