** Intro to depedency management:
Refer: http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html

** Difference between DependencyManagement and Dependencies:

In the parent POM, the main difference between the <dependencies> and <dependencyManagement> is this:

+ Artifacts specified in the <dependencies> section will ALWAYS be included as a dependency of the child module(s).
+ Artifacts specified in the <dependencyManagement> section, will only be included in the child module if they were also specified in the <dependencies> section of the child module itself. 

Why is it good you ask? because you specify the version and/or scope in the parent, and you can leave them out when specifying the dependencies in the child POM. This can help you use unified versions for dependencies for child modules, without specifying the version in each child module.

Reference: https://stackoverflow.com/questions/2619598/differences-between-dependencymanagement-and-dependencies-in-maven

Specify common overrides in <properties> tag and set that using Maven's dynamic replacement: `${ref.value}`

