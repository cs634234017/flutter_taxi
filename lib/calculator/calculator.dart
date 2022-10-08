class Calculator {
  static int _carTax = 0;

  static int car({required int km, required int passenger}) {
    double tax1 = 0;

    if (km < 1) {
      tax1 = tax1 + 35;
    } else if (km >= 1 && km <= 10) {
      tax1 = km * 7;
    } else if (km > 10 && km <= 20) {
      tax1 = km * 6;
    } else if (km > 20 && km <= 30) {
      tax1 = km * 5;
    } else if (km > 30 && km <= 100) {
      tax1 = km * 4;
    }

    double reduceTax = 0;
    if (passenger == 2) {
      reduceTax = reduceTax + 10;
    } else if (passenger == 3) {
      reduceTax = reduceTax + 30;
    } else if (passenger == 4) {
      reduceTax = reduceTax + 50;
    }

    _carTax = (tax1 + reduceTax).toInt();
    return _carTax;
  }

  static int van(int passenger) {
    double tax3;
    if (passenger == 1800) {
      tax3 = 1300;
    } else {
      tax3 = 1600;
    }
    _carTax = tax3.toInt();
    return _carTax;
  }
}
