- Static Methods, when to ?
1.  If you want to have only one piece of storage for a particular piece of data, regardless of how many objects are created, or even if no objects are created
2. Operates only on the arguments
3.. Doesn't need an instance to work (i.e. doesn't change state of an object) Or the instance to work is passed as argument
4. Want to call the method without an instance
Note: Static methods cannot be overriden but are hidden, can be overloaded

- A field that is both static and final has only one piece of storage that cannot be changed. 

- Access to methods or variables are based on the type of variable an object is assigned to and not the object itself.
E.g. Consider Animal type and subtypes: cat and dog, if dog subtype has a method digHole() which Animal type doesnt have then,
Animal dog = new Dog(); dog.digHole(); doesn't work as, assignement type which is Animal doesnt know about digHole method

- How can a private method be accessed by other classes when anything can be done with only restriction isto private keyword cannot be changed ?
1. Add a non-private method to the class that internally calls private method

- Difference between program arguments and VM arguments:
http://www.avajava.com/tutorials/lessons/whats-the-difference-between-program-arguments-and-vm-arguments.html


** Java Documentation:
  + You can use HTML tags in Java doc comments and will be processed
  + Tags: 
    + `@see fully-qualified-classname#method-name` - adds reference to others, 
    + @version version-information
    + @author author-information
    + @since version-information - indicates from which version this class or method exists
    + @param parameter-name description 
    + @return description 
    + @throws fully-qualified-class-name description
    + @deprecated
    
-  Data type casting: 
    if you perform any mathematical or bitwise operations on primitive data types that are smaller than an int (that is, char, byte, or short), those values will be promoted to int before performing the operations, and the resulting value will be of type int. So if you want to assign back into the smaller type, you must use a cast.
