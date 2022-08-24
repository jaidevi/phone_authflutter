//import 'package:family/todo/addtodo.dart';
//import 'package:family/todo/custom/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/todo/addtodo.dart';
import 'package:phone_auth/todo/custom/todo_card.dart';

class HomeTodoPage extends StatefulWidget {
  const HomeTodoPage({ Key? key }) : super(key: key);

  @override
  State<HomeTodoPage> createState() => _HomeTodoPageState();
}

class _HomeTodoPageState extends State<HomeTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Today's Schedule",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/mimi7.gif"),
          ),
          SizedBox(
            width: 25,
          ),
        ],
        bottom: PreferredSize(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                "Monday 06",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                ),
            ),
          ), preferredSize: Size.fromHeight(35),
            ),

      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black87,
      //   items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //           size: 32,
      //           color: Colors.white,
      //         ),
      //         //title: Container(),
      //         ),
      //         BottomNavigationBarItem(
      //         icon: Container(
      //           height: 52,
      //           width: 52,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             gradient: LinearGradient(
      //               colors: [
      //                 Colors.indigoAccent,
      //                   Colors.purple,                  
      //               ],
      //                ),
      //           ),
      //           child:Icon(
      //           Icons.add,
      //           size: 32,
      //           color: Colors.white,
      //         ),
      //         //title: Container(),
      //         ),
      //         ),
      //         BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.settings,
      //           size: 32,
      //           color: Colors.white,
      //         ),
      //         title: Container(),
      //         ),
      // ]),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TodoCard(
                title: "wake up Bro",
                check: true,
                iconBgColor: Colors.white,
                iconColor: Colors.red,
                iconData: Icons.alarm,
                //selected: true,
                time: "10 AM",
              ),
              SizedBox(height: 10,),
              TodoCard(
                title: "Let's do Gym",
                check: false,
                iconBgColor: Color(0xff2cc8d9),
                iconColor: Colors.white,
                iconData: Icons.run_circle,
                //selected: true,
                time: "11 AM",
              ),
              SizedBox(height: 10,),
              TodoCard(
                title: "Buy Some Food",
                check: false,
                iconBgColor: Color(0xfff19733),
                iconColor: Colors.white,
                iconData: Icons.local_grocery_store,
                //selected: true,
                time: "12 AM",
              ),
              SizedBox(height: 10,),
              TodoCard(
                title: "Testing Something",
                check: false,
                iconBgColor: Color(0xffd3c2b9),
                iconColor: Colors.white,
                iconData: Icons.audiotrack,
                //selected: true,
                time: "13 AM",
              ),
              //SizedBox(height: 10,),
            ]),
          ),
          ),
          floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
        tooltip: 'Increment',
        label: Text('Add'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}