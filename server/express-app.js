var createError = require('http-errors');
var express = require('express');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const ejs = require('ejs')
var indexRouter = require('./routes/index');
var projectRouter = require('./routes/project');
var app = express();
// view engine setup


// view engine setup
app.engine('html', ejs.renderFile);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use('/', express.static(`${__dirname}/../public`, {
  setHeaders: (res) => {
    res.header('Cache-Control', 'max-age=864000');
  }
}));

app.use('/api/project', projectRouter);
app.use('/', express.static(`${__dirname}/../views`));
app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
