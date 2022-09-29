import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/todo_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Todo todo = Get.put(Todo());

  // addvalue() {
  //   setState(() {
  //     items.add(name.text);
  //     name.clear();
  //   });
  // }

  // delValue(index) {
  //   setState(() {
  //     items.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: todo.name,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                todo.addvalue();
              },
              child: Text('Add Text')),
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: todo.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                        tileColor: Colors.grey,
                        title: Text('${todo.items[index]}'),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: (() {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Text'),
                                            content: TextField(
                                              controller: todo.editname,
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    todo.items.replaceRange(
                                                        index,
                                                        index + 1,
                                                        {todo.editname.text});
                                                  },
                                                  child: Text('Edit')),
                                            ],
                                          );
                                        });
                                  }),
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    todo.delvalue(index);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        )),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
