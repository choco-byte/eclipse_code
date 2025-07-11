import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedPayment = 'GoPay';

  final Map<String, String> paymentLogos = {
    'GoPay': 'gopay.png',
    'OVO': 'ovo.png',
    'ShopeePay': 'shopeepay.png',
    'BCA Virtual Account': 'bca.png',
    'BRI Virtual Account': 'bri.png',
  };

  final List<String> eWallets = ['GoPay', 'OVO', 'ShopeePay'];
  final List<String> virtualAccounts = ['BCA Virtual Account', 'BRI Virtual Account'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1113),
        title: Text(
          'Payment Methods',
          style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('E-Wallet'),
          Divider(thickness: 1),
          ...eWallets.asMap().entries.map((entry) {
            int index = entry.key;
            String e = entry.value;
            return buildPaymentOption(e, index == eWallets.length - 1);
          }).toList(),
          Align(
            alignment: Alignment.centerRight, 
            child: Container(
              width: screenWidth * 0.9,
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          sectionTitle('Virtual Account'),
          Divider(thickness: 1),
          ...virtualAccounts.asMap().entries.map((entry) {
            int index = entry.key;
            String v = entry.value;
            return buildPaymentOption(v, index == virtualAccounts.length - 1);
          }).toList(),
          Spacer(),
        ],
      ),
      
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: screenWidth * 0.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedPayment.isNotEmpty ? Color(0xFF7B1113) : Colors.grey, // Ubah warna jika non-aktif
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: _selectedPayment.isNotEmpty ? () {
            Navigator.pop(context, _selectedPayment); // Return the selected payment method
          } : null, // Non-aktif jika belum ada pilihan
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: screenWidth*0.04, left: screenWidth*0.03),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth*0.05)),
    );
  }

  Widget buildPaymentOption(String label, bool isLast) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: RadioListTile<String>(
            value: label,
            groupValue: _selectedPayment,
            onChanged: (val) {
              setState(() {
                _selectedPayment = val!;
              });
            },
            title: Text(
              label,
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w500),
            ),
            secondary: Image.asset(
              paymentLogos[label] ?? 'assets/images/default.png',
              width: screenWidth * 0.07,
              height: screenWidth * 0.07,
            ),
            controlAffinity: ListTileControlAffinity.trailing, // radio button di kanan
          ),
        ),
        if (!isLast)
          Align(
            alignment: Alignment.centerRight, 
            child: Container(
              width: screenWidth * 0.9,
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
      ],
    );
  }
}
