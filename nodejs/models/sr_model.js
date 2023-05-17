const mongoose = require('mongoose');

const db = require('../config/db');
const { Timestamp } = require('mongodb');



const SRSchema = new mongoose.Schema({
   
    
    bookingId: {
        type: String,
    },

    dateAndTime: {
        type : Date,
        default : Date.now,
    },

    serviceType: {
        type: String,
    },

    name :{
        type:String,
    },

    address: {
        type: String,

    },
    allotted:{
        type : String,

    },

    
    productDetails : {
        type : String,

    },

    contactNumber : {
        type : Number,
    },

    amount : {
        type : Number,

    },
    modeOfPayment : {
        type : String,
    },
    status : {
        type : String,
    },

})

const SRModel = db.model('service_request' , SRSchema);
module.exports = SRModel;