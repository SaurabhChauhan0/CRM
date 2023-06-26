const mongoose = require('mongoose');

const db = require('../config/db');
const { Timestamp } = require('mongodb');

const { Schema } = mongoose;


const SRSchema = new Schema({
   
    
    
    SRbookingId: {
        type: mongoose.Schema.Types.ObjectId,// Generate a new unique ID by default
        unique: true, // Ensure the ID is unique
      },

    createdTimeStamp: {
        type : Date,
        default : Date.now,
    },
    
    allottedGeneralManager:{
        name:{
        type : String,
        },
        id:{
            type: String,
            default: "NA"
        }
        
    },
    allottedManager:{
        name:{
            type : String,
            },
            id:{
                type: String,
                default: "NA"
            }
    },

    allottedTeamLeader:{
       name:{
        type : String,
        },
        id:{
            type: String,
            default: "NA"
        }
    },

    allottedSupervisor:{
        name:{
        type : String,
        },
        id:{
            type: String,
            default: "NA"
        }
    }

    

})

const SRtrackModel = db.model('service_request_track' , SRSchema);
module.exports = SRtrackModel;