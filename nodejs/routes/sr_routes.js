const express = require('express');
const router = express.Router();
const SRController = require('../controller/sr_controller');
const SRModel = require('../models/sr_model');
const app = express();

router.post("/registerSR",SRController.createSR);
router.get('/getSR',SRController.getSR);


module.exports = router;
