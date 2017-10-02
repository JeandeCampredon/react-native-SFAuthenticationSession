
# react-native-sf-authentication-session

## Getting started

`$ npm install react-native-sf-authentication-session --save`

### Mostly automatic installation

`$ react-native link react-native-sf-authentication-session`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-sf-authentication-session` and add `RNSFAuthenticationSession.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSFAuthenticationSession.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import RNSFAuthenticationSession from 'react-native-sf-authentication-session';

...
// The url you want to open with safari
const url = "http://my.webapp.com"
// The url your server will redirect you to
// hint - use a custom schema or universal link to immediatly get back to your app
const callbackUrl = "myapp://"
// The redirected url with query params containing private data
// ex - "myapp://token=mysecrettoken"
const finalUrl = await RNSFAuthenticationSession.getSafariData();
```
