"use strict";

let Metalsmith = require("metalsmith"),
  layouts = require("metalsmith-layouts"),
  textile = require("./lib/metalsmith-textile");

Metalsmith(__dirname)
  .use(textile())
  .use(layouts({
      "engine": "liquid",
      "directory": "src/_layouts"
    }))
  // .use(layouts('handlebars'))
  .build(function(err) {
    if (err) {
      throw err;
    }
  });
