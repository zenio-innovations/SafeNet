import express from 'express';
import Userroute from './Routes/api/User.js';
import mongoose from 'mongoose';
const app = express();
app.use(express.json());

app.use('/api/user', Userroute);

app.use((error, req, res, next) => {
	if (res.headerSent) {
		return next(error);
	}
	res.status(error.code).json({ message: error.message });
});
mongoose.connect(
	'mongodb+srv://pseudochaos:HelloWorld@cluster0.wpqfu.mongodb.net/myFirstDatabase?retryWrites=true&w=majority'
);
app.listen(8000, () => {
	console.log('server running on port 8000');
});
