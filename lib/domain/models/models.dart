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
  int phone;
  String email;
  String link;

  Contacts(this.email, this.phone, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.contacts, this.customer);
}
