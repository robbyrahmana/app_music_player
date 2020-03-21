class MusicModel {
  final int id;
  final String title;
  final String album;
  final double duration;

  MusicModel({this.id, this.title, this.album, this.duration});

  static List<MusicModel> list = [
    MusicModel(
      id: 1,
      title: "Helix",
      album: "Flume",
      duration: 60,
    ),
    MusicModel(
      id: 2,
      title: "Never Be Like You",
      album: "Flume - Kai",
      duration: 60,
    ),
    MusicModel(
      id: 3,
      title: "Lose It",
      album: "Flume - Vic Mensa",
      duration: 60,
    ),
    MusicModel(
      id: 4,
      title: "Numb & Getting Colder",
      album: "Flume - KUCKA",
      duration: 60,
    ),
    MusicModel(
      id: 5,
      title: "Say It",
      album: "Flume - Tove Lo",
      duration: 60,
    ),
    MusicModel(
      id: 6,
      title: "Wall F*ck",
      album: "Flume",
      duration: 60,
    ),
    MusicModel(
      id: 7,
      title: "Pika",
      album: "Flume",
      duration: 60,
    )
  ];
}
