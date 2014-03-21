# require-directory

Recursively iterates over specified directory, requiring each file, and returning a nested hash structure containing those libraries.

[![NPM](https://nodei.co/npm/require-directory.png?downloads=true&stars=true)](https://nodei.co/npm/require-directory/)

[![build status](https://secure.travis-ci.org/TroyGoode/node-require-directory.png)](http://travis-ci.org/TroyGoode/node-require-directory)

## How To Use

### Installation (via [npm](https://npmjs.org/package/require-directory))

```bash
$ npm install require-directory
```

### Usage

A common pattern in node.js is to include an index file which creates a hash of the files in its current directory. Given a directory structure like so:

* app.js
* routes/index.js
* routes/home.js
* routes/auth/login.js
* routes/auth/logout.js
* routes/auth/register.js

`routes/index.js` uses `require-directory` to build the hash (rather than doing so manually) like so:

```javascript
var requireDirectory = require('require-directory');
module.exports = requireDirectory(module);
```

`app.js` references `routes/index.js` like any other module, but it now has a hash/tree of the exports from the `./routes/` directory:

```javascript
var routes = require('./routes');

// snip

app.get('/', routes.home);
app.get('/register', routes.auth.register);
app.get('/login', routes.auth.login);
app.get('/logout', routes.auth.logout);
```

The `routes` variable above is the equivalent of this:

```javascript
var routes = {
  home: require('routes/home.js'),
  auth: {
    login: require('routes/auth/login.js'),
    logout: require('routes/auth/logout.js'),
    register: require('routes/auth/register.js')
  }
};
```

*Note that `routes.index` will be `undefined` as you would hope.*

### Specifying Another Directory

You can specify which directory you want to build a tree of (if it isn't the current directory for whatever reason) by passing it as the second parameter. Not specifying the path (`requireDirectory(module)`) is the equivelant of `requireDirectory(module, __dirname)`:

```javascript
var requireDirectory = require('require-directory');
module.exports = requireDirectory(module, __dirname + '/some/subdirectory');
```

For example, in the [example in the Usage section](#usage) we could have avoided creating `routes/index.js` and instead changed the first lines of `app.js` to:

```javascript
var requireDirectory = require('require-directory');
var routes = requireDirectory(module, __dirname + '/routes');
```

### Blacklisting/Whitelisting

`require-directory` takes an optional third parameter that defines which files that should not be included in the hash/tree via either a RegExp or a function. If you pass a function in, it should take a single argument (the path to a file) and return true if that file should be included in the tree. If you pass a RegExp it will be considered a blacklist - files that match that RegExp will **not** be included in the tree:

```javascript
var blacklist = /dontinclude.js$/;
var requireDirectory = require('require-directory');
var hash = requireDirectory(module, __dirname, blacklist);
```

```javascript
var check = function(path){
  if(/dontinclude.js$/.test(path)){
    return false; // don't include
  }else{
    return true; // go ahead and include
  }
};
var requireDirectory = require('require-directory');
var hash = requireDirectory(module, __dirname, check);
```

### Callback

`require-directory` takes a function as an optional fourth parameter that will be called for each module that is added to module.exports. The function has two arguments, `err` and the module.

```javascript
var callback = function(err, mod) {
	// do something with the module, if you'd like
	var done = mod();
};
var requireDirectory = require('require-directory');
var hash = requireDirectory(module, __dirname, null, callback);
```

## Run Unit Tests

```bash
$ npm test
```

## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

## Author

[Troy Goode](https://github.com/TroyGoode) ([troygoode@gmail.com](mailto:troygoode@gmail.com))
