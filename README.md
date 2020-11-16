# react-native-paymob-accept

## Getting started

`$ npm install react-native-paymob-accept --save`

### Mostly automatic installation

`$ react-native link react-native-paymob-accept`

`$ cd ios && pod install`

### for older versions

Add the below line at the top of your PodFile, if using Pod

`use_modular_headers!`

Update your PodFile React dependency to look like this

`pod 'React', :path => '../node_modules/react-native', :modular_headers => true`

`pod 'glog', :podspec => '../node_modules/react-native/third-party-podspecs/glog.podspec', :modular_headers => false`

`pod 'Folly', :podspec => '../node_modules/react-native/third-party-podspecs/Folly.podspec', :modular_headers => false`

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

```xml
<manifest
...
xmlns:tools="http://schemas.android.com/tools">

<application
    ...
    android:allowBackup="false"
    android:supportsRtl="true"
    tools:replace="android:supportsRtl, android:allowBackup">

  <activity android:name="com.paymob.acceptsdk.ThreeDSecureWebViewActivty"
          android:theme="@style/PaymobAcceptTheme"/>
```

6. add action bar styles to styles.xml

```xml
<style name="PaymobAcceptTheme" parent="Theme.AppCompat.Light.DarkActionBar">
            <!-- Customize your theme here. -->
            <!-- <item name="android:windowNoTitle">true</item> -->
            <item name="android:editTextBackground">@android:color/transparent</item>
            <item name="colorPrimary">#030</item>
            <item name="colorPrimaryDark">#543</item>
            <item name="colorAccent">#909</item>
        </style>
```

7. (OPTIONAL) You can control the wording anf styles by adding the below resources to your styles.xml or values.xml resources
```xml
        <!-- Paymob SDK params-->
        <color name="colorAccent">#CC0bd796</color>
        <color name="colorDefaultButton">#CC0bd796</color>
        <color name="colorHint">#96b1bc</color>
        <color name="colorPrimary">@color/colorPrimaryDark</color>
        <color name="colorPrimaryDark" ns1:ignore="ResourceCycle">@color/colorPrimaryDark</color>
        <color name="colorText">#4F7283</color>
        <dimen name="large_padding_value">20dp</dimen>
        <dimen name="large_text_size">15sp</dimen>
        <dimen name="normal_padding_value">15dp</dimen>
        <dimen name="normal_text_size">14sp</dimen>
        <dimen name="small_padding_value">10dp</dimen>
        <dimen name="tiny_padding_value">5dp</dimen>
        <string name="Card_Number_check"> Card Number must be 16 digits! </string>
        <string name="Cvv_check">CVV must be 3 digits! </string>
        <string name="Date_check">Invalid Date!</string>
        <string name="Empty_name_check">Name can not be empty</string>
        <string name="Expiration"> Expiry Date</string>
        <string name="PoweredBy">Powered by </string>
        <string name="app_id">app_id</string>
        <string name="app_name">AcceptSDK</string>
        <string name="card_holder_name"> Card Holder Name </string>
        <string name="card_info">Card Information</string>
        <string name="card_number"> Card Number</string>
        <string name="cvv"> CVV </string> -->
        <string name="pay_button"> TEST </string>
        <!-- <string name="pref_file_name">shared_pref</string>
        <string name="processing">Processing payment...</string>
        <string name="save_card"> This Card will be saved for future use </string>
        <string name="wait">Please wait...</string> 
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

| Prop                  | Description                                   | Type    | Default      |
| --------------------- | --------------------------------------------- | ------- | ------------ |
| **`paymentKey`**      | Generated one-time payment key                | String  | **Required** |
| **`showSaveCard`**    | show save card checkbox                       | Boolean | **Required** |
| **`saveCardDefault`** | default boolean for saving card               | Boolean | **Required** |
| **`showAlerts`**      | show popup alerts                             | Boolean | **Required** |
| **`isEnglish`**       | Language English or Arabic                    | Boolean |
| **Required**          |
| **`hideActionBar`**   | hide action bar (Android Only)                | Boolean | **Optional** |
| **`isEnglish`**       | Language English or Arabic                    | Boolean | **Optional** |
| **`activityTitle`**   | title for the 3d secure Screen (Android Only) | String  | **Optional** |
| **`firstName`**       | TODO                                          | String  | **Optional** |
| **`lastName`**        | TODO                                          | String  | **Optional** |
| **`building`**        | TODO                                          | String  | **Optional** |
| **`floor`**           | TODO                                          | String  | **Optional** |
| **`apartment`**       | TODO                                          | String  | **Optional** |
| **`city`**            | TODO                                          | String  | **Optional** |
| **`state`**           | TODO                                          | String  | **Optional** |
| **`country`**         | TODO                                          | String  | **Optional** |
| **`email`**           | TODO                                          | String  | **Optional** |
| **`phoneNumber`**     | TODO                                          | String  | **Optional** |
| **`postalCode`**      | TODO                                          | String  | **Optional** |

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
