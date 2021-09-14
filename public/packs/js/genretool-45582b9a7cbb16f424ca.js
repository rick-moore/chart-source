/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/genretool.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/genretool.js":
/*!*******************************************!*\
  !*** ./app/javascript/packs/genretool.js ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/rickmoore/Development/code/Mod3/chart-source/app/javascript/packs/genretool.js: Unexpected token, expected \",\" (8:0)\n\n   6 | })\n   7 |\n>  8 | $(document).on('click', '#add_tag_button', function() {\n     | ^\n   9 |     tag = $('#genre_input').val()\n  10 |     if (tag != '') {\n  11 |         $('#genre_list').append(`<span class=\"tag_span\">${tag}<button type='button' class='remove_tag'>X</button></span>`)\n    at Parser._raise (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:776:17)\n    at Parser.raiseWithData (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:769:17)\n    at Parser.raise (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:737:17)\n    at Parser.unexpected (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:9675:16)\n    at Parser.expect (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:9661:28)\n    at Parser.parseCallExpressionArguments (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10828:14)\n    at Parser.parseCoverCallAndAsyncArrowHead (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10752:29)\n    at Parser.parseSubscript (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10688:19)\n    at Parser.parseSubscripts (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10661:19)\n    at Parser.parseExprSubscripts (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10650:17)\n    at Parser.parseUpdate (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10624:21)\n    at Parser.parseMaybeUnary (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10602:23)\n    at Parser.parseExprOps (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10463:23)\n    at Parser.parseMaybeConditional (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10437:23)\n    at Parser.parseMaybeAssign (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10400:21)\n    at Parser.parseExpressionBase (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10345:23)\n    at /Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10339:39\n    at Parser.allowInAnd (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12037:16)\n    at Parser.parseExpression (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:10339:17)\n    at Parser.parseStatementContent (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12326:23)\n    at Parser.parseStatement (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12195:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12777:25)\n    at Parser.parseBlockBody (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12768:10)\n    at Parser.parseProgram (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12129:10)\n    at Parser.parseTopLevel (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:12120:25)\n    at Parser.parse (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:13836:10)\n    at parse (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/parser/lib/index.js:13889:38)\n    at parser (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/core/lib/parser/index.js:54:34)\n    at parser.next (<anonymous>)\n    at normalizeFile (/Users/rickmoore/Development/code/Mod3/chart-source/node_modules/@babel/core/lib/transformation/normalize-file.js:99:38)");

/***/ })

/******/ });
//# sourceMappingURL=genretool-45582b9a7cbb16f424ca.js.map