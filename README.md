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
2. Create Database depends on your preffered name
3. Import `airline.sql`
### Go ahead...
```
cd /config
```
- Set required credential in `database.js` 

### Run server:
```
nodemon server
```

###Initial Details of Variable in Paramenters or Request Body of Implemented endpoints:
Variable | Description | Default Value
---|---|---
companyID | This is autocrimented ID of Airline Companies | 1 = Qantas, 2 = Singapore, 3 = Emirates
flightID | This is autocrimented ID of Created Flights |
planeID | This is autocrimented ID of Aircraft/Plane based on the Companies | Qantas(1 = Boeing, 2 = Airbus, 3 = Dash), Singapore(4 = Boeing, 5 = Airbus, 6 = Dash), Emirates(7 = Boeing, 8 = Airbus, 9 = Dash)


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
