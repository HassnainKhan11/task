import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_hassnain/provider.dart';
import 'package:task_hassnain/user_model.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<UsersProvider>(
              builder: ((context, value, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          value.updateList();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Center(
                          child: Text('Update'),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          value.delete();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Center(
                          child: Text('Delete'),
                        ))
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Consumer<UsersProvider>(
                builder: ((context, value, child) {
                  return StreamBuilder(
                      stream: value.generateUsers(),
                      builder: (context, AsyncSnapshot<User> snapshot) {
                        if (snapshot.hasData) {
                          value.usersData.add(snapshot.data!);

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: value.usersData.length,
                            itemBuilder: ((context, index) {
                              final User user = value.usersData[index];
                              return Card(
                                elevation: 1,
                                color: index % 2 == 0
                                    ? const Color.fromARGB(255, 22, 108, 151)
                                    : const Color.fromARGB(255, 98, 19, 210),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(12),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'username:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 249, 249, 249),
                                        ),
                                      ),
                                      Text(
                                        user.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'email:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                      Text(
                                        user.emailAddress.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          );
                        }
                        return const Center(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
