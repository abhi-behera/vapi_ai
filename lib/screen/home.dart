import 'package:flutter/material.dart';

import '../model/user.dart';

class UserListPage extends StatefulWidget {
  UserListPage({super.key});
  final GlobalKey<FormState> _formKey1 = GlobalKey();

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final VapiCallService callService = VapiCallService();
  // final List<User> users = [
  //   User(name: 'Het', phone: '+918200170255'),
  //   User(name: 'Abhijit', phone: '+917205856225'),
  // ];

  final TextEditingController _addrrssController =
      TextEditingController(text: "+91");
  final TextEditingController _addrrss1Controller = TextEditingController();

  @override
  void dispose() {
    _addrrssController.dispose();
    _addrrss1Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 10, 20),
          title: const Center(
              child: Text(
            'Vapi ai',
            style: TextStyle(color: Colors.white70),
          ))),
      body: Container(
        color: const Color.fromARGB(255, 11, 10, 20),
        child: Form(
          key: widget._formKey1,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Spacer(),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: const Text(
                    "Please enter the number. We will  contact you shortly.",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: screenWidth * 0.15,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        controller: _addrrssController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.75,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        controller: _addrrss1Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusColor: Colors.white70,
                          suffixStyle: const TextStyle(color: Colors.white70),
                          hintText: 'Enter the user\'s number',
                          hintStyle: const TextStyle(color: Colors.white70),
                          suffixIcon: IconButton(
                            onPressed: _addrrss1Controller.clear,
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.white70,
                            ),
                          ),
                          labelText: 'Contact Box',
                          labelStyle: const TextStyle(color: Colors.white70),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please  enter any number';
                          } else if (value.length != 10) {
                            return 'Please  enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget._formKey1.currentState!.validate()) {
                      widget._formKey1.currentState!.save();
                      if (_addrrss1Controller.text.isNotEmpty) {
                        callService.makeOutboundCall(
                            _addrrssController.text == ''
                                ? '+91'
                                : _addrrssController.text +
                                    _addrrss1Controller.text,
                            context);
                      }
                    }
                  },
                  child: const Text('Make a Call',
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 36, 71),
                      )),
                ),
                Spacer(),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "made by Pragetx Softwares",
                      style: TextStyle(color: Colors.white54),
                    ))
              ])
              // ListView.builder(
              //   itemCount: users.length,
              //   itemBuilder: (context, index) {
              //     final user = users[index];
              //     return ListTile(
              //       leading: const Icon(Icons.person),
              //       title: Text(user.name),
              //       subtitle: Text(user.phone),
              //       onTap: () => callService.makeOutboundCall(user.phone),
              //     );
              //   },
              // ),
              ),
        ),
      ),
    );
  }
}
