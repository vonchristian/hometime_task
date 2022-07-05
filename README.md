# Hometime API

A Rails API application that allows creating and updating a Reservation record from 2 different payloads with single API endpoint.
### Notes
1. Added params validations to ensure correct values and types are only allowed
2. Uses [`gem activeinteractions`](https://github.com/AaronLasseigne/active_interaction#validations) for command pattern in creating and updating reservations
3. Create a payload generator to parse the correct payload to create/update a reservation record
4. Uses the same POST endpoint in creating/updating a reservation
5. Clear error messages for easier debugging of issues (see specs for documentation)

## Install Dependencies
```
$ bundle install
```

## Setup the Database
```
$ rails db:create
$ rails db:migrate
```

## Run Server
```
$ rails s
```

## How To Test
You can use [POSTMAN](https://www.postman.com/downloads/) for API testing

## Create Reservation

1. In Postman, set your HTTP request to POST.
2. In the request URL field, input http://localhost:3000/api/v1/reservations
3. Switch to the Body tab
4. In the Body tab, Click raw and select JSON
5. Copy and paste the JSON below for testing 
```
{
  "reservation_code": "YYY12345678",
  "start_date": "2021-04-14",
  "end_date": "2021-04-18",
  "nights": 4,
  "guests": 4,
  "adults": 2,
  "children": 2,
  "infants": 0,
  "status": "accepted",
  "guest": {
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "4200.00",
  "security_price": "500",
  "total_price": "4700.00"
}
```
OR
```
{
  "reservation": {
    "code": "XXX12345678",
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 2,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
  }
}
```
6. Click Send

## Update Reservation Request 

1. In Postman, Set your HTTP request to POST.
2. In the request URL field, input http://localhost:3000/api/v1/reservations/
3. Switch to the Body tab
4. In the Body tab, Click raw and select JSON
5. Copy and paste the JSON below for testing 
6. You can change the values of the following:
 - start_date
 - end_date
 - nights
 - adults
 - children
 - infants
 - status
```
{
  "reservation_code": "YYY12345678",
  "start_date": "2021-04-14",
  "end_date": "2021-04-19",
  "nights": 5,
  "guests": 5,
  "adults": 2,
  "children": 2,
  "infants": 1,
  "status": "denied",
  "guest": {
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "4200.00",
  "security_price": "500",
  "total_price": "4700.00"
}
```
OR
```
{
  "reservation": {
    "code": "XXX12345678",
    "start_date": "2021-03-12",
    "end_date": "2021-03-19",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "7 guests",
      "number_of_adults": 5,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 7,
    "number_of_guests": 7,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
  }
}
```
6. Click Send