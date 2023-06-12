class NasaPicture {
  NasaPicture({
    required this.url, 
    required this.title
  });
  final String url;
  final String title;

  static List<Map<String, dynamic>> getJsonList(Map<String, dynamic> jsonData) {
    final Map<String, dynamic> collection = jsonData["collection"];
    final List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(collection["items"]);
    return jsonList;
  }

  factory NasaPicture.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> links = List<Map<String, dynamic>>.from(json["links"]);
    final Map<String, dynamic> link = links[0];
    final List<Map<String, dynamic>> allData = List<Map<String, dynamic>>.from(json["data"]);
    final Map<String, dynamic> data = allData[0];

    final String url = link["href"];
    final String title = data["title"];

    return NasaPicture(url: url, title: title);
  }
}