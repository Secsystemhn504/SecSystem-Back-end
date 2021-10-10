// Importing the packages required for the project.
const { validationResult } = require("express-validator");
const mysqlConnection = require("../../../config/db");

//const express = require('express-validator');

// CRUD Methods
//Get all Employees


exports.Fecha_pass = async (req, res, next) => {
  const { cod } = req.params;
  const query = " SELECT * FROM tbl_seguridad WHERE id = ?;";
  console.log(cod);
  try {
    const result = await mysqlConnection.query(query, [cod]);
    return res.json(result);
  } catch (error) {
    console.log(error);
    next();
  }
};

exports.fecha_sistem = async (req, res, next) => {
  const query = " SELECT  DAYOFYEAR(now()) AS fecha_sis;";
  try {
    const result = await mysqlConnection.query(query);
    return res.json(result);
  } catch (error) {
    console.log(error);
    next();
  }
};