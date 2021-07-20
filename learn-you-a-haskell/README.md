# Learn you a Haskell

</br>

## List of Contents:
### 1. [Introduction](#content-1)
### 2. [Starting Out](#content-2)

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



</br>

---

## References
- http://learnyouahaskell.com/introduction
- http://learnyouahaskell.com/starting-out