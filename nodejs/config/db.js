const mongoose = require('mongoose');
const add1 = "mongodb+srv://saurabhchauhan6267:chauhan123@cluster0.tqfqclb.mongodb.net/project?retryWrites=true&w=majority";
const add2 = "mongodb+srv://yashasvi:Akhil123@myprojectdata.umjtugs.mongodb.net/myprojectdata?retryWrites=true&w=majority";

const connection1 = mongoose.createConnection(add1)
                     .on('open',()=>{console.log("Database Connected");}).on('error',()=>{
                        console.log('Mongodb Connection Error');
                     });

// const connection2 =  mongoose.createConnection(add2)
// .on('open',()=>{console.log("Database Connected");}).on('error',()=>{
//    console.log('Mongodb Connection Error');
// });
                     

module.exports = connection1; 
// module.exports = connection2;                   