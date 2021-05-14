const {
  createFlights,
  assignFlights,
  checkinFlights,
  getFlights,
  getPassengers,
  getAircraft,
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
  routes.post("/check-in/:flight", (req, res) => {
    checkinFlights(req.body, req.params.flight)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/flights/:flight", (req, res) => {
    getFlights(req.params.flight)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/passengers/:flight", (req, res) => {
    getPassengers(req.params.flight)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  routes.get("/aircrafts-info/:flight", (req, res) => {
    getAircraft(req.params.flight)
      .then((result) => res.json(result))
      .catch((error) => res.status(500).json("Error " + error));
  });
  return routes;
};
