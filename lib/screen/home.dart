import 'package:flutter/material.dart';

import '../model/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final VapiCallService callService = VapiCallService();
  final List<User> users = [
    User(name: 'Het', phone: '+918200170255'),
    User(name: 'Abhijit', phone: '+917205856225'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Users'))),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(user.name),
              subtitle: Text(user.phone),
              onTap: () => callService.makeOutboundCall(user.phone),
            );
          },
        ),
      ),
    );
  }
}
