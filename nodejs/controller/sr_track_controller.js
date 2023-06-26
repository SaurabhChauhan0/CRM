
const SRTrackService = require("../services/sr_track_services");

exports.AddSRTrack = async(req,res,next) =>{
    try {
        const {SRId,userId,userName} = req.body;

        const response = await SRTrackService.registerSRTrack(SRId,userId,userName);

        res.json({status:true,success:"Request Submitted Successfully"});
        
    } catch (error) {
        console.log(error,'err----->');
        next(error);
        // throw error;

    }
}