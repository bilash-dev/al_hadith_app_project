class HadithModel {
  var hadithId;
  var bookId;
  var bookName;
  var chapterId;
  var sectionId;
  var narrator;

  HadithModel({
    required this.hadithId,
    this.bookId,
    this.bookName,
    this.chapterId,
    this.sectionId,
    this.narrator,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) =>
      HadithModel(
        hadithId: json["hadith_id"],
        bookId: json["book_id"],
        bookName: json["book_name"],
        chapterId: json["chapter_id"],
        sectionId: json["section_id"],
        narrator: json["narrator"],
      );
}