const mongoose = require('mongoose');

const db = require('../config/db');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const userSchema = new Schema({
    name: {
        type: String,
        required: true,

    },

    email: {
        type: String,
        lowercase: true,
        required: [true, "userName can't be empty"],
        // @ts-ignore
        match: [
            /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
            "userName format is not correct",
        ],
        unique: true,
    },
    password: {
        type: String,
        required: [true, "password is required"],
    },


    // email: {
    //     type: String,
    //     lowercase: true,
    //     required: true,
    //     unique: true,

    // },
    // password: {
    //     type: String,
    //     required: true,
    // },
    phone: {
        type: Number,
        required: true,
        unique: true,
    },

    address: {
        type: String,
        required: true,
    },
    
    role: {
        type: String,
        required: true,

    }

});

userSchema.pre('save', async function () {
    try {
        var user = this;
        const salt = await (bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password, salt);
        user.password = hashpass;

    } catch (error) {
        throw error;
    }
});

userSchema.methods.comparePassword = async function (userPassword) {
    try {
        const isMatch = await bcrypt.compare(userPassword, this.password);
        return isMatch;

    } catch (error) {
        throw error;
    }
};



const userModel = db.model('user', userSchema);

module.exports = userModel;