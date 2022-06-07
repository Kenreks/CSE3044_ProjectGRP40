import 'package:project_unihub/Models/UserModel.dart';
import 'package:project_unihub/screens/Login/components/body.dart';

class Message {
  final UserModel sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final UserModel currentUser =
    UserModel("0", "Curren User", "adfadgadg@gmail.com", password);

// USERS
final UserModel software =
    UserModel("1", "Software Engineering", "adfadgadg@gmail.com", password);
final UserModel algo =
    UserModel("2", "Algorithm Analysis ", "adfadgadg@gmail.com", password);

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: software,
    time: '5:30 PM',
    text: 'thanks',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: algo,
    time: '11:30 AM',
    text: 'OK',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: software,
    time: 'Ahmet',
    text: 'Thanks',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: 'You',
    text: 'I have some documants I will send it.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: software,
    time: "Mehmet",
    text: 'I need too',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: software,
    time: "Kemal",
    text: 'Do you have SW document for exam ?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Thanks, what about you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: software,
    time: "Mehmet",
    text: 'Hello Guys, How are you?',
    isLiked: false,
    unread: true,
  ),
];
