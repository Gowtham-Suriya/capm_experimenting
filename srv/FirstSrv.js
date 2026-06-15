const cds = require("@sap/cds");
const db = cds.db;
const { Books } = cds.entities;

module.exports = srv => {

    srv.before("CREATE", "BookSet", async (req, res) => {
        if(req.data.price < 0) {
            req.error(400, 'Price must be greater than zero');
        }
    })
    
    srv.on("READ", "BookSet", async (req, res) => {
        let results = []

        results = await db.run(SELECT.from(Books))
       
        return results;

    })

    srv.on("increasePrice", async (req, res) => {
        const percentage = req.data.percentage;
        await db.run(UPDATE(Books).set({ price: { '+=': percentage } }))
        return "Price increased by " + percentage + "%";
    })


    

}