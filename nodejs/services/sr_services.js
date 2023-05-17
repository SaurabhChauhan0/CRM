const SRModel = require('../models/sr_model');

class SRService{
    static async registerSR(bookingId,dateAndTime,serviceType,name,address,allotted,productDetails,contactNumber,amount,modeOfPayment,status){
        try {
            const createSR = SRModel({bookingId,dateAndTime,serviceType,name,address,allotted,productDetails,contactNumber,amount,modeOfPayment,status})
               return await createSR.save();
        } catch (error) {
            throw error;
        } 
}

static async SR(status){
        const result = await SRModel.find({status: status});
        return  result;
    
}


        
}


module.exports = SRService;