import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/common/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.hotel});
  final HotelModel hotel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Gap(40),
          _buildAppBar(),
          Gap(24),
          _buildImage(),
          Gap(16),
          _buildFacilities(),
          Gap(24),
          _buildMainInfo(),
          Gap(10),
          _buildDescription(),
          Gap(22),
          _buildPreview(),
        ],
      ),
      bottomNavigationBar: _buildBooking(),
    );
  }
  
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xffECECEC), width: 1),
              ),
            ),
            fixedSize: WidgetStatePropertyAll(Size(40, 40)),
          ),
          icon: SvgPicture.asset(
              'assets/svg/icons/arrow-left.svg',
              height: 24,
              width: 24,
              color: Color(0xff000000),            
            )
        ),
        Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.blackNormal,
          ),
        ),
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xffECECEC), width: 1),
              ),
            ),
            fixedSize: WidgetStatePropertyAll(Size(40, 40)),
          ),
          icon: SvgPicture.asset(
            'assets/svg/icons/more.svg',
            height: 24,
            width: 24,
            color: Color(0xff000000),            
          )
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.hotel.image,
            height: 216,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: IconButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              fixedSize: WidgetStatePropertyAll(Size(32, 32)),
            ),
            icon: SvgPicture.asset(
              'assets/svg/icons/heart-bold.svg',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFacilities() {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildFacilityItem(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/icons/wifi-square.svg',
                height: 20,
                width: 20,
                color: AppColors.blackNormal
              ),
              Gap(6),
              Text(
                'Free Wifi',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
        ),
        _buildFacilityItem(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/icons/coffee.svg',
                height: 20,
                width: 20,
                color: AppColors.blackNormal
              ),
              Gap(6),
              Text(
                'Free Breakfast',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
        ),
        _buildFacilityItem(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/icons/star-filled.svg',
                height: 20,
                width: 20,
                color: AppColors.accentYellow,
              ),
              Gap(6),
              Text(
                '${widget.hotel.rating}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFacilityItem(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.accentBlue,
      ),
      child: child,
    );
  }

  Widget _buildMainInfo() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.hotel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.blackNormal,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  NumberFormat.currency(
                    decimalDigits: 1,
                    symbol: '\$',
                    locale: 'en_US',
                  ).format(widget.hotel.price),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryNormal,
                  ),
                ),
                Text(
                  ' /night',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackLighter,
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(8),
        Row(
          children: [
            SvgPicture.asset(
              'assets/svg/icons/location.svg',
              height: 18,
              width: 18,
              color: AppColors.primaryNormal,
            ),
            Gap(8),
            Text(
              widget.hotel.address,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.blackLighter,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.blackNormal,
          ),
        ),
        Gap(8),
        ReadMoreText(
          widget.hotel.description,
          trimMode: TrimMode.Length,
          trimLength: 140,
          trimCollapsedText: 'Read More',
          trimExpandedText: 'Read Less',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: AppColors.blackLighter,
          ),
          moreStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryNormal,
          ),
          lessStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryNormal,
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preview',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.blackNormal,
          ),
        ),
        Gap(8),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          childAspectRatio: 1.5,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children:
              widget.hotel.preview.map((e) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(e, fit: BoxFit.cover),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildBooking() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      child: SizedBox(
        height: 56,
        child: FilledButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text(
            'Booking Now',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
