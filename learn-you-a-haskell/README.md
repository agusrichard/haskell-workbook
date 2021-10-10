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