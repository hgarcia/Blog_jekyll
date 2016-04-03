"use strict";

var _ = require("lodash");

function plugin(options) {
  options = options || {};
  var keys = options.keys || [];

  return function(files, metalsmith, done) {
    var metadata = metalsmith.metadata();
    metadata.posts = _.reverse(_.values(files));
    done()
  };
}

module.exports = plugin;
