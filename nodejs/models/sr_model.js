const mongoose = require('mongoose');

const db = require('../config/db');
const { Timestamp } = require('mongodb');

const { Schema } = mongoose;


const SRSchema = new mongoose.Schema({
   
    
    
    bookingId: {
        type: mongoose.Schema.Types.ObjectId,
        default:new mongoose.Types.ObjectId(), // Generate a new unique ID by default
        unique: true, // Ensure the ID is unique
      },

    dateAndTime: {
        type : Date,
        default : Date.now,
    },

    

    name :{
        type:String,
    },
    address: {
        type: String,

    },

    serviceType: {
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
        default : "pending",
    },

})

const SRModel = db.model('service_request' , SRSchema);
module.exports = SRModel;