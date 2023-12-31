@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interfaces - Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKING_5263
  as select from ztb_booking_5263 as Booking
  composition [0..*] of Z_I_BOOKSUPPL_5263 as _BookingSupplement
  association        to parent Z_I_TRAVEL_5263    as _Travel on $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Customer    as _Customer      on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier     as _Carrier       on $projection.CarrierId = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection  as _Connection    on $projection.ConnectionId = _Connection.ConnectionID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
