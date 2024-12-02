class NotesModel {
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime? updatedDate;

  NotesModel(this.createdDate, this.updatedDate,
      {required this.title, required this.description});
}
