// https://docs.mathjax.org/en/latest/web/webpack.html#the-control-file
import '../node_modules/mathjax-full/components/src/startup/lib/startup.js';
import { Loader } from '../node_modules/mathjax-full/js/components/loader.js';
import { insert } from '../node_modules/mathjax-full/js/util/Options.js';

// indicate the modules that will be loaded by hand below
Loader.preLoad(
  'loader', 'startup',
  'core',
  'input/tex-full',
  '[tex]/ams',
  '[tex]/newcommand',
  '[tex]/configmacros',
  '[tex]/action',
  '[tex]/require',
  '[tex]/autoload',
  '[custom]/hwsymb.js',
  'output/chtml', 'output/chtml/fonts/tex.js',
  'ui/menu', 'a11y/assistive-mml'
);

// update the configuration to include any needed values
insert(MathJax.config, {
  loader: {
    paths: {
      mathjax: 'https://cdn.jsdelivr.net/npm/mathjax@3/es5',
      custom: '../hwsymb_ext/'
    }
  },
  tex: {
    packages: { '[+]': ['ams', 'newcommand', 'configmacros', 'action', 'require', 'autoload', 'hwsymb'] },
    inlineMath: [['$', '$'], ['\\(', '\\)']]
  }
}, false);

// components we want to combine into one component
require('../hwsymb_ext/hwsymb.js');  // this is by Tashfeen
require('../node_modules/mathjax-full/components/src/core/core.js');
require('../node_modules/mathjax-full/components/src/input/tex-base/tex-base.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/ams/ams.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/newcommand/newcommand.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/configmacros/configmacros.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/action/action.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/require/require.js');
require('../node_modules/mathjax-full/components/src/input/tex/extensions/autoload/autoload.js');
require('../node_modules/mathjax-full/components/src/a11y/assistive-mml/assistive-mml.js');
require('../node_modules/mathjax-full/components/src/output/chtml/chtml.js');
require('../node_modules/mathjax-full/components/src/output/chtml/fonts/tex/tex.js');
require('../node_modules/mathjax-full/components/src/ui/menu/menu.js');

// cause all the normal startup operations
require('../node_modules/mathjax-full/components/src/startup/startup.js');
