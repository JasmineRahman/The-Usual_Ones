import 'package:flutter/material.dart';
import 'admin_student.dart';
class HostelSelectionPage extends StatelessWidget {
  final List<String> images = [
    'assets/images/boy.jpg',
    'assets/images/girl.jpg',
  ];

  final List<String> labels = [
    'Boys Hostel    >>',
    'Girls Hostel    >>',
  ];

  final List<Widget> pages = [
    SelectionPage(), // Ensure SelectionPage is properly implemented
    SelectionPage(), // Ensure SelectionPage is properly implemented
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Hostel'),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Carousel(
                  images: images.map((image) => AssetImage(image)).toList(),
                  labels: labels,
                  onDotTap: (index) {
                    // Navigate to the respective SelectionPage when an item is tapped
                    Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));
                  },
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize: MaterialStateProperty.all(Size(120, 40)),
                ),
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final List<AssetImage> images;
  final List<String> labels;
  final Function(int index) onDotTap;

  Carousel({Key? key, required this.images, required this.labels, required this.onDotTap}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  // Define hostel details
  final List<String> hostelDetails = [
    '\n\n\n\nClosing Time: 10:00 PM\n\nRule -1: No visitors after 9:00 PM\nRule -2: Don’t turn on the lights unnecessarily in the dorms\n...............\n\nFor Queries Contact:9876543210',
    '\n\n\n\nClosing Time: 11:00 PM\n\nRule -1: Visitors allowed until 10:30 PM\nRule-2: Don’t turn on the lights unnecessarily in the dorms\n..............\n\n For Queries  Contact:9876543210',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 200, // Adjust the height as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.labels[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      hostelDetails[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return GestureDetector(
              onTap: () {
                widget.onDotTap(index); // Trigger the callback when a dot is tapped
              },
              child: Container(
                margin: EdgeInsets.all(4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.black : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
