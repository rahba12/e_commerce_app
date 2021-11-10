import 'package:e_commerce_app/view/shipping_address_view/build_list_of_shipping_addressl.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A34E),
        title: const Text('Shipping Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Shipping Addresses',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: list.keys.map((String key) {
                  return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(key),
                      value: list[key],
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          list[key] = value!;
                          selectedItems.clear();
                          list.forEach(
                            (key, value) {
                              // print('$key: $value');
                              if (value) {
                                selectedItems.add(Data(key, value));
                              }
                            },
                          );
                        });
                        // print(key);
                      });
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
