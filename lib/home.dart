import 'package:flutter/material.dart';
import 'hostel_selection_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool showAnnouncement = false; // Define the variable to control visibility
  String announcementMessage = "";
  void updateAnnouncement(String message) {
    setState(() {
      announcementMessage = message;
      showAnnouncement = true; // Show the announcement
    });
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showAnnouncement = false; // Hide the announcement after 10 seconds
      });
    });
  }
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _widthController.forward();
        }
      });

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0,
    ).animate(_widthController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionController.forward();
        }
      });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 215.0,
    ).animate(_positionController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            hideIcon = true;
          });
          _scale2Controller.forward();
        }
      });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scale2Animation = Tween<double>(
      begin: 1.0,
      end: 32.0,
    ).animate(_scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HostelSelectionPage()),
          );
        }
      });
  }

  void displayNotificationDialog(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome To TCE Hostel",
                    style: TextStyle(color: Colors.white70, fontSize: 55),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Discipline is consistency of action",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      height: 1.4,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 180),
                  ElevatedButton(
                    onPressed: () {
                      _scaleController.forward();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text('Select Hostel >>'),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: showAnnouncement,
                    child: Text(
                      'Announcement: $announcementMessage',
                      style: TextStyle(
                        color: Colors.white, // Change text color to white
                        fontSize: 24, // Change font size
                        fontWeight: FontWeight.bold, // Make text bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
