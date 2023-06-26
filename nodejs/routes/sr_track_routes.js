const express = require('express');
const router = express.Router();
const SRTrackController = require('../controller/sr_track_controller');

router.post('/SRTrack',SRTrackController.AddSRTrack);

module.export = router;