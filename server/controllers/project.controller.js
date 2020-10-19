const { mysqlDB } = require('../models/db');
const config = require('../../config/config');
const projectController = {};
projectController.getProjectDetails = (params) => new Promise((resolve, reject) => {
    console.log('inside getProjectDetails projectController:::');

    let orderByQuery = 'order by ilance_projects.date_added desc';
    if (params.sortBy == 'category') {
        orderByQuery = 'order by category.category_name';
    } else if (params.sortBy == 'username') {
        orderByQuery = 'order by category.category_name';
    } else if (params.sortBy == 'projectTitle') {
        orderByQuery = 'order by  ilance_projects.project_title';
    }

    let pageNum = params.pageNumber || 1;
    let startIndex = (pageNum - 1) * config.defaultNumOfRows;
    let numberOfRows = config.defaultNumOfRows;

    console.log('pageNum', pageNum);
    const getCountQuery = 'SELECT count(*) as totalRows FROM ilance_users INNER JOIN  ilance_projects ON ilance_users.user_id = ilance_projects.user_id  LEFT JOIN ilance_category as category ON category.cid= ilance_projects.cid';
    const projectQuery = `SELECT ilance_projects.project_title,ilance_users.username, category.category_name FROM ilance_users INNER JOIN  ilance_projects ON ilance_users.user_id = ilance_projects.user_id  LEFT JOIN ilance_category as category ON category.cid= ilance_projects.cid ${orderByQuery} LIMIT ${startIndex},${numberOfRows};`;
    let totalRows = 0;
    mysqlDB.query(getCountQuery).
        then((countData) => {
            console.log('countData', );
            totalRows = countData[0].totalRows;
            return mysqlDB.query(projectQuery);
        })
        .then((res) => {
            resolve({
                success: true,
                message: 'Sucessfully fetched',
                data: res,
                totalPageNum: Math.ceil(totalRows/numberOfRows)
            });
        }).catch((err) => {
            reject(err);
        });

});

module.exports = projectController;