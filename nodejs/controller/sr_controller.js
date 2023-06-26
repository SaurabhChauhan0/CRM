const SRService = require('../services/sr_services');

exports.createSR = async(req,res,next) =>{
    try {
        const {name,address,serviceType,allotted,productDetails,contactNumber,amount,modeOfPayment} = req.body;

        const response = await SRService.registerSR(name,address,serviceType,allotted,productDetails,contactNumber,amount,modeOfPayment);

        res.json({status:true,success:"Request Submitted Successfully"});
        
    } catch (error) {
        console.log(error,'err----->');
        next(error);
        // throw error;

    }
}
exports.getSR = async(req,res,next)=>{
    try{
        const  {} = req.body;

        let response = await SRService.findSR();
        // console.log(response);
        res.json(response);
    }
    catch(error){
        console.log(error,'err----->');
        next(error);
    }
}

exports.updateSR = async(req,res,next)=>{
    try{
        const {bookingId,allotted,status} = req.body;

        let result = await SRService.updateOneSR(bookingId,allotted,status);
        res.json(result);
    //     if (result.modifiedCount > 0) {
    //     res.status(200).json({ message: 'Document updated successfully' });
    //   } else {
    //     res.status(404).json({ message: 'Document not found' });
    //   }

    }
    catch(error){
        console.log(error,"error--------->");
        next(error);
    }
}


// exports.updateSRStatus = async(req,res,next)=>{
//     try{
//         const {bookingId,status} = req.body;

//         let result = await SRService.updateSRStatus(bookingId,status);
//         res.json(result);
//     //     if (result.modifiedCount > 0) {
//     //     res.status(200).json({ message: 'Document updated successfully' });
//     //   } else {
//     //     res.status(404).json({ message: 'Document not found' });
//     //   }

//     }
//     catch(error){
//         console.log(error,"error--------->");
//         next(error);
//     }
// }







