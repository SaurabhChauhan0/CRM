const UserService = require('../services/user_services');

exports.register = async(req,res,next)=>{
        try {
            const {name,email,phone,address,password,role,id} = req.body;

            const successRes = await UserService.registerUser(name,email,phone,address,password,role,id);

            res.json({status:true,success: "User Registered Successfully"});
            
        } catch (error) {
            next( error);
        }

    }
exports.login = async(req,res,next)=>{
    try {
        const{email,password} = req.body;
        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }

        let user = await UserService.checkUser(email);
        if(!user){
            throw new Error('User does not exist');
        }
        const isMatch = await user.comparePassword(password);

        if(isMatch === false)
        {
            throw new Error("Invalid Password");

        }
        let tokenData = {_id:user._id,email:user.email};
        const token =  await UserService.generateToken(tokenData,"secret","1h");

        res.status(200).json({status:true,success: "sendData",token:token,userDetails:user});
        

    } catch (error) {
        next(error);
    }
}
