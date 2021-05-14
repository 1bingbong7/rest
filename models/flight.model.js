const db = require("../config/database");
const moment = require("moment");
const createFlights = async (data) => {
  return new Promise((resolve, reject) => {
    db.query(
      `INSERT INTO flights 
      (airline_company) 
      VALUES 
      (?)`,
      [data.airline_company],
      function (err, result, fields) {
        if (err) reject(err);
        resolve("Created Flight Successfully!");
      }
    );
  });
};
const assignFlights = async (data) => {
  return new Promise((resolve, reject) => {
    db.query(
      `INSERT INTO assign 
        (flight_no, plane, destination, terminal, gate) 
        VALUES 
        (?, ?, ?, ?, ?)`,
      [data.flight_no, data.plane, data.destination, data.terminal, data.gate],
      function (err, result, fields) {
        if (err) reject(err);
        resolve("Assigned Successfully!");
      }
    );
  });
};
const checkinFlights = async (data, flight) => {
  return new Promise((resolve, reject) => {
    db.query(
      `INSERT INTO check_in 
    (first_name, last_name, age, gender, flight_no) 
    VALUES 
    (?, ?, ?, ?)`,
      [data.first_name, data.last_name, data.age, data.gender, flight],
      function (err, result, fields) {
        if (err) reject(err);
        resolve("Check-in Successfully!");
      }
    );
  });
};
const getFlights = async (flight) => {
  return new Promise((resolve, reject) => {
    db.query(
      `SELECT (conf.first_class + conf.business + conf.premium_economy + economy) as seats, sum((case when ckn.check_in_id is not null then 1 else 0 end)) as occupied, ((conf.first_class + conf.business + conf.premium_economy + economy) - sum((case when ckn.check_in_id is not null then 1 else 0 end))) as available FROM assign as ass JOIN airplane_configuration as conf ON ass.plane = conf.airplane_id JOIN check_in as ckn ON ass.flight_no = ckn.flight_no WHERE ass.flight_no = ${flight} GROUP BY seats`,
      function (err, result, fields) {
        if (err) reject(err);
        resolve(result);
      }
    );
  });
};
const getPassengers = async (flight) => {
  return new Promise((resolve, reject) => {
    db.query(
      `SELECT first_name, last_name, age, gender FROM check_in WHERE flight_no = ${flight}`,
      function (err, result, fields) {
        if (err) reject(err);
        resolve(result);
      }
    );
  });
};
const getAircraft = async (flight) => {
  return new Promise((resolve, reject) => {
    db.query(
      `SELECT cpn.carrier_name, cpn.head_quarters, pln.brand, pln.model  FROM assign JOIN airplane as pln ON pln.airplane_id = assign.plane JOIN companies as cpn ON pln.company_id = cpn.company_id WHERE assign.flight_no = ${flight}`,
      function (err, result, fields) {
        if (err) reject(err);
        resolve(result);
      }
    );
  });
};
const getSpecificAircraft = async (plane) => {
  return new Promise((resolve, reject) => {
    db.query(
      `SELECT pln.brand, pln.model, cpn.carrier_name, cpn.head_quarters FROM airplane as pln JOIN companies as cpn ON cpn.company_id = pln.company_id WHERE pln.airplane_id = ${plane} `,
      function (err, result, fields) {
        if (err) reject(err);
        resolve(result);
      }
    );
  });
};
module.exports = {
  createFlights,
  assignFlights,
  checkinFlights,
  getFlights,
  getPassengers,
  getAircraft,
  getSpecificAircraft,
};
