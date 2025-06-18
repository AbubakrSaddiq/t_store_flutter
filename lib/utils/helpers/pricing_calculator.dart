class StorePriceCalculator{
  ///calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static double getTaxRateForLocation(String location) {
    return 0.10; //get tax from API or db. example 10% tax rate
  }

  static double getShippingCost(loaction) {
    return 5.00; //shipping cost is N5
  }
  ///calculate shipping cost
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }
  ///calculate tax
  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

}