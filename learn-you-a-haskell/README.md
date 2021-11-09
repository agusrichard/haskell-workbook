# Learn you a Haskell

</br>

## List of Contents:
### 1. [Introduction](#content-1)
### 2. [Starting Out](#content-2)
### 3. [Types and Typeclasses](#content-3)
### 4. [Syntax in Functions](#content-4)
### 5. [Recursion](#content-5)
### 6. [Higher order functions](#content-6)
### 7. [Modules](#content-7)
### 8. [Making Our Own Types and Typeclasses](#content-8)

</br>

---

## Contents

## [Introduction](http://learnyouahaskell.com/introduction) <span id="content-1"><span>

### So what's Haskell?
- Haskell is a purely functional programming language.
- In imperative languages you get things done by giving the computer a sequence of tasks and then it executes them. While executing them, it can change state.
- In purely functional programming you don't tell the computer what to do as such but rather you tell it what stuff is.
- Once you initialize a variable, you can't change it
- In purely functional languages, a function has no side-effects.
- Functional programming has a property called Idempotency. Which means that if you give a function a certain input, it's guaranteed that you also get the same output everytime you run the function.
- Haskell is lazy. That means that unless specifically told otherwise, Haskell won't execute functions and calculate things until it's really forced to show you a result.
- In a lazy language, calling `doubleMe` on a list without forcing it to show you the result ends up in the program sort of telling you "Yeah yeah, I'll do it later!".
- Haskell is statically typed. When you compile your program, the compiler knows which piece of code is a number, which is a string and so on. 
- Haskell uses a very good type system that has type inference. That means that you don't have to explicitly label every piece of code with a type because the type system can intelligently figure out a lot about it.

