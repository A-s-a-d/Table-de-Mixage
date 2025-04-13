# Here are two helpfull links for better understanding on how to structure youur project.

 
## General guide : 
[The Pitchfork Layout](https://joholl.github.io/pitchfork-website/#tld.docs)

### build/ 
>A special directory that should not be considered part of the source of the project. Used for storing ephemeral build results. must not be checked into source control. If using source control, must be ignored using source control ignore-lists.

### src/ 
>Main compilable source location. must be present for projects with compiled components that do not use submodules. In the presence of include/, also contains private headers.

### include/ 
>Directory for public headers. may be present. may be omitted for projects that do not distinguish between private/public headers. may be omitted for projects that use submodules.
- For this template include will be used to store .h files if there's no .c or .cpp file for it.

### tests/ 
>Directory for tests.

### examples/ 
>Directory for samples and examples.

### external/ 
>Directory for packages/projects to be used by the project, but not edited as part of 
the project. 
- For this template it'll include all of the external libraries or packages that 
we'll need.

### extras/ 
>Directory containing extra/optional submodules for the project.

### data/ 
>Directory containing non-source code aspects of the project. This might include graphics 
and markup files.

### tools/ 
>Directory containing development utilities, such as build and refactoring scripts.
- For this template it'll contain shell bash scripts or other utilities that'll automatically setup our environnement, automatically install libraries ..., etc

### docs/ 
>Directory for project documentation. 
- For this template it'll contain all of the important documentation needed.

### libs/ 
> Directory for main project submodules. 
- For this template it'll contain all of libraries ond programs that come in pair of .h and .c/.cpp files.

## For more information on libs/ go see the next link.
[Modular code and how to structure an embedded C project](https://www.microforum.cc/blogs/entry/46-modular-code-and-how-to-structure-an-embedded-c-project/)

