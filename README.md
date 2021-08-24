# GT Examples

Examples is a slim engine that lets you define examples throughout the code and use them for documentation or testing. Through Examples, a developer can switch rapidly from the static code to a live environment and program in the presence of objects. In essence, it enables example-driven development. It is part of the [Glamorous Toolkit project](https://github.com/feenkcom/gtoolkit).

## How to load

To get the full experience of example-driven development, load the entire [Glamorous Toolkit project](https://github.com/feenkcom/gtoolkit).

To load the latest version separately, use the following snippet.

```Smalltalk
Metacello new
   baseline: 'GToolkitExamples';
   repository: 'github://feenkcom/gtoolkit-examples:main/src';
   load.
```
