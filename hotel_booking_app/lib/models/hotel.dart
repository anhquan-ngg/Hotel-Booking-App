class HotelModel {
  final String name;
  final String address;
  final String description;
  final String image;
  final double rating;
  final double price;
  final List<String> preview;

  HotelModel({
    required this.name,
    required this.address,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.preview,
  });

  static List<HotelModel> getHotels(){
    List<HotelModel> hotels = [];

    hotels.add(HotelModel(
      name: 'The Aston Vill Hotel',
      address: 'Alice Spring NT 0870, Australia',
      description: 'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel, elegant 5 star hotel over looking the sea, perfect for a romantic, charming ...',
      image: 'assets/images/aston-vill-hotel.png',
      rating: 5.0,
      price: 200.7,
      preview: [
        'assets/images/3.png',
        'assets/images/4.png',
        'assets/images/5.png',
        'assets/images/asteria-hotel.png',
        'assets/images/aston-vill-hotel.png',
        'assets/images/golden-park.png',
      ]
    ));
    
    hotels.add(HotelModel(
      name: 'Golden Park',
      address: 'Northern Spring NT 0870, Australia',
      description: 'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel, elegant 5 star hotel over looking the sea, perfect for a romantic, charming ...',
      image: 'assets/images/golden-park.png',
      rating: 5.0,
      price: 175.9,
      preview: [
        'assets/images/3.png',
        'assets/images/4.png',
        'assets/images/5.png',
        'assets/images/asteria-hotel.png',
        'assets/images/aston-vill-hotel.png',
        'assets/images/golden-park.png',
      ]
    ));
    
    hotels.add(HotelModel(
      name: 'Asteria Hotel',
      address: 'Wilora NT 0872, Australia',
      description: 'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel, elegant 5 star hotel over looking the sea, perfect for a romantic, charming ...',
      image: 'assets/images/asteria-hotel.png',
      rating: 5.0,
      price: 165.3,
      preview: [
        'assets/images/3.png',
        'assets/images/4.png',
        'assets/images/5.png',
        'assets/images/asteria-hotel.png',
        'assets/images/aston-vill-hotel.png',
        'assets/images/golden-park.png',
      ]
    ));

    return hotels;
  }
}