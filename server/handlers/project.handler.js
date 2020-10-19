const projectController = require('../controllers/project.controller');
const getProjectDetails = (req, res) => {
    console.log('inside getProjectDetails:::');
    if (!req.query.pageNumber) {
        return res.send({
            success: false,
            message: 'pageNumber is missing',
        });
    }

    if (!req.query.sortBy) {
        return res.send({
            success: false,
            message: 'sortBy  is missing',
        });
    }

    projectController.getProjectDetails(req.query)
        .then((projectRes) => {
            res.status(200);
            res.send(projectRes);
        })
        .catch((error) => {
            console.log(' Error occured while fetching file ', error);
            res.status(400);
            res.send({
                success: false,
                message: 'Error getting project deatils.',
                full_message: error
            });
        });
};

module.exports = { getProjectDetails };