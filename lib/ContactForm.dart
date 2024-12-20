import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  String gender = '';
  String contactMethod = 'Email';
  bool isSubscribed = false;

  void _submitForm() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      _showDialog('Error', 'Please fill out all fields.');
    } else if (!email.contains('@') || !email.contains('.')) {
      _showDialog('Error', 'Please enter a valid email.');
    } else {
      _showDialog(
        'Form Submitted',
        'Name: $name\n'
            'Email: $email\n'
            'Gender: $gender\n'
            'Preferred Contact Method: $contactMethod\n'
            'Subscribed: ${isSubscribed ? "Yes" : "No"}',
      );
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    setState(() {
      gender = '';
      contactMethod = 'Email';
      isSubscribed = false;
    });
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1 - Contact Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            const Text('Gender:'),
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Female'),
                Radio(
                  value: 'Other',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Preferred Contact Method:'),
            DropdownButton<String>(
              value: contactMethod,
              onChanged: (value) {
                setState(() {
                  contactMethod = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: 'Email', child: Text('Email')),
                DropdownMenuItem(value: 'Phone', child: Text('Phone')),
                DropdownMenuItem(value: 'SMS', child: Text('SMS')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isSubscribed,
                  onChanged: (value) {
                    setState(() {
                      isSubscribed = value!;
                    });
                  },
                ),
                const Text('Subscribe to newsletter'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _clearForm,
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
