"use strict";
let fs = require("fs"),
  path = __dirname + "/src/_posts";

let files = fs.readdirSync(path);

function fixImage(file, content) {
  let image = content.match(/src="\.\.\/\.\.\/\.\.\//ig);
  if (image) {
    fs.writeFileSync(__dirname + "/src/imgfixed/" + file, content.replace(/src="\.\.\/\.\.\/\.\.\//ig, "src=\"/"));
  }
}

function openFile(file) {
  let content = fs.readFileSync(path + "/" + file);
  fixImage(file, content.toString());
}

files.forEach(openFile);