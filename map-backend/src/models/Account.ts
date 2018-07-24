import mongoose from 'mongoose';

const { Schema } = mongoose;

export interface Account extends mongoose.Document {
  profile: {
    username: string;
    thumbnail: string;
  };
  email: string;
  name: string;
  password: string;
  createdAt: Date;
}

export const Account = new Schema({
  profile: {
    username: String,
    thumbnail: {
      type: String,
      default: '/static/images/default_thumbnail.png',
    },
  },
  email: String,
  name: String,
  password: String,
  createdAt: {
    type: Date,
    default: new Date(),
  },
});

export default mongoose.model<Account>('Account', Account);
