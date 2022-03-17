class Book {
  late int? id;
  late String title;
  late String status;
  late String rangkuman;
  late bool horror;
  late bool petualangan;
  late bool komedi;
  late bool fiksi;

  Book({
    this.id,
    required this.title,
    required this.status,
    required this.rangkuman,
    this.horror = true,
    this.petualangan = true,
    this.komedi = false,
    this.fiksi = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'rangkuman': rangkuman,
      'horror': horror,
      'petualangan': petualangan,
      'komedi': komedi,
      'fiksi': fiksi,
    };
  }

  Book.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    status = map['status'];
    rangkuman = map['rangkuman'];
    horror = map['horror'];
    petualangan = map['petualangan'];
    komedi = map['komedi'];
    fiksi = map['fiksi'];
  }
}
