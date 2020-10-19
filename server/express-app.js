var createError = require('http-errors');
var express = require('express');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const ejs = require('ejs');
var indexRouter = require('./routes/index');
var projectRouter = require('./routes/project');
var authRouter = require('./routes/auth');
var app = express();
var expresssession = require('express-session');
// view engine setup


// view engine setup
app.engine('html', ejs.renderFile);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(expresssession({ secret: 'ilance Key', saveUninitialized: true, resave: true }));
app.use('/', express.static(`${__dirname}/../public`, {
    setHeaders: (res) => {
        res.header('Cache-Control', 'max-age=864000');
    }
}));
app.use('/api', (req, res, next) => {
    if (req.session.user) {
        console.log('req.session.user', req.session.user);
        return next();

    } else {
        console.log('user is not logged In');
        console.log('HERE we can redirect user to login page if not loged in');
        return next();
    }
});
app.use('/api/project', projectRouter);
app.use('/api/auth', authRouter);
app.use('/', express.static(`${__dirname}/../views`));
app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use((req, res, next) => {
    next(createError(404));
});

// error handler
app.use((err, req, res) => {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;
