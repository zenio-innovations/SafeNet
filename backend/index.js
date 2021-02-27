import express from 'express';
import Userroute from './Routes/api/User.js';
const app = express();
app.use(express.json());

app.use('/api/user', Userroute);

app.use((error, req, res, next) => {
	if (res.headerSent) {
		return next(error);
	}
	res.status(error.code).json({ message: error.message });
});

app.listen(8000, () => {
	console.log('server running on port 8000');
});
