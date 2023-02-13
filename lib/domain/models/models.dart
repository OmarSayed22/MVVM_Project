class SliderObjectModel {
  final String title;
  final String subTitle;
  final String image;

  SliderObjectModel(
      {required this.title, required this.subTitle, required this.image});
}

// have data that pass from viewModel to view
class SliderViewObject {
  final SliderObjectModel sliderObjectModel;
  final int noOfSlides;
  final int currentIndex;

  const SliderViewObject(
      {required this.sliderObjectModel,
      required this.noOfSlides,
      required this.currentIndex});
}

// login Model
class Customer {
  int id;
  String name;
  int noOfNotifications;

  Customer(this.id, this.name, this.noOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.email, this.phone, this.link);
}

class Authentication {
  String message;
  Customer? customer;
  Contacts? contacts;

  Authentication(this.message, this.contacts, this.customer);
}

class ForgetPassword {
  String supportMessage;

  ForgetPassword(this.supportMessage);
}

class Services {
  int id;
  String title;
  String image;

  Services(this.id, this.title, this.image);
}

class Banners {
  int id;
  String link;
  String title;
  String image;

  Banners(this.id, this.link, this.title, this.image);
}

class Stores {
  int id;
  String title;
  String image;

  Stores(this.id, this.title, this.image);
}

class Data {
  List<Services> services;
  List<Banners> banners;
  List<Stores> stores;

  Data(this.services, this.banners, this.stores);
}

class HomeData {
  String message;
  Data data;

  HomeData(this.message, this.data);
}
