import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  image: {
    type: String,
    required: false,
  },
  phone: {
    type: String,
    required: false,
  },
  role: {
    type: String,
    enum: ['user', 'owner'],
    required: true,
    default: "user",
  },
  timestamp: {
    type: Date,
    default: Date.now,
  },
});

const User = mongoose.model("Users", userSchema);

export default User;
