//import 'package:family/allControllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/allScreens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  @override

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/back.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Family",
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createFooterItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    //AuthController authController = AuthController();
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget build(BuildContext context) {
    var back;
    var assets;
    var images;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          // Changed this to a Column from a ListView
          children: <Widget>[
            _createHeader(),
            ListTile(title: Text('First item')),
            Expanded(
                child:
                    Container()), // Add this to force the bottom items to the lowest point
            Column(
              children: <Widget>[
                _createFooterItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    onTap: () => Navigator.pushReplacementNamed(context, '/')),
                _createFooterItem(
                    icon: Icons.exit_to_app,
                    text: 'Logout',
                    onTap: () async {Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginWithPhone()));}) //=> Navigator.pushReplacementNamed(context, '/'))
              ],
            ),
          ],
        ),

        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       const Text('This is the Drawer'),
        //       ElevatedButton(
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: const Text('Close Drawer'),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Stack(
                  children: const <Widget>[
                    Icon(Icons.notifications, color: Colors.white),
                    Positioned(
                      left: 13.0,
                      child: Icon(
                        Icons.brightness_1,
                        color: Colors.red,
                        size: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/back.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/mimi2.gif'),
                          iconSize: 100,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/mimi5.gif'),
                          iconSize: 100,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/mimi6.gif'),
                          iconSize: 100,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/mimi8.gif'),
                          iconSize: 100,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        //tooltip: 'Increment',
        label: Text('Next'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.green,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),
          label: 'Feed',
          backgroundColor: Colors.red,),
          BottomNavigationBarItem(icon: Icon(Icons.chat),
          label: 'Chat',
          backgroundColor: Colors.green,),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.green,),
        ],
      )
    );
  }

  
}