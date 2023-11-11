//this is for making a basic api file
const express = require('express') // to import the express module
import router from "./routes"
const app = express()//initialising express in app i.e api
app.use(express.json())
//to send some object(text etc to the server and fetching that information)
app.get("/", (req, res) => { //using get method to the root directory("/") using req(request) to get the data/object and res(response) to send the data/object to res
    res.json({ name: "Ayushman" })
})

app.use("/api", router) //we are using /api path to get to router, we have to put /product path in the url to get the json object

//we need a server to run the api, hence the below program
app.listen('3000', () => { //our app(api will to the port no 3000)
    console.log("Server is running") //callback to know that the server is running
})