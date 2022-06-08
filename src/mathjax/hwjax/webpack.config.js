const PACKAGE = require('../node_modules/mathjax-full/components/webpack.common.js');

const PACKAGE_NAME = 'hwjax';
const PATH_MATHJAX_JS = '../node_modules/mathjax-full/js';
const LINKED_PACKAGES = [];
const OUTPUT_DIR = '.';

let pkg = PACKAGE(PACKAGE_NAME, PATH_MATHJAX_JS, LINKED_PACKAGES, __dirname, OUTPUT_DIR );

module.exports = pkg;
