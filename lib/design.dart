import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget{
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _AppDesign();
}

class _AppDesign extends State<TodoApp>{
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.asset("assets/images/bg.avif",
        fit: BoxFit.cover),
        shape : RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top : Radius.circular(30)
          ),
        ),
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
                        controller: name,
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
                        controller: desc,
                        maxLines: null,
                        expands: true,
                        maxLength: 150,
                        textAlignVertical: TextAlignVertical.top,
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
            SizedBox(height: 10),
            //Add Task Button Creation
            ElevatedButton(onPressed: (){
              String taskName = name.text;
              String description = desc.text;
              debugPrint(desc.text);
              }, style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(146, 49, 237, 1.0),
              fixedSize: Size(250, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
            ),
                child: Text("Add Task",
                style: TextStyle(
                  color: Colors.white
                ),
                )),
            SizedBox(height : 20),
            const Divider(
              height: 20,          // The total height of the widget (includes empty space above/below the line)
              thickness: 2,        // The actual thickness of the line itself
              indent: 20,           // Empty space to the left of the line
              endIndent: 20,        // Empty space to the right of the line
              color: Color.fromRGBO(37, 1, 62, 1.0)   // The color of the line
            ),
            Align(
                alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Your Tasks : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
