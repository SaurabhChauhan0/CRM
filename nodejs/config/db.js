const mongoose = require('mongoose');
const add = "mongodb+srv://saurabhchauhan6267:chauhan123@cluster0.tqfqclb.mongodb.net/project?retryWrites=true&w=majority";


const connection = mongoose.createConnection(add)
                     .on('open',()=>{console.log("Database Connected");}).on('error',()=>{
                        console.log('Mongodb Connection Error');
                     });


                     

module.exports = connection;                    