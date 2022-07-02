const PACKAGE = require('../node_modules/mathjax-full/components/webpack.common.js');

const PACKAGE_NAME = 'hwsymb';
const PATH_MATHJAX_JS = '../node_modules/mathjax-full/js';
const LINKED_PACKAGES = ['components/src/core/lib', 'components/src/input/tex-base/lib'];
const OUTPUT_DIR = '.';

let pkg = PACKAGE(
  PACKAGE_NAME,    // the name of the package to build
  PATH_MATHJAX_JS, // location of the mathjax library
  LINKED_PACKAGES, // packages to link to
  __dirname,       // our directory
  OUTPUT_DIR );    // where to put the packaged component

module.exports = pkg;
