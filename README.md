# NODEJS REST API

### Install Global Dependencies:
```
npm i -g nodemon
```
### Install Project Dependencies:
```
npm install
```
### Setup database:
1. Install MAMP (https://www.mamp.info/en/downloads/) or XAMPP (https://www.apachefriends.org/download.html)
2. Create Database
### Go ahead...
```
cd /config
```
- Set required credential in `database.js` 

### Run server:
```
nodemon server
```

### Implemented endpoints:

#### /api
Path | Method | Description | Request Body
---|---|---|---
/create-flights | POST | Create Flights Action | {airline_company: {companyID}}
/assign | POST | Assign Flights Action | {flight_no: {flightID}, plane: {planeID}, destination: String, terminal: String, gate: String}
/check-in/:{flightID} | POST | Check-in Flights | {first_name: String, last_name: String, age: String, gender: String}
/flights/:{flightID} | GET | Get flights Seats, Occupied and Avaible | 
/passengers/:{flightID} | GET | Get passengers list |
/aircrafts-info/:{flightID} | GET | Get Aircraft Info |
