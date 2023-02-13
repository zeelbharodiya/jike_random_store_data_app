class Jokes {
  final String iconurl;
  final String url;
  final String value;
  final List catagory;

  Jokes({
    required this.iconurl,
    required this.url,
    required this.value,
    required this.catagory,
 });

  factory Jokes.fromjson({required Map data}) => Jokes(
    iconurl: data['icon_url'],
    url: data['url'],
    value: data['value'],
    catagory: data['categories'],
  );
}