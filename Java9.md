### Private Interface Methods:
- Only usecase:
  To share code between default methods without requiring you to add another default method to the interface’s API.

- Constraints:
  can not be abstract, i.e. must contain a body
  can not be overriden
  can only be called in the same source file

### Try With Effectively Final Resources
- If connection is _effectively final_, you can write `try (connection){}` instead of the laborious `try (Connection c = connection){}`

### The diamond operator
- Empty Diamond operator can now be applied to anonymous classes. Previously it must be denoted as using `T` like <T>

### Private Safe Varargs And Less Deprecation Warning:
- No more too many warnings with Depreciation code imports
- @SafeVarargs annotations would cause a compile error when applied to non-final methods prior to Java 9

### New And Improved APIs
### Improved Optional API

[Reference](https://blog.codefx.org/java/java-9-tutorial/)