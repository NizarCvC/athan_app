enum SupportedCurrency {
  usd, eur, gbp, sar, aed, kwd, qtr, omr, bhd, jod, egp, 
  mad, dzd, tnd, tryCurrency, pkr, inr, bdt, myr, idr;

  String get code => this == SupportedCurrency.tryCurrency ? 'try' : name;
}
