/*:
## Exercise: Good Names
 
 You’ve inherited some code from another programmer who never had a chance to take the _App Development with Swift_ course. All you found was a note with the following written on it:
 
 > **Truck loading guide**
 >
 > Pallets of oranges weigh 100lbs
 >
 > Pallets of watermelons weigh 200lbs
 >
 > Have to load up the left then right of the truck and keep it as balanced as possible. How many on each side? Melons always go together.
 */
let oc = 14
let wc = 3
let ow = 100
let ww = 200
let to = oc * ow
let tw = wc * ww
let ttl = to + tw
let es = ttl / 2
let lhso = es / ow
let rhso = oc - lhso


//:  - Experiment: Rewrite the code so that it makes sense without needing a note. Use meaningful names and comments.
let orangeCount = 14
let watermelonCount = 3
let orangeWeight = 100
let watermelonWeight = 200
let truckOrangeWeight = orangeCount*orangeWeight
let truckWatermelonWeight = watermelonCount*watermelonWeight
let truckTotalLoad = truckOrangeWeight+truckWatermelonWeight
let eachSideWeight = truckTotalLoad/2
let leftHalfSideOrange = eachSideWeight / orangeWeight
let rightHalfSideOrange = orangeCount - leftHalfSideOrange
/*:
  _Copyright © 2020 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 14 of 14
 */
