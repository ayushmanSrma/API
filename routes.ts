import { Router } from "express"; // importing the router from express
const router = Router(); // initialising the router
router.get("/prouct", (req, res) => {
    res.json({ age: 23 })
})
export default router //exporting the router 