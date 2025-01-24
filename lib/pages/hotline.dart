import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinePage extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {"title": "জরুরী সেবা", "number": "999"},
    {"title": "তথ্য সেবা", "number": "333"},
    {"title": "শিশু সহায়তা", "number": "1098"},
    {"title": "নারী ও শিশু নির্যাতন 1", "number": "109"},
    {"title": "নারী ও শিশু নির্যাতন 2", "number": "10921"},
    {"title": "সরকারী আইন সেবা", "number": "16430"},
    {"title": "ফায়ার সার্ভিস 1", "number": "102"},
    {"title": "ফায়ার সার্ভিস 2", "number": "16163"},
    {"title": "দুর্যোগের আগাম বার্তা", "number": "10941"},
    {"title": "দুদক হটলাইন", "number": "106"},
    {"title": "টেলিমেডিসিন নম্বর", "number": "16263"},
    {"title": "Legal Guardians", "number": "Contact List"},
  ];

  // Function to make a call
  void _makeCall(String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotline'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: hotlines.length,
        itemBuilder: (context, index) {
          final hotline = hotlines[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              title: Text(
                hotline['title']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                hotline['number']!,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.phone, color: Colors.white),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle case where number might contain non-numeric characters
                  String? number = hotline['number'];
                  if (number != null && RegExp(r'^\d+$').hasMatch(number)) {
                    _makeCall(number);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Invalid number for ${hotline['title']}'),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'Call',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
