import express from 'express';
import error from '../../models/Error.js';
const router = express.Router();
router.get('/', (req, res) => {
	console.log(req.body);
	res.status(200).json({ ok: 'ok' });
});
export default router;
