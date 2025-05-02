import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking_app/models/stay.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/pages/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<StayModel> staysData = StayModel.getStays();
  final List<HotelModel> hotelsData = HotelModel.getHotels();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0.3),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            current(),
            stay(),
            near(),
            popular(),
          ]
        ),
      ),
    );
  }

  Container current(){    
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current location',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(124, 124, 124, 1)
                  )
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/icons/location.svg',
                      colorFilter:  ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.none,
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      height: 24,
                      width: 8,
                    ),
                    Text(
                      'Wallace, Australia',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      )
                    )
                  ]
                )
              ]
            ),
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(124, 124, 124, 0.3),
                )
              ),
              child: SvgPicture.asset(
                'assets/svg/icons/notification-bing.svg',
                fit: BoxFit.none
              ),
            )
        ]
      ),
    );
  }

  Container stay() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: staysData.length,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                for (var i in staysData){
                  i.isSelected = false;
                }
                staysData[index].isSelected = true;
                setState((){});
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: staysData[index].isSelected 
                  ? Theme.of(context).colorScheme.primary
                  : Color.fromRGBO(225, 225, 225, 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      staysData[index].icon,
                      color: staysData[index].isSelected 
                      ? Colors.white 
                      : Colors.grey,
                      size: 24
                    ),
                    const SizedBox(width: 8),
                    Text(
                      staysData[index].type,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: staysData[index].isSelected 
                        ? Colors.white 
                        : Colors.grey,
                        )
                    )
                  ]
                )
              )
            );
          },
        ),
      )
    );
  }

  Container near() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )
              ),
              GestureDetector(
                onTap: () {
                  print('Nhấn See all Neer Location');
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                )
              )
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 290,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: hotelsData.length,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(hotel: hotelsData[index]))
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              hotelsData[index].image,
                              height: 180,
                              width: 260,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hotelsData[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/icons/star-filled.svg',
                                        colorFilter: ColorFilter.mode(
                                          Color(0xFFFFD33C),
                                          BlendMode.srcIn,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        hotelsData[index].rating.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                        )
                                      )
                                    ]
                                  )
                                ]
                              ),
                              Text(
                                hotelsData[index].address,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF939393)
                                )
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    '\$' + hotelsData[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                  Text(
                                    '/night',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF939393)
                                    )
                                  )
                                ],
                              )
                            ]
                          )
                        )

                      ]
                    )
                  )
                );
              }
            )
          )
        ]
      )
    );
  }

  Container popular() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Hotel',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )
              ),
              GestureDetector(
                onTap: () {
                  print('Nhấn See all Popular Hotel');
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                )
              )
            ],
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: List.generate(hotelsData.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage( hotel: hotelsData[index]))
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 108,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            hotelsData[index].image,
                            fit: BoxFit.cover,
                          )       
                        )             
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hotelsData[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/icons/star-filled.svg',
                                        colorFilter: ColorFilter.mode(
                                          Color(0xFFFFD33C),
                                          BlendMode.srcIn,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        hotelsData[index].rating.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                        )
                                      )
                                    ]
                                  )
                                ]
                              ),
                              Text(
                                hotelsData[index].address,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF939393)
                                )
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    '\$' + hotelsData[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                  Text(
                                    '/night',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF939393)
                                    )
                                  )
                                ],
                              )
                            ]
                          )
                        ),
                      )
                    ]
                  )
                )   
              );
            }
            ) 
          )
          ),
        ]
      )
    );
  }
}
