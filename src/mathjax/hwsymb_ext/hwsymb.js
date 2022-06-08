/**
 * @fileoverview  Mathjax extension for symbols in hwsymb.sty.
 *
 * @author tashfeen@ou.edu (Tashfeen, A.)
 */


import { Configuration } from '../node_modules/mathjax-full/js/input/tex/Configuration.js';
import { CommandMap } from '../node_modules/mathjax-full/js/input/tex/SymbolMap.js';
import BaseMethods from '../node_modules/mathjax-full/js/input/tex/base/BaseMethods.js';
import TexError from '../node_modules/mathjax-full/js/input/tex/TexError.js';

const EXTENSION_NAME = 'hwsymb';
const MAP_NAME = 'hwsymbMap';
const MAP = {
  bb: ['Macro', '\\mathbb{#1}', 1],
  // \cal is already supported
  sc: ['Macro', '\\mathtt{#1}', 1],
  D: ['Macro', '\\mathop{\\rm d}'],
  nil: ['Macro', '\\varnothing'],
  O: ['Macro', '\\cal{O}'],
  C: ['Macro', '\\mathbb{C}'],
  R: ['Macro', '\\mathbb{R}'],
  Q: ['Macro', '\\mathbb{Q}'],
  Z: ['Macro', '\\mathbb{Z}'],
  N: ['Macro', '\\mathbb{N}'],
  P: ['Macro', '\\mathbb{P}'],
  F: ['Macro', '\\mathbb{F}'],
  GF: ['Macro', '\\mathbb{F}_{#1}', 1, '2'],
  modulo: ['Macro', '\\mathbb{Z}/#1\\mathbb{Z}', 1, 'n'],
  ra: ['Macro', '\\rightarrow'],
  Ra: ['Macro', '\\Rightarrow'],
  '?': ['Macro', '\\stackrel{?}{=}'],
  is: ['Macro', '\\equiv'],
  al: ['Macro', '\\alpha'],
  ep: ['Macro', '\\varepsilon'],
  phi: ['Macro', '\\varphi'],
  p: ['Macro', '\\partial'],
  injective: ['Macro', '\\hookrightarrow'],
  surjective: ['Macro', '\\twoheadrightarrow'],
  bijective: ['Macro', '\\hookrightarrow\\mathrel{\\mspace{-15mu}}\\rightarrow'],
  derivative: ['Macro', '\\frac{\\mathop{\\rm d#2}}{\\mathop{\\rm d}#1}', 2, 'x'],
  ceil: ['Macro', '\\left\\lceil#1\\right\\rceil', 1],
  floor: ['Macro', '\\left\\lfloor#1\\right\\rfloor', 1],
  near: ['Macro', '\\left\\lfloor#1\\right\\rceil', 1],
  arr: ['Macro', '\\left\\langle#1\\right\\rangle', 1],
  paren: ['Macro', '\\left(#1\\right)', 1],
  brk: ['Macro', '\\left[#1\\right]', 1],
  abs: ['Macro', '\\left|#1\\right|', 1],
  curl: ['Macro', '\\left\\{#1\\right\\}', 1],
};

let map = new CommandMap(MAP_NAME, MAP, BaseMethods);
let configs = Configuration.create(EXTENSION_NAME, { handler: { macro: [MAP_NAME] } });
