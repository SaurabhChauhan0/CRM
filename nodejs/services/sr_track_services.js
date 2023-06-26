SRtrackModel = require('../models/SR_track_model');

class SRTrackService{
    static async registerSRTrack(SRId,userId,userName)
    {
        try {
            const createSRTrack = SRtrackModel({SRId,userId,userName})
            return await createSRTrack.save();
            
        } catch (error) {
            throw  error;
            
        }
    }
}

module.exports = SRTrackService;