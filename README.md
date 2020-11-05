# react-native-paymob-accept

## Getting started

`$ npm install react-native-paymob-accept --save`

### Mostly automatic installation

`$ react-native link react-native-paymob-accept`

`$ cd ios && pod install`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-paymob-accept` and add `RNPaymobAccept.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPaymobAccept.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.breadfast.reactnative.RNPaymobAcceptPackage;` to the imports at the top of the file
- Add `new RNPaymobAcceptPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:
   ```
   include ':react-native-paymob-accept'
   project(':react-native-paymob-accept').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-paymob-accept/android')
   ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```
     compile project(':react-native-paymob-accept')
   ```
4. add repository as below
   ```
   allprojects {
   	repositories {
   		google()
   		...
   		maven { url "https://dl.bintray.com/paymobsolutions/paymob_accept_sdk" }
   	}
   }
   ```
5. Add to your AndroidManifest.xml

```
xmlns:tools="http://schemas.android.com/tools"
```

and

```
android:allowBackup="false"
android:supportsRtl="true"
tools:replace="android:supportsRtl, android:allowBackup"
```

to look like this

```
<manifest
...
xmlns:tools="http://schemas.android.com/tools">

<application
    ...
    android:allowBackup="false"
    android:supportsRtl="true"
    tools:replace="android:supportsRtl, android:allowBackup">
```

6. add action bar styles to styles.xml (replace AppTheme if exist)

```
<style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <!-- Customize your theme here. -->
        <item name="colorPrimary">@color/colorPrimary</item>
        <item name="colorPrimaryDark">@color/colorPrimaryDark</item>
        <item name="colorAccent">@color/colorAccent</item>
</style>
```

## Usage

Payment with Token

```javascript
import RNPaymobAccept from "react-native-paymob-accept";

RNPaymobAccept.payWithToken({
  token: "12345",
  maskedPanNumber: "XXXXXXXXXXXXXX1234",
  firstName: "first_name",
  lastName: "last_name",
  building: "building",
  floor: "floor",
  apartment: "apartment",
  city: "city",
  state: "state",
  country: "country",
  email: "email",
  phoneNumber: "phoneNumber",
  postalCode: "postalCode",
});
```

| Prop                  | Description                    | Type   | Default      |
| --------------------- | ------------------------------ | ------ | ------------ |
| **`paymentKey`**      | Generated one-time payment key | String | **Required** |
| **`token`**           | user token                     | String | **Required** |
| **`maskedPanNumber`** | last four digits               | String | **Required** |
| **`activityTitle`**   | title for the 3d secure Screen | String | **Optional** |
| **`firstName`**       | TODO                           | String | **Optional** |
| **`lastName`**        | TODO                           | String | **Optional** |
| **`building`**        | TODO                           | String | **Optional** |
| **`floor`**           | TODO                           | String | **Optional** |
| **`apartment`**       | TODO                           | String | **Optional** |
| **`city`**            | TODO                           | String | **Optional** |
| **`state`**           | TODO                           | String | **Optional** |
| **`country`**         | TODO                           | String | **Optional** |
| **`email`**           | TODO                           | String | **Optional** |
| **`phoneNumber`**     | TODO                           | String | **Optional** |
| **`postalCode`**      | TODO                           | String | **Optional** |

Payment with No Token

```javascript
import RNPaymobAccept from "react-native-paymob-accept";

RNPaymobAccept.payWithNoToken({
  showSaveCard: false,
  firstName: "first_name",
  lastName: "last_name",
  building: "building",
  floor: "floor",
  apartment: "apartment",
  city: "city",
  state: "state",
  country: "country",
  email: "email",
  phoneNumber: "phoneNumber",
  postalCode: "postalCode",
});
```

| Prop                  | Description                     | Type    | Default      |
| --------------------- | ------------------------------- | ------- | ------------ |
| **`paymentKey`**      | Generated one-time payment key  | String  | **Required** |
| **`showSavedCard`**   | show save card checkbox         | Boolean | **Required** |
| **`saveCardDefault`** | default boolean for saving card | Boolean | **Required** |
| **`activityTitle`**   | title for the 3d secure Screen  | String  | **Optional** |
| **`firstName`**       | TODO                            | String  | **Optional** |
| **`lastName`**        | TODO                            | String  | **Optional** |
| **`building`**        | TODO                            | String  | **Optional** |
| **`floor`**           | TODO                            | String  | **Optional** |
| **`apartment`**       | TODO                            | String  | **Optional** |
| **`city`**            | TODO                            | String  | **Optional** |
| **`state`**           | TODO                            | String  | **Optional** |
| **`country`**         | TODO                            | String  | **Optional** |
| **`email`**           | TODO                            | String  | **Optional** |
| **`phoneNumber`**     | TODO                            | String  | **Optional** |
| **`postalCode`**      | TODO                            | String  | **Optional** |

Callbacks functions

onSuccess function

| Prop          | Description                                                           | Type    | Default      |
| ------------- | --------------------------------------------------------------------- | ------- | ------------ |
| **`status`**  | boolean to determine whether transaction was done successfully or not | Boolean | **Optional** |
| **`code`**    | result code generated by SDK                                          | String  | **Optional** |
| **`message`** | error message mapped from result code                                 | String  | **Optional** |

```
(status: boolean, code: number, message)=>{
  ... add your success code block here
}
```
