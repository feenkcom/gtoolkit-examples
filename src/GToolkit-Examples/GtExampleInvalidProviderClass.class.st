"
I am an error indicating that within an example there isn't an inheritance relation between the provider class and the method class. The method class is the class containing the example method. The provider class is used to instantiate the object on which the example method is going to run. They can be the same class, or the provider class should be a subclass of the method class.
"
Class {
	#name : #GtExampleInvalidProviderClass,
	#superclass : #GtExampleError,
	#category : #'GToolkit-Examples-Exceptions'
}
