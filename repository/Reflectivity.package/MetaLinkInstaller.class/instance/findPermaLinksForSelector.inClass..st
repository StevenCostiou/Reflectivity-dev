permalinks
findPermaLinksForSelector: selector inClass: class
	"Permalinks in class for selector are all permalinks installed on:
	- class
	- any anonymous subclass of class implementing selector"

	| classes |
	classes := OrderedCollection with: class.
	classes addAll: (anonSubclassesBuilder allSubclassesOf: class withSelector: selector).
	^ linksRegistry permaLinksForClasses: classes