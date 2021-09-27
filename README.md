# LRUCache
A simple LRU memory cache implemented in Swift 5.


# Examples

Checkout the testcase in LRUCacheTests.

```swift
    func tests() {
        let cache = LRUCache<String, Int>(2)
        cache.set("a", 1)
        cache.set("b", 2)
        assert(cache.get("a") == 1)
        cache.set("c", 3)
        assert(cache.get("b") == nil)
        cache.set("d", 4)
        assert(cache.get("a") == nil)
        assert(cache.get("c") == 3)
        assert(cache.get("d") == 4)
        cache.set("a", 1)
        assert(cache.get("c") == nil)
        assert(cache.get("a") == 1)
        
        cache["e"] = 3
        assert(cache["e"] == 3)
        
        cache["a"] = nil
        assert(cache["a"] == nil)    
    }

```


# License

MIT License

Copyright (c) 2011-Present `__承_影__`

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
