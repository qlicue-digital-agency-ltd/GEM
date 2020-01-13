import '../adds.dart';

class AddsRepository {
  static List<Adds> loadAdds() {
    List<Adds> allAdds = <Adds>[
      Adds(
        id: 1,
        title: 'NMB Bank',
        link: 'https://qlicue.co.tz',
        image: 'assets/img/adds/nmb.jpeg',
      ),
      Adds(
        id: 2,
        title: 'Airtel',
        image: 'assets/img/adds/airtel.jpeg',
        link: 'https://qlicue.co.tz',
      ),
      Adds(
        id: 3,
        title: 'Azam TV',
        image: 'assets/img/adds/azam.png',
        link: 'https://qlicue.co.tz',
      ),
      Adds(
        id: 4,
        title: 'Vodacom',
        image: 'assets/img/adds/voda.jpeg',
        link: 'https://qlicue.co.tz',
      ),
      Adds(
        id: 5,
        title: 'Tigo',
        link: 'https://qlicue.co.tz',
        image: 'assets/img/adds/tigo.jpeg',
      ),
      Adds(
        id: 6,
        title: 'Air Tanzania',
        link: 'https://qlicue.co.tz',
        image: 'assets/img/adds/tanzania.png',
      ),
      Adds(
        id: 7,
        title: 'Resolution Insurance',
        link: 'https://qlicue.co.tz',
        image: 'assets/img/adds/resolution.jpg',
      ),
      Adds(
        id: 8,
        title: 'CRDB BANK',
        link: 'https://qlicue.co.tz',
        image: 'assets/img/adds/crdb.jpeg',
      ),
    ];
    return allAdds.toList();
  }
}
