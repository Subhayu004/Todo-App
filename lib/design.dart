import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _AppDesign();
}

class _AppDesign extends State<TodoApp> {

  // Key = task name
  // Value = task description
  Map<String, String> tasks = {};

  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    desc.dispose();
    super.dispose();
  }

  void addTask() {

    String taskName = name.text;
    String description = desc.text;

    setState(() {
      tasks[taskName] = description;
    });

    name.clear();
    desc.clear();
  }

  void deleteTask(String taskName) {

    setState(() {
      tasks.remove(taskName);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Image.asset(
          "assets/images/bg.avif",
          fit: BoxFit.cover,
        ),

        title: const Text(
          "Todo App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white,
          ),
        ),

        centerTitle: true,

        backgroundColor: const Color.fromRGBO(
          163,
          112,
          255,
          1.0,
        ),
      ),

      body: Center(

        child: Column(

          children: [

            Padding(
              padding: const EdgeInsets.only(top: 72.0),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 19),

                    child: Text(
                      "Add Your Task",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Color.fromRGBO(
                          146,
                          49,
                          237,
                          1.0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: SizedBox(
                      height: 70,
                      width: 500,

                      child: TextField(
                        controller: name,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Add Your Task",
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: SizedBox(
                      height: 202,
                      width: 500,

                      child: TextField(
                        controller: desc,

                        maxLines: null,
                        expands: true,
                        maxLength: 150,

                        textAlignVertical:
                        TextAlignVertical.top,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Task Description",

                          floatingLabelBehavior:
                          FloatingLabelBehavior.always,

                          hintText:
                          "Add Task Description Within 150 Characters",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(

              onPressed: addTask,

              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color.fromRGBO(
                  146,
                  49,
                  237,
                  1.0,
                ),

                fixedSize: const Size(250, 30),

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),

              child: const Text(
                "Add Task",

                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Color.fromRGBO(
                37,
                1,
                62,
                1.0,
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 20),

                    child: Text(
                      "Your Tasks :",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  ...tasks.entries.map((task) {

                    String taskName = task.key;
                    String description = task.value;

                    return Card(

                      margin:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),

                      child: ListTile(

                        title: Text(
                          taskName,

                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          description,
                        ),

                        trailing: IconButton(

                          onPressed: () {
                            deleteTask(taskName);
                          },

                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}