### What you need to dive in
- To load haskell script file (assuming we have `introduction.hs`), run: `:l introduction` on ghci.
- To reload the script, run: `:r`
- (Author's opinion) The usual workflow for me when playing around in stuff is defining some functions in a .hs file, loading it up and messing around with them and then changing the .hs file, loading it up again and so on. This is also what we'll be doing here.

**[⬆ back to top](#list-of-contents)**

</br>

---


## [Starting Out](http://learnyouahaskell.com/starting-out) <span id="content-2"><span>

### Ready, set, go!
- Run `ghci` to enter the GHC interactive mode
- By default the propmt is `Prelude> `, but we can change it to `ghci> ` using `:set propmt "ghci >"`
- A little pitfall to watch out for here is negating numbers. If we want to have a negative number, it's always best to surround it with parentheses. Doing 5 * -3 will make GHCI yell at you but doing 5 * (-3) will work just fine.
- Snippet working with numbers: </br>
  ```haskell
  ghci> (50 * 100) - 4999  
  1  
  ghci> 50 * 100 - 4999  
  1  
  ghci> 50 * (100 - 4999)  
  -244950  
  ```
- `&&` boolean and
- `||` boolean or
- `not` to negate things
- Snippet for boolean operations: </br>
  ```haskell
  ghci> True && False  
  False  
  ghci> True && True  
  True  
  ghci> False || True  
  True   
  ghci> not False  
  True  
  ghci> not (True && True)  
  False  
  ```
- Testing for equality: </br>
  ```haskell
  ghci> 5 == 5  
  True  
  ghci> 1 == 0  
  False  
  ghci> 5 /= 5  
  False  
  ghci> 5 /= 4  
  True  
  ghci> "hello" == "hello"  
  True 
  ```
- We can do things like `True == 5` or `5 + "Burger"`
- Whereas + works only on things that are considered numbers, == works on any two things that can be compared.
- Note: you can do 5 + 4.0 because 5 is sneaky and can act like an integer or a floating-point number. 4.0 can't act like an integer, so 5 is the one that has to adapt.
- For instance, * is a function that takes two numbers and multiplies them. As you've seen, we call it by sandwiching it between them. This is what we call an infix function. Another example: ``a `div` b``
- Functions are usually prefix so from now on we won't explicitly state that a function is of the prefix form, e.g `succ a`
- In Haskell, functions are called by writing the function name, a space and then the parameters, separated by spaces.
- The succ function takes anything that has a defined successor and returns that successor. </br>
  ```haskell
  ghci> succ 8  
  9   
  ```
- The functions min and max take two things that can be put in an order (like numbers!). min returns the one that's lesser and max returns the one that's greater.  </br>
  ```haskell
  ghci> min 9 10  
  9  
  ghci> min 3.4 3.2  
  3.2  
  ghci> max 100 101  
  101   
  ```
- Function application (calling a function by putting a space after it and then typing out the parameters) has the highest precedence of them all

### Baby's first functions
- First function </br>
  ```haskell
  doubleMe x = x + x  
  ```
- Functions are defined in a similar way that they are called. The function name is followed by parameters seperated by spaces. But when defining functions, there's a = and after that we define what the function does.
- Functions in Haskell don't have to be in any particular order, so it doesn't matter if you define doubleMe first and then doubleUs or if you do it the other way around.
- Example:
  ```haskell
  doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2 
  ```
- You're probably familiar with if statements from other languages. The difference between Haskell's if statement and if statements in imperative languages is that the else part is mandatory in Haskell.
- In imperative languages you can just skip a couple of steps if the condition isn't satisfied but in Haskell every expression and function must return something.
- Another thing about the if statement in Haskell is that it is an expression.
- An expression is basically a piece of code that returns a value.
- We usually use ' to either denote a strict version of a function (one that isn't lazy) or a slightly modified version of a function or a variable
- Functions can't begin with uppercase letters. 
-  When a function doesn't take any parameters, we usually say it's a definition (or a name).

### An intro to lists
- In Haskell, lists are a homogenous data structure. It stores several elements of the same type. That means that we can have a list of integers or a list of characters but we can't have a list that has a few integers and then a few characters.
- We can use the let keyword to define a name right in GHCI. Doing let a = 1 inside GHCI is the equivalent of writing a = 1 in a script and then loading it.
- List on ghci: </br>
  ```haskell
  ghci> let lostNumbers = [4,8,15,16,23,42]  
  ghci> lostNumbers  
  [4,8,15,16,23,42]  
  ```
- List concatenation: </br>
  ```haskell
  ghci> [1,2,3,4] ++ [9,10,11,12]  
  [1,2,3,4,9,10,11,12]  
  ghci> "hello" ++ " " ++ "world"  
  "hello world"  
  ghci> ['w','o'] ++ ['o','t']  
  "woot"    
  ```
- When you put together two lists (even if you append a singleton list to a list, for instance: [1,2,3] ++ [4]), internally, Haskell has to walk through the whole list on the left side of ++. That's not a problem when dealing with lists that aren't too big. But putting something at the end of a list that's fifty million entries long is going to take a while.
- Another way to concat at the beginning of a list: </br>
  ```haskell
  ghci> 'A':" SMALL CAT"  
  "A SMALL CAT"  
  ghci> 5:[1,2,3,4,5]  
  [5,1,2,3,4,5]
  ```
- `[1,2,3]` is actually just syntactic sugar for `1:2:3:[]`. `[]` is an empty list. If we prepend 3 to it, it becomes `[3]`. If we prepend 2 to that, it becomes `[2,3]`, and so on.
- Indexing a list: </br>
  ```haskell
  ghci> "Steve Buscemi" !! 6  
  'B'  
  ghci> [9.4,33.2,96.2,11.2,23.25] !! 1  
  33.2  
  ```
- Lists within lists: </br>
  ```haskell
  ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
  ghci> b  
  [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
  ghci> b ++ [[1,1,1,1]]  
  [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]  
  ghci> [6,6,6]:b  
  [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
  ghci> b !! 2  
  [1,2,2,3,4]  
  ```
- The lists within a list can be of different lengths but they can't be of different types.
- Lists can be compared if the stuff they contain can be compared. When using <, <=, > and >= to compare lists, they are compared in lexicographical order. First the heads are compared. If they are equal then the second elements are compared: </br>
  ```haskell
  ghci> [3,2,1] > [2,1,0]  
  True  
  ghci> [3,2,1] > [2,10,100]  
  True  
  ghci> [3,4,2] > [3,4]  
  True  
  ghci> [3,4,2] > [2,4]  
  True  
  ghci> [3,4,2] == [3,4,2]  
  True   
  ```
- **head** takes a list and returns its head. The head of a list is basically its first element. </br>
  ```haskell
  ghci> head [5,4,3,2,1]  
  5   
  ```
- **tail** takes a list and returns its tail. In other words, it chops off a list's head. </br>
  ```haskell
  ghci> tail [5,4,3,2,1]  
  [4,3,2,1]     
  ```
- **last** takes a list and returns its last element. </br>
  ```haskell
  ghci> last [5,4,3,2,1]  
  1       
  ```
- **init** takes a list and returns everything except its last element. </br>
  ```haskell
  ghci> init [5,4,3,2,1]  
  [5,4,3,2]    
  ```
- List as a monster: </br>
  ![List monster](http://s3.amazonaws.com/lyah/listmonster.png)
- When using head, tail, last and init, be careful not to use them on empty lists. This error cannot be caught at compile time so it's always good practice to take precautions against accidentally telling Haskell to give you some elements from an empty list.
- There are other built-in functions for list. We can check them on the official documentation.

### Texas ranges
- Ranges are a way of making lists that are arithmetic sequences of elements that can be enumerated.
- Writing `[1...20]` is the equivalent of writing [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]. </br>
  ```haskell
  ghci> [1..20]  
  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  
  ghci> ['a'..'z']  
  "abcdefghijklmnopqrstuvwxyz"  
  ghci> ['K'..'Z']  
  "KLMNOPQRSTUVWXYZ"  
  ```
- Ranges are cool because you can also specify a step. What if we want all even numbers between 1 and 20? Or every third number between 1 and 20? </br>
  ```haskell
  ghci> [2,4..20]  
  [2,4,6,8,10,12,14,16,18,20]  
  ghci> [3,6..20]  
  [3,6,9,12,15,18] 
  ```
- We can only use the above for arithmetic sequence.
- To make a list with all the numbers from 20 to 1, you can't just do [20..1], you have to do [20,19..1].
- Watch out when using floating point numbers in ranges! Because they are not completely precise (by definition), their use in ranges can yield some pretty funky results. </br>
  ```haskell
  ghci> [0.1, 0.3 .. 1]  
  [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  
  ```
- `[13,26..24*13]` and `take 24 [13,26..]` are the same way to achieve the same thing. But the later is better.
- A handful of functions that produce infinite lists:
  - **cycle**: takes a list and cycles it into an infinite list. If you just try to display the result, it will go on forever so you have to slice it off somewhere. </br>
    ```haskell
    ghci> take 10 (cycle [1,2,3])  
    [1,2,3,1,2,3,1,2,3,1]  
    ghci> take 12 (cycle "LOL ")  
    "LOL LOL LOL "
    ```
  - **repeat**: takes an element and produces an infinite list of just that element. It's like cycling a list with only one element. </br>
    ```haskell
    ghci> take 10 (repeat 5)  
    [5,5,5,5,5,5,5,5,5,5] 
    ```

### I'm a list comprehension
- A basic comprehension for a set that contains the first ten even natural numbers is ![](http://s3.amazonaws.com/lyah/setnotation.png).
- The part before the pipe is called the output function, x is the variable, N is the input set and x <= 10 is the predicate. That means that the set contains the doubles of all natural numbers that satisfy the predicate.
- Double values in a list with list comprehension (and more): </br>
  ```haskell
  ghci> [x*2 | x <- [1..10]]  
  [2,4,6,8,10,12,14,16,18,20]
  ghci> [x*2 | x <- [1..10], x*2 >= 12]  
  [12,14,16,18,20]
  ghci> [ x | x <- [50..100], x `mod` 7 == 3]  
  [52,59,66,73,80,87,94]   
  ```
- Note that weeding out lists by predicates is also called filtering. We took a list of numbers and we filtered them by the predicate.
- More awesome example: </br>
  ```haskell
  boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

  ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
  [10,11,12,14,16,17,18,20]
  ```
- Combining two list in a list comprehension: </br>
  ```haskell
  ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]  
  [16,20,22,40,50,55,80,100,110]   
  ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]  
  [55,80,100,110]
  ghci> let nouns = ["hobo","frog","pope"]  
  ghci> let adjectives = ["lazy","grouchy","scheming"]  
  ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
  ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
  "grouchy pope","scheming hobo","scheming frog","scheming pope"] 
  ```

### Tuples
- Tuples are used when you know exactly how many values you want to combine and its type depends on how many components it has and the types of the components.
- Tuples don't have to be homogeneous.
- But we can have pair and triple in the same list. The tuples we have in a list, but have the same size.
- Tuples are much more rigid because each different size of tuple is its own type, so you can't write a general function to append an element to a tuple — you'd have to write a function for appending to a pair, one function for appending to a triple, one function for appending to a 4-tuple, etc.
- There is no singleton tuple.
- **zip**. It takes two lists and then zips them together into one list by joining the matching elements into pairs. </br>
  ```haskell
  ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
  [(1,5),(2,5),(3,5),(4,5),(5,5)]  
  ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]  
  [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]  
  ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]  
  [(5,"im"),(3,"a"),(2,"turtle")] 
  ghci> zip [1..] ["apple", "orange", "cherry", "mango"]  
  [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]  
  ```

**[⬆ back to top](#list-of-contents)**

</br>

---

## [Types and Typeclasses](http://learnyouahaskell.com/types-and-typeclasses) <span id="content-3"><span>

### Believe the type
- Haskell has type inference. If we write a number, we don't have to tell Haskell it's a number. It can infer that on its own, so we don't have to explicitly write out the types of our functions and expressions to get things done.
- A type is a kind of label that every expression has. It tells us in which category of things that expression fits. The expression True is a boolean, "hello" is a string, etc.
- Checking type: </br>
  ```haskell
  ghci> :t 'a'  
  'a' :: Char  
  ghci> :t True  
  True :: Bool  
  ghci> :t "HELLO!"  
  "HELLO!" :: [Char]  
  ghci> :t (True, 'a')  
  (True, 'a') :: (Bool, Char)  
  ghci> :t 4 == 5  
  4 == 5 :: Bool 
  ```
- `::` is read as "has type of".
-  Examining the type of `"HELLO!"` yields a `[Char]`. The square brackets denote a list. So we read that as it being a list of characters.
- Some common types:
  - `Int` stands for integer. It's used for whole numbers. 7 can be an Int but 7.2 cannot. Int is bounded, which means that it has a minimum and a maximum value. Usually on 32-bit machines the maximum possible Int is 2147483647 and the minimum is -2147483648.
  - `Integer` stands for, er … also integer. The main difference is that it's not bounded so it can be used to represent really really big numbers. I mean like really big. Int, however, is more efficient.
  - `Float` is a real floating point with single precision.
  - `Double` is a real floating point with double the precision!
  - `Bool` is a boolean type. It can have only two values: True and False.
  - `Char` represents a character. It's denoted by single quotes. A list of characters is a string.

### Type variables
- Type variables are similar to generics to other programming language.
- Functions that have type variables are called polymorphic functions.
- Although type variables can have names longer than one character, we usually give them names of a, b, c, d …
- Snippet: </nr>
  ```haskell
  ghci> :t head  
  head :: [a] -> a 
  ghci> :t fst  
  fst :: (a, b) -> a
  ```

### Typeclasses 101
- A typeclass is a sort of interface that defines some behavior. If a type is a part of a typeclass, that means that it supports and implements the behavior the typeclass describes.
- Snippet: </br>
  ```haskell
  ghci> :t (==)  
  (==) :: (Eq a) => a -> a -> Bool 
  ```
- Everything before the => symbol is called a class constraint.
- We can read the previous type declaration like this: the equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (this was the class constraint).
- Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class. All standard Haskell types except for IO (the type for dealing with input and output) and functions are a part of the Eq typeclass.
- `Eq` is used for types that support equality testing. The functions its members implement are `==` and `/=.` So if there's an Eq class constraint for a type variable in a function, it uses `==` or `/=` somewhere inside its definition.
- Ord is for types that have an ordering. </br>
  ```haskell
  ghci> :t (>)  
  (>) :: (Ord a) => a -> a -> Bool 
  ```
- Ord covers all the standard comparing functions such as >, <, >= and <=. The compare function takes two Ord members of the same type and returns an ordering. Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively.
- Members of Show can be presented as strings. All types covered so far except for functions are a part of Show. The most used function that deals with the Show typeclass is show. It takes a value whose type is a member of Show and presents it to us as a string. </br>
  ```haskell
  ghci> show 3  
  "3"  
  ghci> show 5.334  
  "5.334"  
  ghci> show True  
  "True" 
  ```
- Read is sort of the opposite typeclass of Show. The read function takes a string and returns a type which is a member of Read. </br>
  ```haskell
  ghci> read "True" || False  
  True  
  ghci> read "8.2" + 3.8  
  12.0  
  ghci> read "5" - 2  
  3  
  ghci> read "[1,2,3,4]" ++ [3]  
  [1,2,3,4,3]
  ghci> read "4"  
  <interactive>:1:0:  
      Ambiguous type variable `a' in the constraint:  
        `Read a' arising from a use of `read' at <interactive>:1:0-7  
      Probable fix: add a type signature that fixes these type variable(s)  
  ```
- It returns a type that's part of Read but if we don't try to use it in some way later, it has no way of knowing which type.
- If we wan to just read it, then </br>
  ```haskell
  ghci> read "5" :: Int  
  5  
  ghci> read "5" :: Float  
  5.0  
  ghci> (read "5" :: Float) * 4  
  20.0  
  ghci> read "[1,2,3,4]" :: [Int]  
  [1,2,3,4]  
  ghci> read "(3, 'a')" :: (Int, Char)  
  (3, 'a')  
  ```
- Enum members are sequentially ordered types — they can be enumerated. The main advantage of the Enum typeclass is that we can use its types in list ranges. They also have defined successors and predecesors, which you can get with the succ and pred functions. Types in this class: (), Bool, Char, Ordering, Int, Integer, Float and Double. </br>
  ```haskell
  ghci> ['a'..'e']  
  "abcde"  
  ghci> [LT .. GT]  
  [LT,EQ,GT]  
  ghci> [3 .. 5]  
  [3,4,5]  
  ghci> succ 'B'  
  'C'  
  ```
- Num is a numeric typeclass. Its members have the property of being able to act like numbers.
- Integral is also a numeric typeclass. Num includes all numbers, including real numbers and integral numbers, Integral includes only integral (whole) numbers. In this typeclass are Int and Integer.
- Floating includes only floating point numbers, so Float and Double.

**[⬆ back to top](#list-of-contents)**

</br>

---

## [Syntax in Functions](http://learnyouahaskell.com/syntax-in-functions) <span id="content-4"><span>

### Pattern matching
- Pattern matching consists of specifying patterns to which some data should conform and then checking to see if it does and deconstructing the data according to those patterns.
- You can pattern match on any data type — numbers, characters, lists, tuples, etc.
- Example:
  ```haskell
  lucky :: (Integral a) => a -> String  
  lucky 7 = "LUCKY NUMBER SEVEN!"  
  lucky x = "Sorry, you're out of luck, pal!"   
  ```
- When you call lucky, the patterns will be checked from top to bottom and when it conforms to a pattern, the corresponding function body will be used. 
- This function could have also been implemented by using an if statement. But what if we wanted a function that says the numbers from 1 to 5 and says "Not between 1 and 5" for any other number? Without pattern matching, we'd have to make a pretty convoluted if then else tree. However, with it:
  ```haskell
  sayMe :: (Integral a) => a -> String  
  sayMe 1 = "One!"  
  sayMe 2 = "Two!"  
  sayMe 3 = "Three!"  
  sayMe 4 = "Four!"  
  sayMe 5 = "Five!"  
  sayMe x = "Not between 1 and 5"  
  ```
- Note that if we moved the last pattern (the catch-all one) to the top, it would always say "Not between 1 and 5", because it would catch all the numbers and they wouldn't have a chance to fall through and be checked for any other patterns.
- Factorial in recursive definition:
  ```haskell
  factorial :: (Integral a) => a -> a  
  factorial 0 = 1  
  factorial n = n * factorial (n - 1)
  ```
- That's why order is important when specifying patterns and it's always best to specify the most specific ones first and then the more general ones later.
- Pattern matching failed:
  ```haskell
  charName :: Char -> String  
  charName 'a' = "Albert"  
  charName 'b' = "Broseph"  
  charName 'c' = "Cecil"  
  ```
- It complains that we have non-exhaustive patterns, and rightfully so. When making patterns, we should always include a catch-all pattern so that our program doesn't crash if we get some unexpected input.
- Pattern matching in tuples:
  ```haskell
  addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
  addVectors a b = (fst a + fst b, snd a + snd b)  
  ```
  ```haskell
  addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
  addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  
  ```
- Some functions for triple:
  ```haskell
  first :: (a, b, c) -> a  
  first (x, _, _) = x  
    
  second :: (a, b, c) -> b  
  second (_, y, _) = y  
    
  third :: (a, b, c) -> c  
  third (_, _, z) = z  
  ```
- Tuple pattern matching in list comprehension
  ```haskell
  ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
  ghci> [a+b | (a,b) <- xs]  
  [4,7,6,8,11,4]   
  ```
- The x:xs pattern is used a lot, especially with recursive functions. But patterns that have : in them only match against lists of length 1 or more.
- head function in a different way:
  ```haskell
  head' :: [a] -> a  
  head' [] = error "Can't call head on an empty list, dummy!"  
  head' (x:_) = x  
  ```
- Fortune teller function:
  ```haskell
  tell :: (Show a) => [a] -> String  
  tell [] = "The list is empty"  
  tell (x:[]) = "The list has one element: " ++ show x  
  tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
  tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  
  ```
- length function in another form:
  ```haskell
  length' :: (Num b) => [a] -> b  
  length' [] = 0  
  length' (_:xs) = 1 + length' xs  
  ```
- sum function:
  ```haskell
  sum' :: (Num a) => [a] -> a  
  sum' [] = 0  
  sum' (x:xs) = x + sum' xs  
  ```
- There's also a thing called as patterns. Those are a handy way of breaking something up according to a pattern and binding it to names whilst still keeping a reference to the whole thing. You do that by putting a name and an @ in front of a pattern. For instance, the pattern xs@(x:y:ys). This pattern will match exactly the same thing as x:y:ys but you can easily get the whole list via xs instead of repeating yourself by typing out x:y:ys in the function body again. Here's a quick and dirty example:
  ```haskell
  capital :: String -> String  
  capital "" = "Empty string, whoops!"  
  capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  
  ```
- One more thing — you can't use ++ in pattern matches. If you tried to pattern match against (xs ++ ys), what would be in the first and what would be in the second list? It doesn't make much sense. It would make sense to match stuff against (xs ++ [x,y,z]) or just (xs ++ [x]), but because of the nature of lists, you can't do that.

### Guards, guards!
- Whereas patterns are a way of making sure a value conforms to some form and deconstructing it, guards are a way of testing whether some property of a value (or several of them) are true or false. That sounds a lot like an if statement and it's very similar. The thing is that guards are a lot more readable when you have several conditions and they play really nicely with patterns.
- BMI function:
  ```haskell
  bmiTell :: (RealFloat a) => a -> String  
  bmiTell bmi  
      | bmi <= 18.5 = "You're underweight, you emo, you!"  
      | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
      | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
      | otherwise   = "You're a whale, congratulations!"  
  ```
- Guards are indicated by pipes that follow a function's name and its parameters. Usually, they're indented a bit to the right and lined up. A guard is basically a boolean expression. If it evaluates to True, then the corresponding function body is used. If it evaluates to False, checking drops through to the next guard and so on.
- This is very reminiscent of a big if else tree in imperative languages, only this is far better and more readable. While big if else trees are usually frowned upon, sometimes a problem is defined in such a discrete way that you can't get around them. Guards are a very nice alternative for this.
- Many times, the last guard is otherwise. otherwise is defined simply as otherwise = True and catches everything. This is very similar to patterns, only they check if the input satisfies a pattern but guards check for boolean conditions. If all the guards of a function evaluate to False (and we haven't provided an otherwise catch-all guard), evaluation falls through to the next pattern. That's how patterns and guards play nicely together. If no suitable guards or patterns are found, an error is thrown.
- Another BMI example:
  ```haskell
  bmiTell :: (RealFloat a) => a -> a -> String  
  bmiTell weight height  
      | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
      | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
      | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
      | otherwise                 = "You're a whale, congratulations!"  
  ```
- Example:
  ```haskell
  max' :: (Ord a) => a -> a -> a  
  max' a b   
      | a > b     = a  
      | otherwise = b 
  ```
  ```haskell
  myCompare :: (Ord a) => a -> a -> Ordering  
  a `myCompare` b  
      | a > b     = GT  
      | a == b    = EQ  
      | otherwise = LT 
  ```

### Where!?
- Using where to define bmiTell:
  ```haskell
  bmiTell :: (RealFloat a) => a -> a -> String  
  bmiTell weight height  
      | bmi <= 18.5 = "You're underweight, you emo, you!"  
      | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
      | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
      | otherwise   = "You're a whale, congratulations!"  
      where bmi = weight / height ^ 2  
  ```
  ```haskell
  bmiTell :: (RealFloat a) => a -> a -> String  
  bmiTell weight height  
      | bmi <= skinny = "You're underweight, you emo, you!"  
      | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
      | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
      | otherwise     = "You're a whale, congratulations!"  
      where bmi = weight / height ^ 2  
            skinny = 18.5  
            normal = 25.0  
            fat = 30.0  
  ```
- We put the keyword where after the guards (usually it's best to indent it as much as the pipes are indented) and then we define several names or functions. These names are visible across the guards and give us the advantage of not having to repeat ourselves.
- The names we define in the where section of a function are only visible to that function, so we don't have to worry about them polluting the namespace of other functions. Notice that all the names are aligned at a single column. If we don't align them nice and proper, Haskell gets confused because then it doesn't know they're all part of the same block.
- You can also use where bindings to pattern match! We could have rewritten the where section of our previous function as:
  ```haskell
  ...  
  where bmi = weight / height ^ 2  
        (skinny, normal, fat) = (18.5, 25.0, 30.0) 
  ```
- Initials:
  ```haskell
  initials :: String -> String -> String  
  initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
      where (f:_) = firstname  
            (l:_) = lastname   
  ```
- Just like we've defined constants in where blocks, you can also define functions. Staying true to our healthy programming theme, let's make a function that takes a list of weight-height pairs and returns a list of BMIs.
  ```haskell
  calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
  calcBmis xs = [bmi w h | (w, h) <- xs]  
      where bmi weight height = weight / height ^ 2 
  ```
- `where` bindings can also be nested. It's a common idiom to make a function and define some helper function in its where clause and then to give those functions helper functions as well, each with its own where clause.


### Let it be
- Very similar to where bindings are let bindings. Where bindings are a syntactic construct that let you bind to variables at the end of a function and the whole function can see them, including all the guards.
-  Let bindings let you bind to variables anywhere and are expressions themselves, but are very local, so they don't span across guards. Just like any construct in Haskell that is used to bind values to names, let bindings can be used for pattern matching.
- Example:
  ```haskell
  cylinder :: (RealFloat a) => a -> a -> a  
  cylinder r h = 
      let sideArea = 2 * pi * r * h  
          topArea = pi * r ^2  
      in  sideArea + 2 * topArea  
  ```
- The form is let <bindings> in <expression>. The names that you define in the let part are accessible to the expression after the in part.
- For now it just seems that let puts the bindings first and the expression that uses them later whereas where is the other way around.
- The difference is that let bindings are expressions themselves. where bindings are just syntactic constructs.
- Example:
  ```haskell
  ghci> [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]  
  ["Woo", "Bar"]  
  ghci> 4 * (if 10 > 5 then 10 else 0) + 2  
  42  
  ```
  ```haskell
  ghci> 4 * (let a = 9 in a + 1) + 2  
  42  
  ```
  ```haskell
  ghci> [let square x = x * x in (square 5, square 3, square 2)]  
  [(25,9,4)]  
  ```
- If we want to bind to several variables inline, we obviously can't align them at columns. That's why we can separate them with semicolons.
  ```haskell
  ghci> (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)  
  (6000000,"Hey there!")  
  ```
  ```haskell
  ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100  
  600  
  ```
- You can also put let bindings inside list comprehensions.
  ```haskell
  calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
  calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

  calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
  calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
  ```
- We include a let inside a list comprehension much like we would a predicate, only it doesn't filter the list, it only binds to names. The names defined in a let inside a list comprehension are visible to the output function (the part before the |) and all predicates and sections that come after of the binding.
- We omitted the in part of the let binding when we used them in list comprehensions because the visibility of the names is already predefined there.
- However, we could use a let in binding in a predicate and the names defined would only be visible to that predicate.
- If let bindings are so cool, why not use them all the time instead of where bindings, you ask? Well, since let bindings are expressions and are fairly local in their scope, they can't be used across guards. Some people prefer where bindings because the names come after the function they're being used in. That way, the function body is closer to its name and type declaration and to some that's more readable.

### Case expressions
- Like the name implies, case expressions are, well, expressions, much like if else expressions and let bindings. Not only can we evaluate expressions based on the possible cases of the value of a variable, we can also do pattern matching.
- First example:
  ```haskell
  head' :: [a] -> a  
  head' xs = case xs of [] -> error "No head for empty lists!"  
                        (x:_) -> x  
  ```
- Syntax:
  ```haskell
  case expression of pattern -> result  
                     pattern -> result  
                     pattern -> result  
                     ...  
  ```
- `expression` is matched against the patterns. The pattern matching action is the same as expected: the first pattern that matches the expression is used. If it falls through the whole case expression and no suitable pattern is found, a runtime error occurs.
- Example:
  ```haskell
  describeList :: [a] -> String  
  describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                                 [x] -> "a singleton list."   
                                                 xs -> "a longer list." 
  ```
- They are useful for pattern matching against something in the middle of an expression. Because pattern matching in function definitions is syntactic sugar for case expressions, we could have also defined this like so:
  ```haskell
  describeList :: [a] -> String  
  describeList xs = "The list is " ++ what xs  
      where what [] = "empty."  
            what [x] = "a singleton list."  
            what xs = "a longer list."  
  ```


**[⬆ back to top](#list-of-contents)**

</br>

---

## [Recursion](http://learnyouahaskell.com/recursion) <span id="content-5"><span>

### Hello recursion!
- Recursion is actually a way of defining functions in which the function is applied inside its own definition.
- Having an element or two in a recursion definition defined non-recursively (like F(0) and F(1) here) is also called the edge condition and is important if you want your recursive function to terminate. 
- Recursion is important to Haskell because unlike imperative languages, you do computations in Haskell by declaring what something is instead of declaring how you get it.

### Maximum awesome
- The maximum function takes a list of things that can be ordered (e.g. instances of the Ord typeclass) and returns the biggest of them.
- We could first set up an edge condition and say that the maximum of a singleton list is equal to the only element in it.
- Then we can say that the maximum of a longer list is the head if the head is bigger than the maximum of the tail. If the maximum of the tail is bigger, well, then it's the maximum of the tail.
- Implementation:
  ```haskell
  maximum' :: (Ord a) => [a] -> a  
  maximum' [] = error "maximum of empty list"  
  maximum' [x] = x  
  maximum' (x:xs)   
      | x > maxTail = x  
      | otherwise = maxTail  
      where maxTail = maximum' xs 
  ```
- Most imperative languages don't have pattern matching so you have to make a lot of if else statements to test for edge conditions.
- So the first edge condition says that if the list is empty, crash! Makes sense because what's the maximum of an empty list? I don't know.
- The second pattern also lays out an edge condition. It says that if it's the singleton list, just give back the only element.
- Now the third pattern is where the action happens. We use pattern matching to split a list into a head and a tail. This is a very common idiom when doing recursion with lists, so get used to it. We use a where binding to define maxTail as the maximum of the rest of the list. Then we check if the head is greater than the maximum of the rest of the list. If it is, we return the head. Otherwise, we return the maximum of the rest of the list.
- Using max:
  ```haskell
  maximum' :: (Ord a) => [a] -> a  
  maximum' [] = error "maximum of empty list"  
  maximum' [x] = x  
  maximum' (x:xs) = max x (maximum' xs)
  ```

### A few more recursive functions
- First off, we'll implement replicate. replicate takes an Int and some element and returns a list that has several repetitions of the same element.
- For instance, replicate 3 5 returns [5,5,5]. Let's think about the edge condition. My guess is that the edge condition is 0 or less. If we try to replicate something zero times, it should return an empty list. Also for negative numbers, because it doesn't really make sense.
- Example:
  ```haskell
  replicate' :: (Num i, Ord i) => i -> a -> [a]  
  replicate' n x  
      | n <= 0    = []  
      | otherwise = x:replicate' (n-1) x  
  ```
- Num is not a subclass of Ord. That means that what constitutes for a number doesn't really have to adhere to an ordering. So that's why we have to specify both the Num and Ord class constraints when doing addition or subtraction and also comparison.
- Next up, we'll implement take. It takes a certain number of elements from a list. For instance, take 3 [5,4,3,2,1] will return [5,4,3]. If we try to take 0 or less elements from a list, we get an empty list. Also if we try to take anything from an empty list, we get an empty list. Notice that those are two edge conditions right there. So let's write that out:
  ```haskell
  take' :: (Num i, Ord i) => i -> [a] -> [a]  
  take' n _  
      | n <= 0   = []  
  take' _ []     = []  
  take' n (x:xs) = x : take' (n-1) xs  
  ```
- The first pattern specifies that if we try to take a 0 or negative number of elements, we get an empty list. Notice that we're using _ to match the list because we don't really care what it is in this case.
- Also notice that we use a guard, but without an otherwise part. That means that if n turns out to be more than 0, the matching will fall through to the next pattern.
- The second pattern indicates that if we try to take anything from an empty list, we get an empty list.
- The third pattern breaks the list into a head and a tail. And then we state that taking n elements from a list equals a list that has x as the head and then a list that takes n-1 elements from the tail as a tail.
- Reverse example:
  ```haskell
  reverse' :: [a] -> [a]  
  reverse' [] = []  
  reverse' (x:xs) = reverse' xs ++ [x]
  ```
- The good thing about infinite lists though is that we can cut them where we want
- Zip example:
  ```haskell
  zip' :: [a] -> [b] -> [(a,b)]  
  zip' _ [] = []  
  zip' [] _ = []  
  zip' (x:xs) (y:ys) = (x,y):zip' xs ys  
  ```
- Elem example:
  ```haskell
  elem' :: (Eq a) => a -> [a] -> Bool  
  elem' a [] = False  
  elem' a (x:xs)  
      | a == x    = True  
      | otherwise = a `elem'` xs   
  ```

### Quick, sort!
- So, the type signature is going to be quicksort :: (Ord a) => [a] -> [a]. No surprises there.
- The edge condition? Empty list, as is expected. A sorted empty list is an empty list.
- Now here comes the main algorithm: a sorted list is a list that has all the values smaller than (or equal to) the head of the list in front (and those values are sorted), then comes the head of the list in the middle and then come all the values that are bigger than the head (they're also sorted).
- Quick sort example:
  ```haskell
  quicksort :: (Ord a) => [a] -> [a]  
  quicksort [] = []  
  quicksort (x:xs) =   
      let smallerSorted = quicksort [a | a <- xs, a <= x]  
          biggerSorted = quicksort [a | a <- xs, a > x]  
      in  smallerSorted ++ [x] ++ biggerSorted  
  ```

### Thinking recursively
- We did quite a bit of recursion so far and as you've probably noticed, there's a pattern here. Usually you define an edge case and then you define a function that does something between some element and the function applied to the rest.
- Of course, these also have edge cases. Usually the edge case is some scenario where a recursive application doesn't make sense.
- When dealing with lists, the edge case is most often the empty list.
-  If you're dealing with trees, the edge case is usually a node that doesn't have any children.

**[⬆ back to top](#list-of-contents)**

</br>

---

## [Higher order functions](http://learnyouahaskell.com/higher-order-functions) <span id="content-6"><span>

### Introduction
- Haskell functions can take functions as parameters and return functions as return values. A function that does either of those is called a higher order function.

### Curried functions 
- Every function in Haskell officially only takes one parameter.
- ll the functions that accepted several parameters so far have been curried functions.
- Example of using max:
  ```haskell
  ghci> max 4 5  
  5  
  ghci> (max 4) 5  
  5  
  ```
- Putting a space between two things is simply function application.
- The space is sort of like an operator and it has the highest precedence. 
- Let's examine the type of max. It's max :: (Ord a) => a -> a -> a. That can also be written as max :: (Ord a) => a -> (a -> a). That could be read as: max takes an a and returns (that's the ->) a function that takes an a and returns an a.
- Simply speaking, if we call a function with too few parameters, we get back a partially applied function, meaning a function that takes as many parameters as we left out.
- Take a look at this offensively simple function:
  ```haskell
  multThree :: (Num a) => a -> a -> a -> a  
  multThree x y z = x * y * z 
  ```
- What really happens when we do multThree 3 5 9 or ((multThree 3) 5) 9? First, 3 is applied to multThree, because they're separated by a space. That creates a function that takes one parameter and returns a function. So then 5 is applied to that, which creates a function that will take a parameter and multiply it by 15. 9 is applied to that function and the result is 135 or something.
- The thing before the -> is the parameter that a function takes and the thing after it is what it returns.
- Example:
  ```haskell
  ghci> let multTwoWithNine = multThree 9  
  ghci> multTwoWithNine 2 3  
  54  
  ghci> let multWithEighteen = multTwoWithNine 2  
  ghci> multWithEighteen 10  
  180
  ```
- By calling functions with too few parameters, so to speak, we're creating new functions on the fly.
- What if we wanted to create a function that takes a number and compares it to 100? We could do something like this:
  ```haskell
  compareWithHundred :: (Num a, Ord a) => a -> Ordering  
  compareWithHundred x = compare 100 x  
  ```
  ```haskell
  compareWithHundred :: (Num a, Ord a) => a -> Ordering  
  compareWithHundred = compare 100
  ```
- Infix functions can also be partially applied by using sections. To section an infix function, simply surround it with parentheses and only supply a parameter on one side.
  ```haskell
  divideByTen :: (Floating a) => a -> a  
  divideByTen = (/10) 
  ```
- Calling, say, divideByTen 200 is equivalent to doing 200 / 10, as is doing (/10) 200.
- Example:
  ```haskell
  isUpperAlphanum :: Char -> Bool  
  isUpperAlphanum = (`elem` ['A'..'Z']) 
  ```
- Remeber that multThree is a function that takes three argument. What happens if we just provide it with only 2 arguments?
  ```haskell
  ghci> multThree 3 4  
  <interactive>:1:0:  
      No instance for (Show (t -> t))  
        arising from a use of `print' at <interactive>:1:0-12  
      Possible fix: add an instance declaration for (Show (t -> t))  
      In the expression: print it  
      In a 'do' expression: print it
  ```
- GHCI don't know how to print the partially applied function.

### Some higher-orderism is in order
- Functions can take functions as parameters and also return functions.
  ```haskell
  applyTwice :: (a -> a) -> a -> a  
  applyTwice f x = f (f x) 
  ```
- First of all, notice the type declaration. Before, we didn't need parentheses because -> is naturally right-associative. However, here, they're mandatory.
- They indicate that the first parameter is a function that takes something and returns that same thing. The second parameter is something of that type also and the return value is also of the same type.
- The first parameter is a function (of type a -> a) and the second is that same a. The function can also be Int -> Int or String -> String or whatever. But then, the second parameter to also has to be of that type.
- The body of the function is pretty simple. We just use the parameter f as a function, applying x to it by separating them with a space and then applying the result to f again. Anyway, playing around with the function:
  ```haskell
  ghci> applyTwice (+3) 10  
  16  
  ghci> applyTwice (++ " HAHA") "HEY"  
  "HEY HAHA HAHA"  
  ghci> applyTwice ("HAHA " ++) "HEY"  
  "HAHA HAHA HEY"  
  ghci> applyTwice (multThree 2 2) 9  
  144  
  ghci> applyTwice (3:) [1]  
  [3,3,1]  
  ```
- Example of zipWith':
  ```haskell
  zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
  zipWith' _ [] _ = []  
  zipWith' _ _ [] = []  
  zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys  
  ```
- The first parameter is a function that takes two things and produces a third thing. 
- The second and third parameter are lists. The result is also a list. The first has to be a list of a's, because the joining function takes a's as its first argument. The second has to be a list of b's, because the second parameter of the joining function is of type b. The result is a list of c's.
- What zipWith could do:
  ```haskell
  ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]  
  [6,8,7,9]  
  ghci> zipWith' max [6,3,2,1] [7,3,1,5]  
  [7,3,2,5]  
  ghci> zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]  
  ["foo fighters","bar hoppers","baz aldrin"]  
  ghci> zipWith' (*) (replicate 5 2) [1..]  
  [2,4,6,8,10]  
  ghci> zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]  
  [[3,4,6],[9,20,30],[10,12,12]]  
  ```
- We'll implement another function that's already in the standard library, called flip. Flip simply takes a function and returns a function that is like our original function, only the first two arguments are flipped. We can implement it like so:
  ```haskell
  flip' :: (a -> b -> c) -> (b -> a -> c)  
  flip' f = g  
      where g x y = f y x 
  ```
- Reading the type declaration, we say that it takes a function that takes an a and a b and returns a function that takes a b and an a. But because functions are curried by default, the second pair of parentheses is really unnecessary, because -> is right associative by default. (a -> b -> c) -> (b -> a -> c) is the same as (a -> b -> c) -> (b -> (a -> c)),
- Another way to define flip:
  ```haskell
  flip' :: (a -> b -> c) -> b -> a -> c  
  flip' f y x = f x y
  ```
- Usage's example:
  ```haskell
  ghci> flip' zip [1,2,3,4,5] "hello"  
  [('h',1),('e',2),('l',3),('l',4),('o',5)]  
  ghci> zipWith (flip' div) [2,2..] [10,8,6,4,2]  
  [5,4,3,2,1]  
  ```

### Maps and filters
- map takes a function and a list and applies that function to every element in the list, producing a new list.
  ```haskell
  map :: (a -> b) -> [a] -> [b]  
  map _ [] = []  
  map f (x:xs) = f x : map f xs  
  ```
- However, using map is much more readable for cases where you only apply some function to the elements of a list, especially once you're dealing with maps of maps and then the whole thing with a lot of brackets can get a bit messy.
- filter is a function that takes a predicate (a predicate is a function that tells whether something is true or not.
  ```haskell
  filter :: (a -> Bool) -> [a] -> [a]  
  filter _ [] = []  
  filter p (x:xs)   
      | p x       = x : filter p xs  
      | otherwise = filter p xs  
  ```
  ```haskell
  ghci> filter (>3) [1,5,3,2,1,6,4,3,2,1]  
  [5,6,4]  
  ghci> filter (==3) [1,2,3,4,5]  
  [3]  
  ghci> filter even [1..10]  
  [2,4,6,8,10]  
  ghci> let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]  
  [[1,2,3],[3,4,5],[2,2]]  
  ghci> filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"  
  "uagameasadifeent"  
  ghci> filter (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"  
  "GAYBALLS"  
  ```
- quicksort using filter:
  ```haskell
  quicksort :: (Ord a) => [a] -> [a]    
  quicksort [] = []    
  quicksort (x:xs) =     
      let smallerSorted = quicksort (filter (<=x) xs)  
          biggerSorted = quicksort (filter (>x) xs)   
      in  smallerSorted ++ [x] ++ biggerSorted  
  ```
- Thanks to Haskell's laziness, even if you map something over a list several times and filter it several times, it will only pass over the list once.
- Let's find the largest number under 100,000 that's divisible by 3829. To do that, we'll just filter a set of possibilities in which we know the solution lies.
  ```haskell
  largestDivisible :: (Integral a) => a  
  largestDivisible = head (filter p [100000,99999..])  
      where p x = x `mod` 3829 == 0  
  ```
- Example:
  ```haskell
  ghci> sum (takeWhile (<10000) (filter odd (map (^2) [1..])))  
  166650
  ghci> sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)])  
  166650 
  ```
- Haskell's property of laziness is what makes this possible. We can map over and filter an infinite list, because it won't actually map and filter it right away, it'll delay those actions.
- Only when we force Haskell to show us the sum does the sum function say to the takeWhile that it needs those numbers.
- takeWhile forces the filtering and mapping to occur, but only until a number greater than or equal to 10,000 is encountered.
- Collatz conjecture chain:
  ```haskell
  chain :: (Integral a) => a -> [a]  
  chain 1 = [1]  
  chain n  
      | even n =  n:chain (n `div` 2)  
      | odd n  =  n:chain (n*3 + 1)  
  ```
- Partially applied functions that returns a list of functions:
  ```haskell
  ghci> let listOfFuns = map (*) [0..]  
  ghci> (listOfFuns !! 4) 5  
  20  
  ```

### Lambdas
- Lambdas are basically anonymous functions that are used because we need some functions only once
-  Normally, we make a lambda with the sole purpose of passing it to a higher-order function. To make a lambda, we write a \ (because it kind of looks like the greek letter lambda if you squint hard enough) and then we write the parameters, separated by spaces.
- After that comes a -> and then the function body. We usually surround them by parentheses, because otherwise they extend all the way to the right.
- Example:
  ```haskell
  numLongChains :: Int  
  numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))  
  ```
- Lambdas are expressions, that's why we can just pass them like that. The expression (\xs -> length xs > 15) returns a function that tells us whether the length of the list passed to it is greater than 15.
- For instance, the expressions map (+3) [1,6,3,2] and map (\x -> x + 3) [1,6,3,2] are equivalent since both (+3) and (\x -> x + 3) are functions that take a number and add 3 to it.
- Example:
  ```haskell
  ghci> zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]  
  [153.0,61.5,31.0,15.75,6.6]  
  ```
- And like normal functions, you can pattern match in lambdas. The only difference is that you can't define several patterns for one parameter, like making a [] and a (x:xs) pattern for the same parameter and then having values fall through. If a pattern matching fails in a lambda, a runtime error occurs, so be careful when pattern matching in lambdas!
- These two are equivalent:
  ```haskell
  addThree :: (Num a) => a -> a -> a -> a  
  addThree x y z = x + y + z 
  ```
  ```haskell
  addThree :: (Num a) => a -> a -> a -> a  
  addThree = \x -> \y -> \z -> x + y + z  
  ```
- `flip` function using lambdas:
  ```haskell
  flip' :: (a -> b -> c) -> b -> a -> c  
  flip' f = \x y -> f y x  
  ```

### Only folds and horses
- Back when we were dealing with recursion, we noticed a theme throughout many of the recursive functions that operated on lists.
- Usually, we'd have an edge case for the empty list. We'd introduce the x:xs pattern and then we'd do some action that involves a single element and the rest of the list.
- It turns out this is a very common pattern, so a couple of very useful functions were introduced to encapsulate it. These functions are called `folds`.
- A fold takes a binary function, a starting value (I like to call it the accumulator) and a list to fold up. 
- The binary function itself takes two parameters. The binary function is called with the accumulator and the first (or last) element and produces a new accumulator.
- Then, the binary function is called again with the new accumulator and the now new first (or last) element, and so on. Once we've walked over the whole list, only the accumulator remains, which is what we've reduced the list to.
- First let's take a look at the foldl function, also called the left fold. It folds the list up from the left side. The binary function is applied between the starting value and the head of the list. That produces a new accumulator value and the binary function is called with that value and the next element, etc.
  ```haskell
  sum' :: (Num a) => [a] -> a  
  sum' xs = foldl (\acc x -> acc + x) 0 xs  
  sum' :: (Num a) => [a] -> a  
  sum' = foldl (+) 0  
  ```
- Generally, if you have a function like foo a = bar b a, you can rewrite it as foo = bar b, because of currying.
- Elem with foldl:
  ```haskell
  elem' :: (Eq a) => a -> [a] -> Bool  
  elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys  
  ```
- The right fold, foldr works in a similar way to the left fold, only the accumulator eats up the values from the right. Also, the left fold's binary function has the accumulator as the first parameter and the current value as the second one (so \acc x -> ...), the right fold's binary function has the current value as the first parameter and the accumulator as the second one (so \x acc -> ...). It kind of makes sense that the right fold has the accumulator on the right, because it folds from the right side.
- `map` function using right fold:
  ```haskell
  map' :: (a -> b) -> [a] -> [b]  
  map' f xs = foldr (\x acc -> f x : acc) [] xs  
  ```
- Of course, we could have implemented this function with a left fold too. It would be map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs, but the thing is that the ++ function is much more expensive than :, so we usually use right folds when we're building up new lists from a list.
- One big difference is that right folds work on infinite lists, whereas left ones don't! To put it plainly, if you take an infinite list at some point and you fold it up from the right, you'll eventually reach the beginning of the list. However, if you take an infinite list at a point and you try to fold it up from the left, you'll never reach an end!
- Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold. That's why folds are, along with maps and filters, one of the most useful types of functions in functional programming.
- Standard library functions defined using folds:
  ```haskell
  maximum' :: (Ord a) => [a] -> a  
  maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
    
  reverse' :: [a] -> [a]  
  reverse' = foldl (\acc x -> x : acc) []  
    
  product' :: (Num a) => [a] -> a  
  product' = foldr1 (*)  
    
  filter' :: (a -> Bool) -> [a] -> [a]  
  filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
    
  head' :: [a] -> a  
  head' = foldr1 (\x _ -> x)  
    
  last' :: [a] -> a  
  last' = foldl1 (\_ x -> x)  
  ```
- That's why we could have also written our reverse as `foldl (flip (:)) []`.
- Another way to picture right and left folds is like this: say we have a right fold and the binary function is f and the starting value is z. If we're right folding over the list [3,4,5,6], we're essentially doing this: f 3 (f 4 (f 5 (f 6 z))). f is called with the last element in the list and the accumulator, that value is given as the accumulator to the next to last value and so on. If we take f to be + and the starting accumulator value to be 0, that's 3 + (4 + (5 + (6 + 0))). Or if we write + as a prefix function, that's (+) 3 ((+) 4 ((+) 5 ((+) 6 0))). 
- Similarly, doing a left fold over that list with g as the binary function and z as the accumulator is the equivalent of g (g (g (g z 3) 4) 5) 6. If we use flip (:) as the binary function and [] as the accumulator (so we're reversing the list), then that's the equivalent of flip (:) (flip (:) (flip (:) (flip (:) [] 3) 4) 5) 6. And sure enough, if you evaluate that expression, you get [6,5,4,3]
- scanl and scanr are like foldl and foldr, only they report all the intermediate accumulator states in the form of a list. There are also scanl1 and scanr1, which are analogous to foldl1 and foldr1.
- When using a scanl, the final result will be in the last element of the resulting list while a scanr will place the result in the head.
- Let's answer us this question: How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
- To get the squares of all natural numbers, we just do map sqrt [1..]. Now, to get the sum, we could do a fold, but because we're interested in how the sum progresses, we're going to do a scan. Once we've done the scan, we just see how many sums are under 1000. The first sum in the scanlist will be 1, normally. The second will be 1 plus the square root of 2. The third will be that plus the square root of 3. If there are X sums under 1000, then it takes X+1 elements for the sum to exceed 1000.
  ```haskell
  sqrtSums :: Int  
  sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1
  ```

### Function application with $
- Alright, next up, we'll take a look at the $ function, also called function application. First of all, let's check out how it's defined:
  ```haskell
  ($) :: (a -> b) -> a -> b  
  f $ x = f x 
  ```
- Whereas normal function application (putting a space between two things) has a really high precedence, the $ function has the lowest precedence.
- Function application with a space is left-associative (so f a b c is the same as ((f a) b) c)), function application with $ is right-associative.
- That's all very well, but how does this help us? Most of the time, it's a convenience function so that we don't have to write so many parentheses. Consider the expression sum (map sqrt [1..130]). Because $ has such a low precedence, we can rewrite that expression as sum $ map sqrt [1..130], saving ourselves precious keystrokes!
- When a $ is encountered, the expression on its right is applied as the parameter to the function on its left. 
- How about sqrt 3 + 4 + 9? This adds together 9, 4 and the square root of 3.
- If we want get the square root of 3 + 4 + 9, we'd have to write sqrt (3 + 4 + 9) or if we use $ we can write it as sqrt $ 3 + 4 + 9 because $ has the lowest precedence of any operator. That's why you can imagine a $ being sort of the equivalent of writing an opening parentheses and then writing a closing one on the far right side of the expression.
- How about `sum (filter (> 10) (map (*2) [2..10]))`? Well, because `$` is right-associative, `f (g (z x))` is equal to `f $ g $ z x`. And so, we can rewrite `sum (filter (> 10) (map (*2) [2..10]))` as` sum $ filter (> 10) $ map (*2) [2..10]`.

### Function composition
- In mathematics, function composition is defined like this:  (f . g)(x) = f(g(x)), meaning that composing two functions produces a new function that, when called with a parameter, say, x is the equivalent of calling g with the parameter x and then calling the f with that result.
- In Haskell, function composition is pretty much the same thing. We do function composition with the . function, which is defined like so:
  ```haskell
  (.) :: (b -> c) -> (a -> b) -> a -> c  
  f . g = \x -> f (g x)  
  ```
- Mind the type declaration. f must take as its parameter a value that has the same type as g's return value. So the resulting function takes a parameter of the same type that g takes and returns a value of the same type that f returns. The expression negate . (* 3) returns a function that takes a number, multiplies it by 3 and then negates it.
- Example:
  ```haskell
  ghci> map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]  
  [-5,-3,-6,-7,-3,-2,-19,-24]

  ghci> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]  
  [-5,-3,-6,-7,-3,-2,-19,-24]  

  ghci> map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]  
  [-14,-15,-27]  

  ghci> map (negate . sum . tail) [[1..5],[3..6],[1..7]]  
  [-14,-15,-27]  

  sum' :: (Num a) => [a] -> a     
  sum' xs = foldl (+) 0 xs 

  fn x = ceiling (negate (tan (cos (max 50 x)))) 

  fn = ceiling . negate . tan . cos . max 50  

  oddSquareSum :: Integer  
  oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))   

  oddSquareSum :: Integer  
  oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..] 

  oddSquareSum :: Integer  
  oddSquareSum =   
      let oddSquares = filter odd $ map (^2) [1..]  
          belowLimit = takeWhile (<10000) oddSquares  
      in  sum belowLimit 
  ```


**[⬆ back to top](#list-of-contents)**

</br>

---

## [Modules](http://learnyouahaskell.com/modules) <span id="content-7"><span>

### Loading modules
- A Haskell module is a collection of related functions, types and typeclasses.
- A Haskell program is a collection of modules where the main module loads up the other modules and then uses the functions defined in them to do something.
- The Haskell standard library is split into modules, each of them contains functions and types that are somehow related and serve some common purpose.
- All the functions, types and typeclasses that we've dealt with so far were part of the Prelude module, which is imported by default.
- The syntax for importing modules in a Haskell script is `import <module name>`.
- Example:
  ```haskell
  import Data.List  
  
  numUniques :: (Eq a) => [a] -> Int  
  numUniques = length . nub  
  ```
- When you do `import Data.List`, all the functions that `Data.List` exports become available in the global namespace, meaning that you can call them from wherever in the script.
- `nub` is a function defined in `Data.List` that takes a list and weeds out duplicate elements.
- Composing length and `nub` by doing `length` . `nub` produces a function that's the equivalent of `\xs -> length (nub xs)`.
- Import the modules to global namespeces in ghci:
  ```haskell
  ghci> :m + Data.List 

  ghci> :m + Data.List Data.Map Data.Set  
  ```
- If you just need a couple of functions from a module, you can selectively import just those functions. If we wanted to import only the nub and sort functions from Data.List, we'd do this:
  ```haskell
  import Data.List (nub, sort)  
  ```
- Import all except nub functions:
  ```haskell
  import Data.List hiding (nub) 
  ```
- Qualified import for avoid namespace clashes:
  ```haskell
  import qualified Data.Map  
  ```
- This makes it so that if we want to reference Data.Map's filter function, we have to do Data.Map.filter, whereas just filter still refers to the normal filter we all know and love.
- Rename import reference:
  ```haskell
  import qualified Data.Map as M 
  ```
- Use [his handy reference](http://www.haskell.org/ghc/docs/latest/html/libraries/) to see which modules are in the standard library.
- To search for functions or to find out where they're located, use [Hoogle](https://hoogle.haskell.org/). It's a really awesome Haskell search engine, you can search by name, module name or even type signature.


### Making our own modules
- Let's see how we can make our own modules by making a little module that provides some functions for calculating the volume and area of a few geometrical objects.
- We'll start by creating a file called Geometry.hs.
- We say that a module exports functions. What that means is that when I import a module, I can use the functions that it exports.
- It can define functions that its functions call internally, but we can only see and use the ones that it exports.
- At the beginning of a module, we specify the module name. If we have a file called Geometry.hs, then we should name our module Geometry.
- Then, we specify the functions that it exports and after that, we can start writing the functions. So we'll start with this.
- Example:
  ```haskell
  module Geometry  
  ( sphereVolume  
  , sphereArea  
  , cubeVolume  
  , cubeArea  
  , cuboidArea  
  , cuboidVolume  
  ) where 
  ```
  ```haskell
  module Geometry  
  ( sphereVolume  
  , sphereArea  
  , cubeVolume  
  , cubeArea  
  , cuboidArea  
  , cuboidVolume  
  ) where  
    
  sphereVolume :: Float -> Float  
  sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)  
    
  sphereArea :: Float -> Float  
  sphereArea radius = 4 * pi * (radius ^ 2)  
    
  cubeVolume :: Float -> Float  
  cubeVolume side = cuboidVolume side side side  
    
  cubeArea :: Float -> Float  
  cubeArea side = cuboidArea side side side  
    
  cuboidVolume :: Float -> Float -> Float -> Float  
  cuboidVolume a b c = rectangleArea a b * c  
    
  cuboidArea :: Float -> Float -> Float -> Float  
  cuboidArea a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2  
    
  rectangleArea :: Float -> Float -> Float  
  rectangleArea a b = a * b  
  ```
- When making a module, we usually export only those functions that act as a sort of interface to our module so that the implementation is hidden.
- If someone is using our Geometry module, they don't have to concern themselves with functions that we don't export.
- If someone is using our Geometry module, they don't have to concern themselves with functions that we don't export.
- To use our module, we just do:
  ```haskell
  import Geometry  
  ```
- Let's section these functions off so that Geometry is a module that has three sub-modules, one for each type of object.
- First, we'll make a folder called Geometry. Mind the capital G. In it, we'll place three files: Sphere.hs, Cuboid.hs, and Cube.hs. Here's what the files will contain:
- `Sphere.hs`:
  ```haskell
  module Geometry.Sphere  
  ( volume  
  , area  
  ) where  
    
  volume :: Float -> Float  
  volume radius = (4.0 / 3.0) * pi * (radius ^ 3)  
    
  area :: Float -> Float  
  area radius = 4 * pi * (radius ^ 2) 
  ```
- `Cuboid.hs`:
  ```haskell
  module Geometry.Cuboid  
  ( volume  
  , area  
  ) where  
    
  volume :: Float -> Float -> Float -> Float  
  volume a b c = rectangleArea a b * c  
    
  area :: Float -> Float -> Float -> Float  
  area a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2  
    
  rectangleArea :: Float -> Float -> Float  
  rectangleArea a b = a * b  
  ```
- `Cube.hs`:
  ```haskell
  module Geometry.Cube  
  ( volume  
  , area  
  ) where  
    
  import qualified Geometry.Cuboid as Cuboid  
    
  volume :: Float -> Float  
  volume side = Cuboid.volume side side side  
    
  area :: Float -> Float  
  area side = Cuboid.area side side side 
  ```
- So first is Geometry.Sphere. Notice how we placed it in a folder called Geometry and then defined the module name as Geometry.Sphere.
- So now if we're in a file that's on the same level as the Geometry folder, we can do, say:
  ```haskell
  import Geometry.Sphere  
  ```
- And if we want to juggle two or more of these modules, we have to do qualified imports because they export functions with the same names. So we just do something like:
  ```haskell
  import qualified Geometry.Sphere as Sphere  
  import qualified Geometry.Cuboid as Cuboid  
  import qualified Geometry.Cube as Cube 
  ```
- And then we can call Sphere.area, Sphere.volume, Cuboid.area, etc. and each will calculate the area or volume for their corresponding object.

  
**[⬆ back to top](#list-of-contents)**

</br>

---

## [Making Our Own Types and Typeclasses](http://learnyouahaskell.com/making-our-own-types-and-typeclasses) <span id="content-8"><span>

### Algebraic data types intro
- So far, we've run into a lot of data types. Bool, Int, Char, Maybe, etc. But how do we make our own? Well, one way is to use the data keyword to define a type.
- Let's see how the Bool type is defined in the standard library.
  ```haskell
  data Bool = False | True  
  ```
- data means that we're defining a new data type. The part before the = denotes the type, which is Bool. The parts after the = are value constructors.
- They specify the different values that this type can have. The | is read as or. So we can read this as: the Bool type can have a value of True or False. Both the type name and the value constructors have to be capital cased.
- In a similar fashion, we can think of the Int type as being defined like this:
  ```haskell
  data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647 
  ```
- Now, let's think about how we would represent a shape in Haskell. One way would be to use tuples. A circle could be denoted as (43.1, 55.0, 10.4) where the first and second fields are the coordinates of the circle's center and the third field is the radius.
- Sounds OK, but those could also represent a 3D vector or anything else. A better solution would be to make our own type to represent a shape. Let's say that a shape can be a circle or a rectangle.
- Now what's this? Think of it like this. The Circle value constructor has three fields, which take floats. So when we write a value constructor, we can optionally add some types after it and those types define the values it will contain. Here, the first two fields are the coordinates of its center, the third one its radius.
- The Rectangle value constructor has four fields which accept floats. The first two are the coordinates to its upper left corner and the second two are coordinates to its lower right one.
- Now when I say fields, I actually mean parameters. Value constructors are actually functions that ultimately return a value of a data type.
- Let's take a look at the type signatures for these two value constructors.
  ```haskell
  ghci> :t Circle  
  Circle :: Float -> Float -> Float -> Shape  
  ghci> :t Rectangle  
  Rectangle :: Float -> Float -> Float -> Float -> Shape  
  ```
- Make a function that takes shape and return its surface:
  ```haskell
  surface :: Shape -> Float  
  surface (Circle _ _ r) = pi * r ^ 2  
  surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)  
  ```
- The first notable thing here is the type declaration. It says that the function takes a shape and returns a float.
- We couldn't write a type declaration of Circle -> Float because Circle is not a type, Shape is. Just like we can't write a function with a type declaration of True -> Int.
- The next thing we notice here is that we can pattern match against constructors. We pattern matched against constructors before (all the time actually) when we pattern matched against values like [] or False or 5,
- We just write a constructor and then bind its fields to names.
  ```haskell
  ghci> surface $ Circle 10 20 10  
  314.15927  
  ghci> surface $ Rectangle 0 0 100 100  
  10000.0 
  ```
- Yay, it works! But if we try to just print out Circle 10 20 5 in the prompt, we'll get an error. That's because Haskell doesn't know how to display our data type as a string (yet). Remember, when we try to print a value out in the prompt, Haskell first runs the show function to get the string representation of our value and then it prints that out to the terminal.
- To make our Shape type part of the Show typeclass, we modify it like this:
  ```haskell
  data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show) 
  ```
- We won't concern ourselves with deriving too much for now. Let's just say that if we add deriving (Show) at the end of a data declaration, Haskell automagically makes that type part of the Show typeclass.
  ```haskell
  ghci> Circle 10 20 5  
  Circle 10.0 20.0 5.0  
  ghci> Rectangle 50 230 60 90  
  Rectangle 50.0 230.0 60.0 90.0 
  ```
- Value constructors are functions, so we can map them and partially apply them and everything. If we want a list of concentric circles with different radii, we can do this.
  ```haskell
  ghci> map (Circle 10 20) [4,5,6,6]  
  [Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]  
  ```
- Our data type is good, although it could be better. Let's make an intermediate data type that defines a point in two-dimensional space. Then we can use that to make our shapes more understandable.
  ```haskell
  data Point = Point Float Float deriving (Show)  
  data Shape = Circle Point Float | Rectangle Point Point deriving (Show) 
  ```
- Notice that when defining a point, we used the same name for the data type and the value constructor. This has no special meaning, although it's common to use the same name as the type if there's only one value constructor.
- So now the Circle has two fields, one is of type Point and the other of type Float. This makes it easier to understand what's what. Same goes for the rectangle. We have to adjust our surface function to reflect these changes.
  ```haskell
  surface :: Shape -> Float  
  surface (Circle _ r) = pi * r ^ 2  
  surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)  
  ```
  ```haskell
  ghci> surface (Rectangle (Point 0 0) (Point 100 100))  
  10000.0  
  ghci> surface (Circle (Point 0 0) 24)  
  1809.5574 
  ```
- How about a function that nudges a shape? It takes a shape, the amount to move it on the x axis and the amount to move it on the y axis and then returns a new shape that has the same dimensions, only it's located somewhere else.
  ```haskell
  nudge :: Shape -> Float -> Float -> Shape  
  nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
  nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))
  ```
- If we don't want to deal directly with points, we can make some auxilliary functions that create shapes of some size at the zero coordinates and then nudge those.
  ```haskell
  baseCircle :: Float -> Shape  
  baseCircle r = Circle (Point 0 0) r  
    
  baseRect :: Float -> Float -> Shape  
  baseRect width height = Rectangle (Point 0 0) (Point width height)  
  ```
- You can, of course, export your data types in your modules. To do that, just write your type along with the functions you are exporting and then add some parentheses and in them specify the value constructors that you want to export for it, separated by commas. If you want to export all the value constructors for a given type, just write ...
- If we wanted to export the functions and types that we defined here in a module, we could start it off like this:
  ```haskell
  module Shapes   
  ( Point(..)  
  , Shape(..)  
  , surface  
  , nudge  
  , baseCircle  
  , baseRect  
  ) where  
  ```
- By doing Shape(..), we exported all the value constructors for Shape, so that means that whoever imports our module can make shapes by using the Rectangle and Circle value constructors. It's the same as writing Shape (Rectangle, Circle).
- We could also opt not to export any value constructors for Shape by just writing Shape in the export statement. That way, someone importing our module could only make shapes by using the auxilliary functions baseCircle and baseRect.
- Remember, value constructors are just functions that take the fields as parameters and return a value of some type (like Shape) as a result.
- So when we choose not to export them, we just prevent the person importing our module from using those functions, but if some other functions that are exported return a type, we can use them to make values of our custom data types.
- Not exporting the value constructors of a data types makes them more abstract in such a way that we hide their implementation. Also, whoever uses our module can't pattern match against the value constructors.

### Record syntax
- The info that we want to store about that person is: first name, last name, age, height, phone number, and favorite ice-cream flavor.
  ```haskell
  data Person = Person String String Int Float String String deriving (Show)
  ```
  ```haskell
  ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
  ghci> guy  
  Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
  ```
- That's kind of cool, although slightly unreadable. What if we want to create a function to get seperate info from a person? A function that gets some person's first name, a function that gets some person's last name, etc. Well, we'd have to define them kind of like this.
  ```haskell
  firstName :: Person -> String  
  firstName (Person firstname _ _ _ _ _) = firstname  
    
  lastName :: Person -> String  
  lastName (Person _ lastname _ _ _ _) = lastname  
    
  age :: Person -> Int  
  age (Person _ _ age _ _ _) = age  
    
  height :: Person -> Float  
  height (Person _ _ _ height _ _) = height  
    
  phoneNumber :: Person -> String  
  phoneNumber (Person _ _ _ _ number _) = number  
    
  flavor :: Person -> String  
  flavor (Person _ _ _ _ _ flavor) = flavor 
  ```
- Extremely unpleasent to write, but it works:
  ```haskell
  ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
  ghci> firstName guy  
  "Buddy"  
  ghci> height guy  
  184.2  
  ghci> flavor guy  
  "Chocolate"  
  ```
- They included an alternative way to write data types. Here's how we could achieve the above functionality with record syntax.
  ```haskell
  data Person = Person { firstName :: String  
                      , lastName :: String  
                      , age :: Int  
                      , height :: Float  
                      , phoneNumber :: String  
                      , flavor :: String  
                      } deriving (Show)   
  ```
- So instead of just naming the field types one after another and separating them with spaces, we use curly brackets. First we write the name of the field, for instance, firstName and then we write a double colon :: (also called Paamayim Nekudotayim, haha) and then we specify the type. The resulting data type is exactly the same.
- The main benefit of this is that it creates functions that lookup fields in the data type. By using record syntax to create this data type, Haskell automatically made these functions: firstName, lastName, age, height, phoneNumber and flavor.
  ```haskell
  ghci> :t flavor  
  flavor :: Person -> String  
  ghci> :t firstName  
  firstName :: Person -> String  
  ```
- There's another benefit to using record syntax. When we derive Show for the type, it displays it differently if we use record syntax to define and instantiate the type. Say we have a type that represents a car. We want to keep track of the company that made it, the model name and its year of production. Watch.
  ```haskell
  data Car = Car String String Int deriving (Show)  
  ```
  ```haskell
  ghci> Car "Ford" "Mustang" 1967  
  Car "Ford" "Mustang" 1967 
  ```
- Now, define with record syntax:
  ```haskell
  data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)  
  ```
  ```haskell
  ghci> Car {company="Ford", model="Mustang", year=1967}  
  Car {company = "Ford", model = "Mustang", year = 1967} 
  ```
- When making a new car, we don't have to necessarily put the fields in the proper order, as long as we list all of them. But if we don't use record syntax, we have to specify them in order.
- Use record syntax when a constructor has several fields and it's not obvious which field is which. If we make a 3D vector data type by doing data Vector = Vector Int Int Int, it's pretty obvious that the fields are the components of a vector. However, in our Person and Car types, it wasn't so obvious and we greatly benefited from using record syntax.

### Type parameters
- A value constructor can take some values parameters and then produce a new value. For instance, the Car constructor takes three values and produces a car value.
- In a similar manner, type constructors can take types as parameters to produce new types.
- To get a clear picture of what type parameters work like in action, let's take a look at how a type we've already met is implemented.
  ```haskell
  data Maybe a = Nothing | Just a  
  ```
- The a here is the type parameter. And because there's a type parameter involved, we call Maybe a type constructor.
- Depending on what we want this data type to hold when it's not Nothing, this type constructor can end up producing a type of Maybe Int, Maybe Car, Maybe String, etc.
- No value can have a type of just Maybe, because that's not a type per se, it's a type constructor. In order for this to be a real type that a value can be part of, it has to have all its type parameters filled up.
- So if we pass Char as the type parameter to Maybe, we get a type of Maybe Char. The value Just 'a' has a type of Maybe Char, for example.
- You might not know it, but we used a type that has a type parameter before we used Maybe. That type is the list type.
- Although there's some syntactic sugar in play, the list type takes a parameter to produce a concrete type. Values can have an [Int] type, a [Char] type, a [[String]] type, but you can't have a value that just has a type of [].
- Let's play around with the Maybe type.
  ```haskell
  ghci> Just "Haha"  
  Just "Haha"  
  ghci> Just 84  
  Just 84  
  ghci> :t Just "Haha"  
  Just "Haha" :: Maybe [Char]  
  ghci> :t Just 84  
  Just 84 :: (Num t) => Maybe t  
  ghci> :t Nothing  
  Nothing :: Maybe a  
  ghci> Just 10 :: Maybe Double  
  Just 10.0  
  ```
- Type parameters are useful because we can make different types with them depending on what kind of types we want contained in our data type. When we do :t Just "Haha", the type inference engine figures it out to be of the type Maybe [Char], because if the a in the Just a is a string, then the a in Maybe a must also be a string.
- Notice that the type of Nothing is Maybe a. Its type is polymorphic. If some function requires a Maybe Int as a parameter, we can give it a Nothing, because a Nothing doesn't contain a value anyway and so it doesn't matter.
- The Maybe a type can act like a Maybe Int if it has to, just like 5 can act like an Int or a Double.
- Similarly, the type of the empty list is [a]. An empty list can act like a list of anything. That's why we can do [1,2,3] ++ [] and ["ha","ha","ha"] ++ [].
- Usually we use them when our data type would work regardless of the type of the value it then holds inside it, like with our Maybe a type.
- If our type acts as some kind of box, it's good to use them. We could change our Car data type from this:
  ```haskell
  data Car = Car { company :: String  
                , model :: String  
                , year :: Int  
                } deriving (Show)

  data Car a b c = Car { company :: a  
                     , model :: b  
                     , year :: c   
                     } deriving (Show)  
  ```
- For instance, given our first definition of Car, we could make a function that displays the car's properties in a nice little text.
  ```haskell
  tellCar :: Car -> String  
  tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  
  ```
  ```haskell
  ghci> let stang = Car {company="Ford", model="Mustang", year=1967}  
  ghci> tellCar stang  
  "This Ford Mustang was made in 1967"
  ```
  ```haskell
  tellCar :: (Show a) => Car String String a -> String  
  tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  
  ```
- We'd have to force this function to take a Car type of (Show a) => Car String String a. You can see that the type signature is more complicated and the only benefit we'd actually get would be that we can use any type that's an instance of the Show typeclass as the type for c.
  ```haskell
  ghci> tellCar (Car "Ford" "Mustang" 1967)  
  "This Ford Mustang was made in 1967"  
  ghci> tellCar (Car "Ford" "Mustang" "nineteen sixty seven")  
  "This Ford Mustang was made in \"nineteen sixty seven\""  
  ghci> :t Car "Ford" "Mustang" 1967  
  Car "Ford" "Mustang" 1967 :: (Num t) => Car [Char] [Char] t  
  ghci> :t Car "Ford" "Mustang" "nineteen sixty seven"  
  Car "Ford" "Mustang" "nineteen sixty seven" :: Car [Char] [Char] [Char] 
  ```
- We usually use type parameters when the type that's contained inside the data type's various value constructors isn't really that important for the type to work.
- If we want to sum a list of numbers, we can specify later in the summing function that we specifically want a list of numbers.
- Same goes for Maybe. Maybe represents an option of either having nothing or having one of something. It doesn't matter what the type of that something is.
- Another example of a parameterized type that we've already met is Map k v from Data.Map. The k is the type of the keys in a map and the v is the type of the values.
- This is a good example of where type parameters are very useful. Having maps parameterized enables us to have mappings from any type to any other type, as long as the type of the key is part of the Ord typeclass.
- If we were defining a mapping type, we could add a typeclass constraint in the data declaration:
  ```haskell
  data (Ord k) => Map k v = ...  
  ```
- However, it's a very strong convention in Haskell to never add typeclass constraints in data declarations. Why? Well, because we don't benefit a lot, but we end up writing more class constraints, even when we don't need them.
- If we put or don't put the Ord k constraint in the data declaration for Map k v, we're going to have to put the constraint into functions that assume the keys in a map can be ordered.
- But if we don't put the constraint in the data declaration, we don't have to put (Ord k) => in the type declarations of functions that don't care whether the keys can be ordered or not.
- An example of such a function is `toList`, that just takes a mapping and converts it to an associative list. Its type signature is `toList :: Map k a -> [(k, a)]`. 
- If Map k v had a type constraint in its data declaration, the type for toList would have to be `toList :: (Ord k) => Map k a -> [(k, a)]`, even though the function doesn't do any comparing of keys by order.
- So don't put type constraints into data declarations even if it seems to make sense, because you'll have to put them into the function type declarations either way.
- Let's implement a 3D vector type and add some operations for it. We'll be using a parameterized type because even though it will usually contain numeric types, it will still support several of them.
  ```haskell
  data Vector a = Vector a a a deriving (Show)  
    
  vplus :: (Num t) => Vector t -> Vector t -> Vector t  
  (Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
    
  vectMult :: (Num t) => Vector t -> t -> Vector t  
  (Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
    
  scalarMult :: (Num t) => Vector t -> Vector t -> t  
  (Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  
  ```
- vplus is for adding two vectors together. Two vectors are added just by adding their corresponding components. scalarMult is for the scalar product of two vectors and vectMult is for multiplying a vector with a scalar.
- These functions can operate on types of Vector Int, Vector Integer, Vector Float, whatever, as long as the a from Vector a is from the Num typeclass.
- Also, if you examine the type declaration for these functions, you'll see that they can operate only on vectors of the same type and the numbers involved must also be of the type that is contained in the vectors. Notice that we didn't put a Num class constraint in the data declaration, because we'd have to repeat it in the functions anyway.
- Once again, it's very important to distinguish between the type constructor and the value constructor. When declaring a data type, the part before the = is the type constructor and the constructors after it (possibly separated by |'s) are value constructors.
- Giving a function a type of Vector t t t -> Vector t t t -> t would be wrong, because we have to put types in type declaration and the vector type constructor takes only one parameter, whereas the value constructor takes three. Let's play around with our vectors.
  ```haskell
  ghci> Vector 3 5 8 `vplus` Vector 9 2 8  
  Vector 12 7 16  
  ghci> Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3  
  Vector 12 9 19  
  ghci> Vector 3 9 7 `vectMult` 10  
  Vector 30 90 70  
  ghci> Vector 4 9 5 `scalarMult` Vector 9.0 2.0 4.0  
  74.0  
  ghci> Vector 2 9 3 `vectMult` (Vector 4 9 5 `scalarMult` Vector 9 2 4)  
  Vector 148 666 222  
  ```

### Derived instances
- We explained that a typeclass is a sort of an interface that defines some behavior.
- A type can be made an instance of a typeclass if it supports that behavior. Example: the Int type is an instance of the Eq typeclass because the Eq typeclass defines behavior for stuff that can be equated. And because integers can be equated, Int is a part of the Eq typeclass.
- Typeclasses are more like interfaces. We don't make data from typeclasses. Instead, we first make our data type and then we think about what it can act like. If it can act like something that can be equated, we make it an instance of the Eq typeclass. If it can act like something that can be ordered, we make it an instance of the Ord typeclass.
- Consider this data type:
  ```haskell
  data Person = Person { firstName :: String  
                      , lastName :: String  
                      , age :: Int  
                      }  
  ```
  ```haskell
  data Person = Person { firstName :: String  
                      , lastName :: String  
                      , age :: Int  
                      } deriving (Eq)  
  ```
- When we derive the Eq instance for a type and then try to compare two values of that type with == or /=, Haskell will see if the value constructors match (there's only one value constructor here though) and then it will check if all the data contained inside matches by testing each pair of fields with ==.
- There's only one catch though, the types of all the fields also have to be part of the Eq typeclass.
- Example:
  ```haskell
  ghci> let mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}  
  ghci> let adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}  
  ghci> let mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}  
  ghci> mca == adRock  
  False  
  ghci> mikeD == adRock  
  False  
  ghci> mikeD == mikeD  
  True  
  ghci> mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}  
  True 
  ```
- Since person is deriving Eq, we can use `elem`
  ```haskell
  ghci> let beastieBoys = [mca, adRock, mikeD]  
  ghci> mikeD `elem` beastieBoys  
  True  
  ```
- Make person can be converted to and from string:
  ```haskell
  data Person = Person { firstName :: String  
                      , lastName :: String  
                      , age :: Int  
                      } deriving (Eq, Show, Read) 
  ```
  ```haskell
  ghci> let mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}  
  ghci> mikeD  
  Person {firstName = "Michael", lastName = "Diamond", age = 43}  
  ghci> "mikeD is: " ++ show mikeD  
  "mikeD is: Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"
  ```
- Read is pretty much the inverse typeclass of Show. Show is for converting values of our a type to a string, Read is for converting strings to values of our type.
- Remember though, when we use the read function, we have to use an explicit type annotation to tell Haskell which type we want to get as a result. If we don't make the type we want as a result explicit, Haskell doesn't know which type we want.
  ```haskell
  ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person  
  Person {firstName = "Michael", lastName = "Diamond", age = 43}  
  ```
- If we use the result of our read later on in a way that Haskell can infer that it should read it as a person, we don't have to use type annotation.
  ```haskell
  ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" == mikeD  
  True  
  ```
- We can derive instances for the Ord type class, which is for types that have values that can be ordered. If we compare two values of the same type that were made using different constructors, the value which was made with a constructor that's defined first is considered smaller.
- For instance, consider the Bool type, which can have a value of either False or True. For the purpose of seeing how it behaves when compared, we can think of it as being implemented like this:
  ```haskell
  data Bool = False | True deriving (Ord)  
  ```
- Because the False value constructor is specified first and the True value constructor is specified after it, we can consider True as greater than False.
  ```haskell
  ghci> True `compare` False  
  GT  
  ghci> True > False  
  True  
  ghci> True < False  
  False 
  ```
- Since Nothing defined first compared to Just, then Nothing is less than Just
  ```haskell
  ghci> Nothing < Just 100  
  True  
  ghci> Nothing > Just (-49999)  
  False  
  ghci> Just 3 `compare` Just 2  
  GT  
  ghci> Just 100 > Just 50  
  True 
  ```
- We can easily use algebraic data types to make enumerations and the Enum and Bounded typeclasses help us with that. Consider the following data type:
- data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday 
- Because all the value constructors are nullary (take no parameters, i.e. fields), we can make it part of the Enum typeclass. The Enum typeclass is for things that have predecessors and successors.
- We can also make it part of the Bounded typeclass, which is for things that have a lowest possible value and highest possible value. And while we're at it, let's also make it an instance of all the other derivable typeclasses and see what we can do with it.
  ```haskell
  data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
            deriving (Eq, Ord, Show, Read, Bounded, Enum) 
  ```
- Day is part of the Show and Read
  ```haskell
  ghci> Wednesday  
  Wednesday  
  ghci> show Wednesday  
  "Wednesday"  
  ghci> read "Saturday" :: Day  
  Saturday 
  ```
- Day is part of Eq and Ord
  ```haskell
  ghci> Saturday == Sunday  
  False  
  ghci> Saturday == Saturday  
  True  
  ghci> Saturday > Friday  
  True  
  ghci> Monday `compare` Wednesday  
  LT  
  ```
- It's also part of Bounded, so we can get the lowest and highest day.
  ```haskell
  ghci> minBound :: Day  
  Monday  
  ghci> maxBound :: Day  
  Sunday 
  ```
- It's also an instance of Enum. We can get predecessors and successors of days and we can make list ranges from them!
  ```haskell
  ghci> succ Monday  
  Tuesday  
  ghci> pred Saturday  
  Friday  
  ghci> [Thursday .. Sunday]  
  [Thursday,Friday,Saturday,Sunday]  
  ghci> [minBound .. maxBound] :: [Day]  
  [Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]  
  ```

### Type synonyms
- Previously, we mentioned that when writing types, the `[Char]` and String types are equivalent and interchangeable.
- That's implemented with type synonyms. Type synonyms don't really do anything per se, they're just about giving some types different names so that they make more sense to someone reading our code and documentation.
- Here's how the standard library defines String as a synonym for `[Char]`.
  ```haskell
  type String = [Char]  
  ```
- If we make a function that converts a string to uppercase and call it toUpperString or something, we can give it a type declaration of `toUpperString :: [Char] -> [Char]` or `toUpperString :: String -> String`. Both of these are essentially the same, only the latter is nicer to read.
- Example:
  ```haskell
  phoneBook :: [(String,String)]  
  phoneBook =      
      [("betty","555-2938")     
      ,("bonnie","452-2928")     
      ,("patsy","493-2928")     
      ,("lucille","205-2928")     
      ,("wendy","939-8282")     
      ,("penny","853-2492")     
      ]  
  ```
- Type synonym of the above example:
  ```haskell
  type PhoneBook = [(String,String)]  
  ```
- Let's make a type synonym for String as well.
  ```haskell
  type PhoneNumber = String  
  type Name = String  
  type PhoneBook = [(Name,PhoneNumber)]  
  ```
- Giving the String type synonyms is something that Haskell programmers do when they want to convey more information about what strings in their functions should be used as and what they represent.
- Snippet:
  ```haskell
  inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool  
  inPhoneBook name pnumber pbook = (name,pnumber) `elem` pbook  
  ```
- We introduce type synonyms either to describe what some existing type represents in our functions (and thus our type declarations become better documentation) or when something has a long-ish type that's repeated a lot (like `[(String,String)]`) but represents something more specific
- Type synonyms can also be parameterized. If we want a type that represents an association list type but still want it to be general so it can use any type as the keys and values, we can do this:
  ```haskell
  type AssocList k v = [(k,v)] 
  ```
- Now, a function that gets the value by a key in an association list can have a type of `(Eq k) => k -> AssocList k v -> Maybe v`. AssocList is a type constructor that takes two types and produces a concrete type, like AssocList Int String, for instance.
- You should know the difference between concrete type and type constructor. `Maybe` is not a concrete type because it is a type constructor.
- Just like we can partially apply functions to get new functions, we can partially apply type parameters and get new type constructors from them.
- Just like we call a function with too few parameters to get back a new function, we can specify a type constructor with too few type parameters and get back a partially applied type constructor.
  ```haskell
  type IntMap v = Map Int v  

  type IntMap = Map Int  
  ```
- Type synonyms (and types generally) can only be used in the type portion of Haskell. We're in Haskell's type portion whenever we're defining new types (so in data and type declarations) or when we're located after a ::. The :: is in type declarations or in type annotations.
- Another cool data type that takes two types as its parameters is the Either a b type. This is roughly how it's defined:
  ```haskell
  data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
  ```
- It has two value constructors. If the Left is used, then its contents are of type a and if Right is used, then its contents are of type b.
- So we can use this type to encapsulate a value of one type or another and then when we get a value of type Either a b, we usually pattern match on both Left and Right and we different stuff based on which one of them it was.
  ```haskell
  ghci> Right 20  
  Right 20  
  ghci> Left "w00t"  
  Left "w00t"  
  ghci> :t Right 'a'  
  Right 'a' :: Either a Char  
  ghci> :t Left True  
  Left True :: Either Bool b  
  ```
- So far, we've seen that Maybe a was mostly used to represent the results of computations that could have either failed or not. But somtimes, Maybe a isn't good enough because Nothing doesn't really convey much information other than that something has failed.
- A Data.Map lookup fails only if the key we were looking for wasn't in the map, so we know exactly what happened.
- However, when we're interested in how some function failed or why, we usually use the result type of Either a b, where a is some sort of type that can tell us something about the possible failure and b is the type of a successful computation. Hence, errors use the Left value constructor while results use Right.
- An example: a high-school has lockers so that students have some place to put their Guns'n'Roses posters. Each locker has a code combination. When a student wants a new locker, they tell the locker supervisor which locker number they want and he gives them the code. However, if someone is already using that locker, he can't tell them the code for the locker and they have to pick a different one. We'll use a map from Data.Map to represent the lockers. It'll map from locker numbers to a pair of whether the locker is in use or not and the locker code.
  ```haskell
  import qualified Data.Map as Map  
    
  data LockerState = Taken | Free deriving (Show, Eq)  
    
  type Code = String  
    
  type LockerMap = Map.Map Int (LockerState, Code)  
  ```
- Simple stuff. We introduce a new data type to represent whether a locker is taken or free and we make a type synonym for the locker code. We also make a type synonym for the type that maps from integers to pairs of locker state and code. And now, we're going to make a function that searches for the code in a locker map.
- We're going to use an Either String Code type to represent our result, because our lookup can fail in two ways — the locker can be taken, in which case we can't tell the code or the locker number might not exist at all. If the lookup fails, we're just going to use a String to tell what's happened.
  ```haskell
  lockerLookup :: Int -> LockerMap -> Either String Code  
  lockerLookup lockerNumber map =   
      case Map.lookup lockerNumber map of   
          Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"  
          Just (state, code) -> if state /= Taken   
                                  then Right code  
                                  else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"  
  ```
- We do a normal lookup in the map. If we get a Nothing, we return a value of type Left String, saying that the locker doesn't exist at all. If we do find it, then we do an additional check to see if the locker is taken.
- If it is, return a Left saying that it's already taken. If it isn't, then return a value of type Right Code, in which we give the student the correct code for the locker. It's actually a Right String, but we introduced that type synonym to introduce some additional documentation into the type declaration. Here's an example map:
  ```haskell
  lockers :: LockerMap  
  lockers = Map.fromList   
      [(100,(Taken,"ZD39I"))  
      ,(101,(Free,"JAH3I"))  
      ,(103,(Free,"IQSA9"))  
      ,(105,(Free,"QOTSA"))  
      ,(109,(Taken,"893JJ"))  
      ,(110,(Taken,"99292"))  
      ]  
  ```
  ```haskell
  ghci> lockerLookup 101 lockers  
  Right "JAH3I"  
  ghci> lockerLookup 100 lockers  
  Left "Locker 100 is already taken!"  
  ghci> lockerLookup 102 lockers  
  Left "Locker number 102 doesn't exist!"  
  ghci> lockerLookup 110 lockers  
  Left "Locker 110 is already taken!"  
  ghci> lockerLookup 105 lockers  
  Right "QOTSA"  
  ```

### Recursive data structures
- Think about this list: `[5]`. That's just syntactic sugar for `5:[]`. On the left side of the :, there's a value and on the right side, there's a list. And in this case, it's an empty list.
- Now how about the list `[4,5]`? Well, that desugars to `4:(5:[])`. Looking at the first :, we see that it also has an element on its left side and a list `(5:[])` on its right side.
- Same goes for a list like `3:(4:(5:6:[]))`, which could be written either like that or like `3:4:5:6:[]` (because : is right-associative) or `[3,4,5,6]`.
- We could say that a list can be an empty list or it can be an element joined together with a : with another list (that can be either the empty list or not).
  ```haskell
  data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)  
  ```
- This reads just like our definition of lists from one of the previous paragraphs. It's either an empty list or a combination of a head with some value and a list. If you're confused about this, you might find it easier to understand in record syntax.
  ```haskell
  data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)
  ```
- You might also be confused about the Cons constructor here. cons is another word for :. You see, in lists, : is actually a constructor that takes a value and another list and returns a list.
  ```haskell
  ghci> Empty  
  Empty  
  ghci> 5 `Cons` Empty  
  Cons 5 Empty  
  ghci> 4 `Cons` (5 `Cons` Empty)  
  Cons 4 (Cons 5 Empty)  
  ghci> 3 `Cons` (4 `Cons` (5 `Cons` Empty))  
  Cons 3 (Cons 4 (Cons 5 Empty))  
  ```
- We called our Cons constructor in an infix manner so you can see how it's just like :. Empty is like [] and 4 `Cons` (5 `Cons` Empty) is like 4:(5:[]).
- We can define functions to be automatically infix by making them comprised of only special characters. We can also do the same with constructors, since they're just functions that return a data type. So check this out.
  ```haskell
  infixr 5 :-:  
  data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)  
  ```
- First off, we notice a new syntactic construct, the fixity declarations. When we define functions as operators, we can use that to give them a fixity (but we don't have to). A fixity states how tightly the operator binds and whether it's left-associative or right-associative. For instance, *'s fixity is infixl 7 * and +'s fixity is infixl 6. That means that they're both left-associative (4 * 3 * 2 is (4 * 3) * 2) but * binds tighter than +, because it has a greater fixity, so 5 * 4 + 3 is (5 * 4) + 3.
- Otherwise, we just wrote a :-: (List a) instead of Cons a (List a). Now, we can write out lists in our list type like so:
  ```haskell
  ghci> 3 :-: 4 :-: 5 :-: Empty  
  (:-:) 3 ((:-:) 4 ((:-:) 5 Empty))  
  ghci> let a = 3 :-: 4 :-: 5 :-: Empty  
  ghci> 100 :-: a  
  (:-:) 100 ((:-:) 3 ((:-:) 4 ((:-:) 5 Empty)))  
  ```
- When deriving Show for our type, Haskell will still display it as if the constructor was a prefix function, hence the parentheses around the operator (remember, 4 + 3 is (+) 4 3).
- Let's make a function that adds two of our lists together. This is how ++ is defined for normal lists:
  ```haskell
  infixr 5  ++ 
  (++) :: [a] -> [a] -> [a]  
  []     ++ ys = ys  
  (x:xs) ++ ys = x : (xs ++ ys)  
  ```
- Our own implementation:
  ```haskell
  infixr 5  .++  
  (.++) :: List a -> List a -> List a   
  Empty .++ ys = ys  
  (x :-: xs) .++ ys = x :-: (xs .++ ys) 
  ```
- Will it work?
  ```haskell
  ghci> let a = 3 :-: 4 :-: 5 :-: Empty  
  ghci> let b = 6 :-: 7 :-: Empty  
  ghci> a .++ b  
  (:-:) 3 ((:-:) 4 ((:-:) 5 ((:-:) 6 ((:-:) 7 Empty)))) 
  ```
- Notice how we pattern matched on (x :-: xs). That works because pattern matching is actually about matching constructors.
- We can match on :-: because it is a constructor for our own list type and we can also match on : because it is a constructor for the built-in list type.
- Same goes for []. Because pattern matching works (only) on constructors, we can match for stuff like that, normal prefix constructors or stuff like 8 or 'a', which are basically constructors for the numeric and character types, respectively.
- Now, we're going to implement a binary search tree. If you're not familiar with binary search trees from languages like C, here's what they are: an element points to two elements, one on its left and one on its right. The element to the left is smaller, the element to the right is bigger. Each of those elements can also point to two elements (or one, or none). In effect, each element has up to two sub-trees. And a cool thing about binary search trees is that we know that all the elements at the left sub-tree of, say, 5 are going to be smaller than 5. Elements in its right sub-tree are going to be bigger. So if we need to find if 8 is in our tree, we'd start at 5 and then because 8 is greater than 5, we'd go right. We're now at 7 and because 8 is greater than 7, we go right again. And we've found our element in three hops! Now if this were a normal list (or a tree, but really unbalanced), it would take us seven hops instead of three to see if 8 is in there.
- Sets and maps from Data.Set and Data.Map are implemented using trees, only instead of normal binary search trees, they use balanced binary search trees, which are always balanced. But right now, we'll just be implementing normal binary search trees.
- Here's what we're going to say: a tree is either an empty tree or it's an element that contains some value and two trees. Sounds like a perfect fit for an algebraic data type!
  ```haskell
  data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)  
  ```
- Okay, good, this is good. Instead of manually building a tree, we're going to make a function that takes a tree and an element and inserts an element. We do this by comparing the value we want to insert to the root node and then if it's smaller, we go left, if it's larger, we go right. We do the same for every subsequent node until we reach an empty tree. Once we've reached an empty tree, we just insert a node with that value instead of the empty tree.
- In languages like C, we'd do this by modifying the pointers and values inside the tree. In Haskell, we can't really modify our tree, so we have to make a new sub-tree each time we decide to go left or right and in the end the insertion function returns a completely new tree, because Haskell doesn't really have a concept of pointer, just values.
- Hence, the type for our insertion function is going to be something like a -> Tree a - > Tree a. It takes an element and a tree and returns a new tree that has that element inside. This might seem like it's inefficient but laziness takes care of that problem.
- So, here are two functions. One is a utility function for making a singleton tree (a tree with just one node) and a function to insert an element into a tree.
  ```haskell
  singleton :: a -> Tree a  
  singleton x = Node x EmptyTree EmptyTree  
    
  treeInsert :: (Ord a) => a -> Tree a -> Tree a  
  treeInsert x EmptyTree = singleton x  
  treeInsert x (Node a left right)   
      | x == a = Node x left right  
      | x < a  = Node a (treeInsert x left) right  
      | x > a  = Node a left (treeInsert x right)  
  ```
- The singleton function is just a shortcut for making a node that has something and then two empty sub-trees.
-  In the insertion function, we first have the edge condition as a pattern. If we've reached an empty sub-tree, that means we're where we want and instead of the empty tree, we put a singleton tree with our element.
-  If we're not inserting into an empty tree, then we have to check some things. First off, if the element we're inserting is equal to the root element, just return a tree that's the same. If it's smaller, return a tree that has the same root value, the same right sub-tree but instead of its left sub-tree, put a tree that has our value inserted into it. Same (but the other way around) goes if our value is bigger than the root element.
- Next up, we're going to make a function that checks if some element is in the tree. First, let's define the edge condition. If we're looking for an element in an empty tree, then it's certainly not there. Okay. Notice how this is the same as the edge condition when searching for elements in lists. If we're looking for an element in an empty list, it's not there. 
- Anyway, if we're not looking for an element in an empty tree, then we check some things. If the element in the root node is what we're looking for, great! If it's not, what then? Well, we can take advantage of knowing that all the left elements are smaller than the root node. So if the element we're looking for is smaller than the root node, check to see if it's in the left sub-tree. If it's bigger, check to see if it's in the right sub-tree.
  ```haskell
  treeElem :: (Ord a) => a -> Tree a -> Bool  
  treeElem x EmptyTree = False  
  treeElem x (Node a left right)  
      | x == a = True  
      | x < a  = treeElem x left  
      | x > a  = treeElem x right  
  ```
- All we had to do was write up the previous paragraph in code. Let's have some fun with our trees! Instead of manually building one (although we could), we'll use a fold to build up a tree from a list. Remember, pretty much everything that traverses a list one by one and then returns some sort of value can be implemented with a fold! We're going to start with the empty tree and then approach a list from the right and just insert element after element into our accumulator tree.
  ```haskell
  ghci> let nums = [8,6,4,1,7,3,5]  
  ghci> let numsTree = foldr treeInsert EmptyTree nums  
  ghci> numsTree  
  Node 5 (Node 3 (Node 1 EmptyTree EmptyTree) (Node 4 EmptyTree EmptyTree)) (Node 7 (Node 6 EmptyTree EmptyTree) (Node 8 EmptyTree EmptyTree))  
  ```
- In that foldr, treeInsert was the folding function (it takes a tree and a list element and produces a new tree) and EmptyTree was the starting accumulator. nums, of course, was the list we were folding over.
- When we print our tree to the console, it's not very readable, but if we try, we can make out its structure. We see that the root node is 5 and then it has two sub-trees, one of which has the root node of 3 and the other a 7, etc.
  ```haskell
  ghci> 8 `treeElem` numsTree  
  True  
  ghci> 100 `treeElem` numsTree  
  False  
  ghci> 1 `treeElem` numsTree  
  True  
  ghci> 10 `treeElem` numsTree  
  False  
  ```



**[⬆ back to top](#list-of-contents)**

</br>

---


## References
- http://learnyouahaskell.com/introduction
- http://learnyouahaskell.com/starting-out
- http://learnyouahaskell.com/types-and-typeclasses
- http://learnyouahaskell.com/syntax-in-functions
- http://learnyouahaskell.com/recursion
- http://learnyouahaskell.com/higher-order-functions
- http://learnyouahaskell.com/modules
- http://learnyouahaskell.com/making-our-own-types-and-typeclasses