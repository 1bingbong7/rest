const {
  createFlights,
  assignFlights,
  checkinFlights,
  getFlights,
  getPassengers,
  getAircraft,
  getSpecificAircraft,
} = require("../models/flight.model");
module.exports = (app) => {
  let routes = require("express").Router();

  routes.post("/create-flights", (req, res) => {
    createFlights(req.body)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.post("/assign", (req, res) => {
    assignFlights(req.body)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.post("/check-in/:flightID", (req, res) => {
    checkinFlights(req.body, req.params.flightID)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/flights/:flightID", (req, res) => {
    getFlights(req.params.flightID)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/passengers/:flightID", (req, res) => {
    getPassengers(req.params.flightID)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/aircrafts-info/:flightID", (req, res) => {
    getAircraft(req.params.flightID)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/specific-aircraft-info/:planeID", (req, res) => {
    getSpecificAircraft(req.params.planeID)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });

  return routes;
};
