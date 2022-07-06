// https://docs.mathjax.org/en/latest/web/webpack.html#the-control-file
import { Loader } from '../node_modules/mathjax-full/js/components/loader.js';
import '../node_modules/mathjax-full/components/src/startup/lib/startup.js';
import { insert } from '../node_modules/mathjax-full/js/util/Options.js';

// indicate the modules that will be loaded by hand below
Loader.preLoad(
  'loader',
  'startup',
  'core',
  'input/tex-base',
  'output/chtml',
  'output/chtml/fonts/tex.js',
  'ui/menu',
  '[tex]/ams',
  '[tex]/newcommand',
  '[tex]/configmacros',
  '[tex]/action',
  '[tex]/require',
  '[tex]/autoload',
  '[custom]/hwsymb.js'
);

// update the configuration to include any needed values
insert(MathJax.config, {
  loader: {
    paths: {
      mathjax: 'https://cdn.jsdelivr.net/npm/mathjax@3/es5',
      custom: '../hwsymb_ext'
    }
  },
  tex: {
    packages: { '[+]': ['ams', 'newcommand', 'configmacros', 'action', 'require', 'autoload', 'hwsymb'] },
    inlineMath: [['$', '$'], ['\\(', '\\)']]
  }
}, false);

// components we want to combine into one component
// keep these in the same order as in the Loader.preload
import '../node_modules/mathjax-full/components/src/core/core.js';
import '../node_modules/mathjax-full/components/src/input/tex-base/tex-base.js';
import '../node_modules/mathjax-full/components/src/output/chtml/chtml.js';
import '../node_modules/mathjax-full/components/src/output/chtml/fonts/tex/tex.js';
import '../node_modules/mathjax-full/components/src/ui/menu/menu.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/ams/ams.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/newcommand/newcommand.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/configmacros/configmacros.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/action/action.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/require/require.js';
import '../node_modules/mathjax-full/components/src/input/tex/extensions/autoload/autoload.js';
import '../hwsymb_ext/hwsymb.js';  // this is by Tashfeen

// cause all the normal startup operations
import '../node_modules/mathjax-full/components/src/startup/startup.js';
