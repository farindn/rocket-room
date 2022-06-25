import 'package:money_formatter/money_formatter.dart';
import 'dart:math';

class RoomData {
  String name;
  String imageAsset;
  String location;
  String city;
  String description;
  String price;
  int bed;
  int bath;
  double distance;
  List<String> imageGallery;

  RoomData({
    required this.name,
    required this.imageAsset,
    required this.location,
    required this.city,
    required this.description,
    required this.price,
    required this.bed,
    required this.bath,
    required this.distance,
    required this.imageGallery,
  });
}

String descr =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi quam, bibendum non eleifend ut, ullamcorper vitae arcu. Fusce sit amet mauris suscipit lacus finibus posuere quis sed lectus. Sed facilisis orci vitae tristique efficitur. Mauris porttitor, felis vitae blandit hendrerit, magna mi convallis erat, ut viverra est ante id dolor.';

String randomPrice() {
  var random = Random();
  int min = 20000000;
  int max = 50000000;
  int result = (min + random.nextInt(max - min)).ceil();
  MoneyFormatter fmf = MoneyFormatter(amount: result.toDouble());
  MoneyFormatterOutput fo = fmf.output;
  fo.withoutFractionDigits;
  return fo.withoutFractionDigits.toString();
}

int randomBed() {
  var random = Random();
  int min = 2;
  int max = 6;
  int result = min + random.nextInt(max - min);
  return result;
}

int randomBath() {
  var random = Random();
  int min = 1;
  int max = 4;
  int result = min + random.nextInt(max - min);
  return result;
}

double randomDistance() {
  var random = Random();
  int min = 1;
  int max = 4;
  double result = (min + random.nextInt(max - min)).toDouble();
  return result;
}

var roomDataList = [
  RoomData(
      name: 'Orchad House',
      imageAsset: 'images/best-1.png',
      location: 'Jl. Bulevar Selatan',
      city: 'Bekasi',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: []),
  RoomData(
      name: 'The Hollies House',
      imageAsset: 'images/best-2.png',
      location: 'Jl. Rawa Tembaga',
      city: 'Bekasi',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: []),
  RoomData(
      name: 'Sea Breezes House',
      imageAsset: 'images/best-3.png',
      location: 'Jl. Pahlawan Revolusi',
      city: 'East Jakarta',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: []),
  RoomData(
      name: 'Dreamsville House',
      imageAsset: 'images/near-you-1.png',
      location: 'Jl. Sultan Iskandar Muda',
      city: 'South Jakarta',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: []),
  RoomData(
      name: 'Ascot House',
      imageAsset: 'images/near-you-2.png',
      location: 'Jl. Cilandak Tengah',
      city: 'South Jakarta',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: []),
  RoomData(
      name: 'Talavera House',
      imageAsset: 'images/near-you-3.jpeg',
      location: 'Jl. Fatmawati Raya',
      city: 'South Jakarta',
      description: descr,
      price: randomPrice(),
      bed: randomBed(),
      bath: randomBath(),
      distance: randomDistance(),
      imageGallery: [])
];
