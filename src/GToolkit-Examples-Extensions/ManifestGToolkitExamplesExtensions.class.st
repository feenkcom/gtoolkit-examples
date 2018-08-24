"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGToolkitExamplesExtensions,
	#superclass : #PackageManifest,
	#category : 'GToolkit-Examples-Extensions'
}

{ #category : #'meta-data' }
ManifestGToolkitExamplesExtensions class >> description [ ^ 'I provide a container for storing examples associated with objects from the Pharo IDE. I exist to provide a way to easily group together examples for classes scattered through varions places in the system. Ideally, I should be removed at a certain point in the future and all examples related to a project should go in  dedicated package.'
]
