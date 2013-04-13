# coffee-fof.el

## Introduction

A `ff-find-other-file` wrapper for coffee-mode.el.

Find the CoffeeScript or JavaScript file corresponding to this file.

## Requirements

* coffee-mode
* js-mode, js2-mode or js3-mode


## Installation

You can install `coffee-fof.el` from [MELPA](https://github.com/milkypostman/melpa.git) with package.el
(`M-x package-install coffee-fof`).

## Configuration

Add the following to your Emacs init file unless using ELPA package:

```elisp
(require 'coffee-fof) ;; Not necessary if using ELPA package
(coffee-fof-setup-key)
```

If the .coffee files and .js files are in the same directory, a configuration is not necessary as default value of coffee-fof-search-directories is '(".").

If the .coffee and .js files are in different directories, for example, .js files are in `js` directory and .coffee files are in `coffee` directory as below, customize `coffee-fof-search-directories`.

    .
    ├── coffee
    │   └── example.coffee
    └── js
        └── example.js

```elisp
(custom-set-variables
 '(coffee-fof-search-directories
   '("." "../*")))
```

## Usage


### `coffee-find-other-file` <kbd>C-c f</kbd>

Find the CoffeeScript or JavaScript file corresponding to this
file.  This command is enabled in `coffee-mode`, `js-mode`,
`js2-mode`, `js3-mode`.
