class MovieVideoEntity {
    String iso6391;
    String iso31661;
    String name;
    String key;
    String site;
    int size;
    String type;
    bool official;
    DateTime publishedAt;
    String id;

    MovieVideoEntity({
        required this.iso6391,
        required this.iso31661,
        required this.name,
        required this.key,
        required this.site,
        required this.size,
        required this.type,
        required this.official,
        required this.publishedAt,
        required this.id,
    });

}
