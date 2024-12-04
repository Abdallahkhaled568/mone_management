import 'package:flutter/material.dart';

class ExchangeScreen extends StatefulWidget {
  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final TextEditingController amountController = TextEditingController();
  String sourceCurrency = "LBP";
  String targetCurrency = "USD";
  double? convertedAmount;

  final Map<String, double> exchangeRates = {
    "LBP": 1.0,
    "USD": 0.01124,
    "TRY": 0.00187,
    "EUR": 0.000331,
    "GBP": 0.000387,
    "AUD": 0.000201,
    "JPY": 0.00281,
    "CAD": 0.00025,
  };

  final Map<String, String> currencyFlags = {
    "LBP": "🇱🇧",
    "USD": "🇺🇸",
    "TRY": "🇹🇷",
    "EUR": "🇪🇺",
    "GBP": "🇬🇧",
    "AUD": "🇦🇺",
    "JPY": "🇯🇵",
    "CAD": "🇨🇦",
  };

  void convertCurrency() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    double sourceRate = exchangeRates[sourceCurrency]!;
    double targetRate = exchangeRates[targetCurrency]!;
    setState(() {
      convertedAmount = (amount / sourceRate) * targetRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Money'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/money_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount in $sourceCurrency',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: sourceCurrency,
                    items: exchangeRates.keys.map((currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text('${currencyFlags[currency]} $currency'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        sourceCurrency = value!;
                      });
                    },
                  ),
                  Icon(Icons.swap_horiz, size: 32),
                  DropdownButton<String>(
                    value: targetCurrency,
                    items: exchangeRates.keys.map((currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text('${currencyFlags[currency]} $currency'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        targetCurrency = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: convertCurrency,
                child: Text('Convert'),
              ),
              Spacer(), // Pushes content to the bottom
              if (convertedAmount != null)
                Center(
                  child: Text(
                    'Converted Amount: $convertedAmount $targetCurrency',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}