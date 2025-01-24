import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Telemedicine extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {"name": "Dr. John Doe", "phone": "1234567890", "email": "john@example.com", "address": "123 Health St, City A", "image": "assets/doctors/demo.jpg"},
    {"name": "Dr. Jane Smith", "phone": "9876543210", "email": "jane@example.com", "address": "456 Wellness Ave, City B", "image": "assets/jane_smith.jpg"},
    // Add more doctors here...
  ];

  // Function to make a call
  void _makeCall(String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      print('Could not launch $number');
    }
  }

  // Function to send an email
  void _sendEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      print('Could not launch $email');
    }
  }

  // Function to show contact options dialog
  void _showContactOptions(BuildContext context, String name, String phone, String email, String address, String image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Contact $name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image), // Display the doctor's image
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call $phone'),
                onTap: () {
                  _makeCall(phone);
                  Navigator.pop(context); // Close the dialog
                },
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email $email'),
                onTap: () {
                  _sendEmail(email);
                  Navigator.pop(context); // Close the dialog
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address: $address'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telemedicine'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(
                doctor['name']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    doctor['address']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        doctor['phone']!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        doctor['email']!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(doctor['image']!), // Use the same image as in the dialog
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                _showContactOptions(
                  context,
                  doctor['name']!,
                  doctor['phone']!,
                  doctor['email']!,
                  doctor['address']!,
                  doctor['image']!, // Pass image to the dialog
                );
              },
            ),
          );
        },
      ),
    );
  }
}
