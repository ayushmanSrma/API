import { Router } from "express"; // importing the router from express
const router = Router(); // initialising the router
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
router.get("/product", async (req, res) => {
    // get all the product
    const data = await prisma.product.findMany()
    res.json({ "products": data })
})

router.post("/product", async (req, res) => {
    // res.json({ "Received": req.body })
    // create a product with prisma
    await prisma.product.create({
        data: req.body
    })
    res.json({ "message": "Create Successfully" })
})

// delete a product with id 
router.delete("/product/:id", async (req, res) => {
    const deleteProd = await prisma.product.delete({
        where: {
            id: req.params["id"]
        }
    })
    res.json({ "DeletedProd": deleteProd })
})
export default router //exporting the router 