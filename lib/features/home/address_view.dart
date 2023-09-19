import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/home_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';

class AddressViewCard extends StatefulWidget {
  const AddressViewCard({super.key, this.address});
  final Address? address;

  @override
  State<AddressViewCard> createState() => _AddressViewCardState();
}

class _AddressViewCardState extends State<AddressViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColors.bglightBlue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.maps_home_work,
                  color: AppColors.buttonBlue,
                ),
                addWidth(16),
                const Text('Address',
                    style: TextStyle(
                        color: AppColors.lable,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            addHeight(8),
            widget.address == null
                ? const Text('No Address Found',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                : Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(displayAddress(),
                        style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
            addHeight(8),
          ],
        ),
      ),
    );
  }

  displayAddress() {
    Address? address = widget.address;
    if (address != null) {
      String myaddress =
          '${address.streetName ?? ''}, ${address.buildingNumber == null ? '' : address.buildingNumber.toString()}, ${address.townName ?? ''}, ${address.postCode ?? ''}, ${address.country ?? ''}';
      return myaddress;
    } else {
      return 'No Address Found';
    }
  }
}
