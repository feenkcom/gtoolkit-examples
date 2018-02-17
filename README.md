# GT-Examples

## Installation

```Smalltalk
Iceberg enableMetacelloIntegration: true.
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples/src';
   load.
```

## To Install Calypso Extensions

[Calypso](https://github.com/dionisiydk/Calypso) is a system browser for [Pharo](http://pharo.org).

```Smalltalk
Iceberg enableMetacelloIntegration: true.
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples/src';
   load: 'CalypsoExtensions'
```
