class FilterOptions {
  String type;
  String country;
  String year;
  String genre;
  String rating;
  String sort;

  FilterOptions({
    this.type = "Movie",
    this.country = "India",
    this.year = "2024",
    this.genre = "All",
    this.rating = "All",
    this.sort = "All",
  });
}
