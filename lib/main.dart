import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class Page1 extends StatefulWidget{



  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {




  var currentstate = 0;
  List<Widget> widgets = [Center(child: Text("1", style: TextStyle(fontSize: 32),)),Center(child: Text('2', style: TextStyle(fontSize: 32),)),];

  void initState(){
    super.initState();
    widgets.add(Center(
      child: OutlinedButton(onPressed: (){setState(() {
  currentstate = 0;
});
}, child: Text("Push me!")),
    ));
  }

  @override
  Widget build(BuildContext context){return Scaffold(body: widgets[currentstate],
  bottomNavigationBar: BottomNavigationBar(currentIndex: currentstate,items: [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "first"),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "second"),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "third")],onTap: (newstate){
 setState(() {
   currentstate = newstate;
 });
  } ,),);}
}

class Page2 extends StatefulWidget{



  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {




  var currentstate = 0;
  List<Widget> widgets = [Center(child: Text("1", style: TextStyle(fontSize: 32),)),Center(child: Text('2', style: TextStyle(fontSize: 32),)),];

  void initState(){
    super.initState();
    widgets.add(Center(
      child: OutlinedButton(onPressed: (){setState(() {
        currentstate = 0;
      });
      }, child: Text("Push me!")),
    ));
  }

  @override
  Widget build(BuildContext context){return Scaffold(body: widgets[currentstate],
    bottomNavigationBar: NavigationBar(selectedIndex: currentstate , destinations: [
      NavigationDestination(icon: Icon(Icons.home), label: ""),
      NavigationDestination(icon: Badge(child:Icon(Icons.home), label: Text("99+"),), label: "Label", ),
      NavigationDestination(icon: Badge(child:Icon(Icons.home), label: null,), label: "")
    ], onDestinationSelected: (newstate){
      setState(() {
        currentstate = newstate;
      });
    } , ),
  );}
}






class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

late TabController controllera = TabController(length: 3, vsync: this);

  var currentindex1 = 0;
  var widgets = [];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(appBar: AppBar(bottom: TabBar(tabs: [
      Tab(icon: Icon(Icons.looks_one_rounded),),
      Tab(icon: Icon(Icons.looks_two_rounded)),
        Tab(icon: Icon(Icons.three_g_mobiledata)),
    ],
    controller: controllera,

    ),),
    body: TabBarView(children: [
    Page1(),
      Page2(),
      Center(child: OutlinedButton(child: Text("Push me!"),onPressed: (){controllera.animateTo(0);},),)

    ],controller: controllera,)));
  }
}
