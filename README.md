# The Issue

Xcode 7.1 allows last run test case to disappear from Test Navigator every time.

![Xcode](https://raw.github.com/soutaro/XcodeTestNavigatorFix/master/issue.gif)

This happens when your test case is not defined as `testABC` method, but dynamically defined through your test framework (as Quick does).

This Pod is a workaround for this.

# How it works

1. Hook the test suite start via observer
2. Add one test case to last suite to be executed
3. Xcode still drops the last run test case, but keeps your tests :smile:

![Xcode](https://raw.github.com/soutaro/XcodeTestNavigatorFix/master/fixed.gif)

# How to use

Link this library to your test.

A typical Podfile would be like the following:

```rb
target :YourLibraryTest, exclusive: true do
  pod "XcodeTestNavigatorFix"
  pod ...
end
```

