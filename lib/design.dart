import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget{
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _AppDesign();
}

class _AppDesign extends State<TodoApp>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(163, 112, 255, 1.0),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Add Task TextField creation
            Padding(
              padding: const EdgeInsets.only(top: 72.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text("Add Your Task",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: Color.fromRGBO(146, 49, 237, 1.0)
                  )
                  ),
                ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 70,
                      width: 500,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          labelText: "Add Your Task"
                        ),
                      ),
                    ),
                  ),

                  // Task Description Text Field Creation
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                    height: 202,
                      width: 500,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        maxLength: 150,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Task Description",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Add Task Description Within 150 Characters"
                        ),
                      ),
                      ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,          // The total height of the widget (includes empty space above/below the line)
              thickness: 2,        // The actual thickness of the line itself
              indent: 20,           // Empty space to the left of the line
              endIndent: 20,        // Empty space to the right of the line
              color: Colors.grey,   // The color of the line
            )
          ],
        ),
      ),
    );
  }
}
