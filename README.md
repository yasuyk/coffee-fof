# coffee-fof.el

## Introduction

A coffee-mode configuration for `ff-find-other-file`.

- You can find the CoffeeScript or JavaScript file corresponding to this file.
- You can find the CoffeeScrpt/JavaScript or test/spec file corresponding to this file.

## Requirements

* coffee-mode
* js-mode, js2-mode or js3-mode


## Installation

You can install `coffee-fof.el` from [MELPA](https://github.com/milkypostman/melpa.git) with package.el
(`M-x package-install coffee-fof`).

## Usage

### `coffee-find-other-file`

(using <kbd>C-c f</kbd>) Find the CoffeeScript or JavaScript file
corresponding to this file.  This command is enabled in `coffee-mode`,
`js-mode`, `js2-mode`, `js3-mode`.

### `coffee-find-test-file`

(using <kbd>C-c s</kbd>) Find the CoffeeScript/JavaScript or test/spec
file corresponding to this file.  This command is enabled in
`coffee-mode`, `js-mode`, `js2-mode`, `js3-mode`.

## Configuration

Add the following to your Emacs init file:

```elisp
(require 'coffee-fof) ;; Not necessary if using ELPA package
(coffee-fof-setup)
```

If the .coffee files and .js files are in the same directory, a configuration is not necessary as default value of coffee-fof-search-directories is '(".").

If the .coffee and .js files are in different directories, for example, .js files are in `js` directory and .coffee files are in `coffee` directory as below,

    .
    ├── coffee
    │   └── example.coffee
    └── js
        └── example.js

customize `coffee-fof-search-directories`.

```elisp
(custom-set-variables
 '(coffee-fof-search-directories
   '("." "../*")))
```

If you want to set another key binding, configure as follow.

    (coffee-fof-setup :other-key "C-c C-f" :test-key "C-c t")
