const { Router } = require("express");
const express = require("express");
const router = express.Router();

//controllers
const { Fecha_pass, fecha_sistem } = require("../controllers/SeguridadCtrl");

router.get("/:cod", Fecha_pass);
router.get("/", fecha_sistem);

module.exports = router;
