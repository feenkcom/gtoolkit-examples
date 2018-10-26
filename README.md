# GT Examples [![Build Status](https://travis-ci.com/feenkcom/gtoolkit-examples.svg?branch=master)](https://travis-ci.com/feenkcom/gtoolkit-examples)

Examples is a slim engine that lets you define examples throughout the code and use them for documentation or testing. Through Examples, a developer can switch rapidly from the static code to a live environment and program in the presence of objects. In essence, it enables example-driven development. It is part of the [Glamorous Toolkit project](https://github.com/feenkcom/gtoolkit).

## How to load

To get the full experience of example-driven development, load the entire [Glamorous Toolkit project](https://github.com/feenkcom/gtoolkit).

To load the examples separately, use the following snippet.

```Smalltalk
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples/src';
   load.
```

### How to load Calypso extensions

[Calypso](https://github.com/dionisiydk/Calypso) is a system browser for [Pharo](http://pharo.org).

```Smalltalk
Iceberg enableMetacelloIntegration: true.
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples/src';
   load: 'CalypsoExtensions'
```
