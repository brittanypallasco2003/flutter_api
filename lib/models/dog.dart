class Dog {
  final String imageUrl;
  final String imageLink;

  Dog({required this.imageUrl, required this.imageLink});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      imageUrl: json['message'],
      imageLink: json['message'],
    );
  }
}
