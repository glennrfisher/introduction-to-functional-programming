{-------------------------------------------------------------------------------
 Rapid Introduction to Haskell: Variables
 ------------------------------------------------------------------------------}

x :: Integer
x = 3

pi :: Double
pi = 3.1415926

b1, b2 :: Bool
b1 = True
b2 = False

{-------------------------------------------------------------------------------
 Rapid Introduction to Haskell: Arithmetic
 ------------------------------------------------------------------------------}

ex01 = 3 + 2
ex02 = 19 - 27
ex03 = 2.35 * 8.6
ex04 = 8.7 / 3.1
ex05 = div 12 5
ex06 = 7 ^ 222

{-------------------------------------------------------------------------------
 Rapid Introduction to Haskell: Boolean Logic
 ------------------------------------------------------------------------------}

ex07 = True && False
ex08 = not (True || False)
ex09 = ('a' == 'a')
ex10 = (16 /= 3)
ex11 = "Haskell" > "C++"

{-------------------------------------------------------------------------------
 Rapid Introduction to Haskell: Functions
 ------------------------------------------------------------------------------}

doubleMe :: Integer -> Integer
doubleMe x = x + x

quadrupleMe :: Integer -> Integer
quadrupleMe x = doubleMe (doubleMe x)

hypotenuse :: Double -> Double -> Double
hypotenuse length width = sqrt squaredHypotenuse
  where squaredHypotenuse = length^2 + width^2

hypotenuse2 :: Double -> Double -> Double
hypotenuse2 length width =
  let squaredHypotenuse = length^2 + width^2 in
  sqrt squaredHypotenuse

{-------------------------------------------------------------------------------
 Rapid Introduction to Haskell: Types
 ------------------------------------------------------------------------------}

{- Position -}

{- Note: To avoid multiple declarations of Position,
         we declare and use the type Position1 below. -}

type Position1 = (Double, Double)

position :: Position1
position = (1.25, 2.75)

{- Note: To avoid multiple declarations of magnitude,
         we declare and function magnitude1 below. -}

magnitude1 :: Position1 -> Double
magnitude1 (x, y) = sqrt (x * x + y * y)

{- Person -}

{- A Name is a type synonym for a String. -}
type Name = String

{- An Age is a type synonym for an Integer. -}
type Age = Integer

{- A Color is either Red, Green, or Blue. -}
type Color = String

{- A Person has a name, age, and favorite color. -}
data Person = Person Name Age Color

glenn :: Person
glenn = Person "Glenn R. Fisher" 22 "Green"

favoriteColor :: Person -> Color
favoriteColor (Person name age color) = color

-- favoriteColor glenn == Green

{-------------------------------------------------------------------------------
 Example: Position
 ------------------------------------------------------------------------------}

{- a Distance is a length in space -}
type Distance = Double

{- a Position is a pair of x and y distances -}
type Position = (Distance, Distance)

{- reflect returns a new Position reflected over the origin -}
reflect :: Position -> Position
reflect (x, y) = (-x, -y)

{- magnitude returns a Position's distance from the origin -}
magnitude :: Position -> Distance
magnitude (x, y) = sqrt (x * x + y * y)

{- translate returns a new Position translated by an offset -}
translate :: Position -> Position -> Position
translate (x, y) (offsetX, offsetY) = (x + offsetX, y + offsetY)

{-------------------------------------------------------------------------------
 Example: Region
 ------------------------------------------------------------------------------}

{- A Region is a set of Positions and is defined by a function that
   determines whether a given Position is a member of the set -}
type Region = Position -> Bool

{- circle returns a circular Region with the given radius, centered at the origin -}
circle :: Distance -> Region
circle radius = fun
    where fun position = (magnitude position <= radius)

{- shift transforms a region by translating it by an offset -}
shift :: Region -> Position -> Region
shift region offset = fun
    where fun position = region (translate position (reflect offset))

{- invert transforms a region by inverting the set of Positions that it contains -}
invert :: Region -> Region
invert region = fun
    where fun position = False -- TODO

{- union constructs a new Region from the union of two Regions -}
-- union :: Region -> Region -> Region
-- TODO

{- intersection constructs a new Region from the intersection of two Regions -}
-- intersection :: Region -> Region -> Region
-- TODO

{- difference constructs a new Region containing all the Positions
   of the first region that are not members of the second Region -}
-- difference :: Region -> Region -> Region
-- TODO
