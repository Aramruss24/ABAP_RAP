@EndUserText.label: 'Consumption - Bookin Supplement'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPL_5263
  as projection on Z_I_BOOKSUPPL_5263
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      /* Associations */
      _Booking : redirected to parent Z_C_BOOKING_5263,
      _Product,
      _SupplementText,
      _Travel : redirected to Z_C_TRAVEL_5263
}
