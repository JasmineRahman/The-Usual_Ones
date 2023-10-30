import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

typedef SendAnnouncementCallback = void Function(String message, List<PlatformFile>? attachments);
class AnnouncementPage extends StatefulWidget {
  final SendAnnouncementCallback sendAnnouncementCallback;
  final Function(String) updateAnnouncementMessage;

  AnnouncementPage({
    required this.sendAnnouncementCallback,
    required this.updateAnnouncementMessage,
  });

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}


class _AnnouncementPageState extends State<AnnouncementPage> {
  String announcementMessage = "";
  List<PlatformFile>? attachments = [];

  void sendAnnouncement() {
    // Send the announcement message and attachments
    widget.sendAnnouncementCallback(announcementMessage, attachments);
    Navigator.pop(context);
  }
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        attachments = result.files;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement Page'),
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height:250,
              child: TextField(
                onChanged: (value) {
                  widget.updateAnnouncementMessage(value);
                },
                maxLines: null,
                decoration: InputDecoration(hintText: 'Enter your announcement message'),
              ),
            ),


            ElevatedButton(
              onPressed: pickFiles,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black38), // Change the button color
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.attach_file, color: Colors.white), // Add an icon
                  SizedBox(width: 8), // Add some spacing between the icon and text
                  Text(
                    'Attach Files',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Make the text bold
                      color: Colors.white, // Change the text color
                    ),
                  ),
                ],
              ),
            ),
            Text('Attachments: ${attachments?.length ?? 0}'), // Safely access attachments
            ElevatedButton(
              onPressed: sendAnnouncement,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey), // Change the button color
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.send, color: Colors.white), // Add an icon
                  SizedBox(width: 8), // Add some spacing between the icon and text
                  Text(
                    'Send Announcement',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Make the text bold
                      color: Colors.white, // Change the text color
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
