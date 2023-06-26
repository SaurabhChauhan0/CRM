const SRModel = require('../models/sr_model');

class SRService{
    static async registerSR(name,address,serviceType,allotted,productDetails,contactNumber,amount,modeOfPayment){
        try {
            const createSR = SRModel({name,address,serviceType,allotted,productDetails,contactNumber,amount,modeOfPayment})
               return await createSR.save();
        } catch (error) {
            throw error;
        } 
}

static async findSR(){
        const result = await SRModel.find();
        return  result;
    
}

static async updateOneSR(bookingId, allotted,status){
    const result = await SRModel.updateOne(
        { bookingId:bookingId },
        { $set: { allotted : allotted,status : status}},
       
      );
      
      return result;
}

// static async updateSRStatus(bookingId, status){
//     const result = await SRModel.updateOne(
//         { bookingId:bookingId },
//         { $set: { status : status} }
//       );
      
//       return result;
// }

        
}


module.exports = SRService;