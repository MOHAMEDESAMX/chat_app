class UsersModel {
  final String username;
  final String imageUrl;
  final String number;
  final String time;
  final String notificatonNumber;

  UsersModel(
    this.imageUrl,
    this.number,
    this.time,
    this.notificatonNumber, {
    required this.username,
  });
}
