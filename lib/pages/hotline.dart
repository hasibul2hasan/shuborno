import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinePage extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {"title": "জরুরী সেবা", "number": "999"},
    {"title": "তথ্য সেবা", "number": "333"},
    {"title": "শিশু সহায়তা", "number": "1098"},
    {"title": "নারী ও শিশু নির্যাতন", "number": "109/10921"},
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
        padding: EdgeInsets.all(8.0),
        itemCount: hotlines.length,
        itemBuilder: (context, index) {
          final hotline = hotlines[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                hotline['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(hotline['number']!),
              leading: Icon(Icons.phone, color: Colors.blue),
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
                child: Text('Call'),
              ),
            ),
          );
        },
      ),
    );
  }
}
