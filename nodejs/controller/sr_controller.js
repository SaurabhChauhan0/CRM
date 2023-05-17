const SRModel = require('../models/sr_model');
const SRService = require('../services/sr_services');

exports.createSR = async(req,res,next) =>{
    try {
        const {bookingId,dateAndTime,serviceType,name,address,allotted,productDetails,contactNumber,amount,modeOfPayment,status} = req.body;

        const response = await SRService.registerSR(bookingId,dateAndTime,serviceType,name,address,allotted,productDetails,contactNumber,amount,modeOfPayment,status);

        res.json({status:true,success:"Request Submitted Successfully"});
        
    } catch (error) {
        throw error;

    }
}
exports.getSR = async(req,res,next)=>{
    try{
        const  { status} = req.body;

        let response = await SRService.SR(status);
        // console.log(response);
        res.json(response);
    }
    catch(error){
        console.log(error,'err----->');
        next(error);
    }
}






