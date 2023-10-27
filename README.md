# ImageCompare [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT) [![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg)](https://github.com/Solido/awesome-flutter) [![FlutterWeekly](https://img.shields.io/badge/Flutter%20Weekly-%2368-teal.svg)](https://mailchi.mp/flutterweekly/flutter-weekly-68)

<p align="center"> 
<img src="https://user-images.githubusercontent.com/25670178/61337576-978f1780-a853-11e9-9249-3637d0861ebb.gif" width="100%">
</p>



<p>A flutter package which makes it easier to display the differences between two images..</p>

The source code is **100% Dart**



# 💻 Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  image_compare: <latest version>
```


# ❔ Usage

### Import this class

```dart
import 'package:image_compare/image_compare.dart';
```

### before after

```dart
   ImageCompare(
     beforeImage: Image.asset('assets/after.jpg'),
     afterImage: Image.asset('assets/before.jpg'),
   ),
```

## 🎨 Customization and Attributes

All customizable attributes for ImageCompare Widget
<table>
    <th>Attribute Name</th>
    <th>Example Value</th>
    <th>Description</th>
    <tr>
        <td>beforeImage (Widget)</td>
        <td>Image.asset('assets/before.jpg')</td>
        <td>Sets the Before Image</td>
    </tr>
    <tr>
        <td>afterImage (Widget)</td>
        <td>Image.asset('assets/after.jpg')</td>
        <td>Sets the After Image</td>
    </tr>
    <tr>
            <td>isVertical (bool)</td>
            <td>false</td>
            <td>Sets the orientation of the slider</td>
        </tr>
    <tr>
        <td>imageHeight (double)</td>
        <td>100.0</td>
        <td>Sets height of both the images</td>
    </tr>
    <tr>
        <td>imageWidth (double)</td>
        <td>200.0</td>
        <td>Sets width of the images</td>
    </tr>
    <tr>
        <td>imageCornerRadius (double)</td>
        <td>16.0</td>
        <td>Sets the corner radius of the images</td>
    </tr>
    <tr>
        <td>thumbColor (Color)</td>
        <td>Colors.red</td>
        <td>Sets the color of the slider</td>
    </tr>
      <tr>
        <td>thumbRadius (double)</td>
        <td>16.0</td>
        <td>Sets the radius of the thumb circle</td>
    </tr>
      <tr>
        <td>overlayColor (Color)</td>
        <td>Colors.yellow</td>
        <td>Sets the color of the slider thumb overlay</td>
    </tr>
    
</table>
