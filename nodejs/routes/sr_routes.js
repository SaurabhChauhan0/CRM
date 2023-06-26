const express = require('express');
const router = express.Router();
const SRController = require('../controller/sr_controller');


router.post("/registerSR",SRController.createSR);
router.get('/getSR',SRController.getSR);
router.put('/updateSR',SRController.updateSR);



module.exports = router;
