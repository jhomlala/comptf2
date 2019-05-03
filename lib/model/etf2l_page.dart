class Etf2lPage {
  int entriesPerPage;
  int page;
  int totalPages;
  String nextPageUrl;

  Etf2lPage({
    this.entriesPerPage,
    this.page,
    this.totalPages,
    this.nextPageUrl,
  });

  factory Etf2lPage.fromJson(Map<String, dynamic> json) => new Etf2lPage(
    entriesPerPage: json["entries_per_page"],
    page: json["page"],
    totalPages: json["total_pages"],
    nextPageUrl: json["next_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "entries_per_page": entriesPerPage,
    "page": page,
    "total_pages": totalPages,
    "next_page_url": nextPageUrl,
  };
}