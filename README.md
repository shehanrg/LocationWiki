# LocationWiki

LocationWiki is an iOS application that is built as a test application to call the Wikipedia iOS application via deeplinking, to show specific location that's being pushed.

## 1. Prerequisites

This application requires a modified version of Wikipedia iOS application to run.

Forked repository: https://github.com/shehanrg/wikipedia-ios

Ensure that you have the following software installed before setting up and running the project:

- Xcode (tested on v15.0)
- Swift (tested on v5.9)

## 2. Implementation

On Wikipedia codebase.
- A new UserActivityType has introduced as `WMFUserActivityTypeLocation` and related methods has implemented to parse a URL with 2 query parameters, `lat` and `long`. After parsing it will change to the `Places` tab and pan into the CLLocation resolved using the query parameters.
- None of the current features are affected and a test case is added to check the parsing of the URL.

## 3. Notes

This iOS application primarily serves as a demonstration of core functionality, with a minimal emphasis on UI design, interface elements or complex software architectures.


## 4. Demo
https://github.com/shehanrg/LocationWiki/assets/1823960/548e88fd-66af-4fda-bb6a-d8ee91144b42

