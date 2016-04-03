"use strict";

let Metalsmith = require("metalsmith"),
  layouts = require("metalsmith-layouts"),
  metadata = require("metalsmith-filemetadata"),
  textile = require("./lib/metalsmith-textile"),
  datePermalink = require("./lib/metalsmith-date-permalink"),
  archive = require("metalsmith-archive"),
  browserSync = require("metalsmith-browser-sync"),
  permalinks = require("metalsmith-permalinks"),
  dateInFilename = require("metalsmith-date-in-filename");

Metalsmith(__dirname)
  .use(browserSync({
    server: "build",
    files: ["src/**/*.md", "src/**/*.textile", "src/*.md", "src/*.textile", "_layouts/**/*.*"]
  }))
  .use(dateInFilename(true))
  .use(metadata([
    {
      pattern: "_posts/*",
      metadata: {
        "site": {
          "url": "http://dynamicprogrammer.com",
          "blog_url": "http://blog.dynamicprogrammer.com",
          "photos_url": "http://blog.dynamicprogrammer.com/categories/photos.html",
          "twitter_url": "https://twitter.com/theprogrammer",
          "projects_url": "http://github.com/hgarcia",
          "music_url": "http://www.acidplanet.com/artist.asp?songs=292536&amp;t=4858",
          "rss_url": "http://feeds.feedburner.com/TheDynamicProgrammer",
          "author": "Hernan Garcia",
          "name": "The Dynamic Programmer"
        }
      }
    }
  ]))
  .use(datePermalink())
  .use(archive({collections: "_posts"}))
  .use(textile())
  .use(permalinks({
    collection: "_posts",
    pattern: ":date/:title",
    relative: false
  }))
  .use(layouts({
      "engine": "liquid",
      "directory": "_layouts"
    }))
  .build(function(err) {
    if (err) {
      throw err;
    }
  });
