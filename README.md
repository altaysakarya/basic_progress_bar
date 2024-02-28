# BasicProgressBar Flutter Package

A Flutter package for easily implementing progress bars with basic customization and animation support. The BasicProgressBar widget allows for a straightforward setup while offering flexibility through its configuration options. Whether you need a static progress bar with a fixed value or a dynamic one that updates based on calculated values, this package has you covered.

## Features

* `Customizable Height`: Adjust the height of the progress bar to fit your UI needs.
* `Color Customization`: Define the colors for both the progress indicator and the background for seamless integration with your app's theme.
* `Border Radius Customization`: Round the corners of your progress bar for a sleek look.
* `Animation Support`: Smoothly animate progress changes with customizable duration.
* `Fixed and Calculated Values`: Support for both fixed value progress bars and calculated value progress bars based on current and maximum values.

## Getting Started

### Installation

Add `basic_progress_bar` to your pubspec.yaml dependencies:

```yaml
dependencies:
  basic_progress_bar: latest_version
```

### Usage

Import the package where you want to use it:

```dart
import 'package:basic_progress_bar/basic_progress_bar.dart';
```

Creating a Basic Progress Bar

To use `BasicProgressBar` in your Flutter app, you can simply create a BasicProgressBar widget and pass the required configuration.

```dart
BasicProgressBar(
  config: ProgressBarConfig.fixedValue(value: 60), // For a fixed value progress bar
  height: 30.0,
  progressColor: Colors.blue,
  backgroundColor: Colors.grey.shade200,
  borderRadius: BorderRadius.circular(8.0),
)
```

Dynamic Progress Bar

For a progress bar that updates based on calculated values:

```dart
BasicProgressBar(
  config: ProgressBarConfig.calculatedValue(currentValue: 50, maxValue: 100),
  height: 30.0,
  progressColor: Colors.green,
  backgroundColor: Colors.grey.shade300,
  borderRadius: BorderRadius.circular(8.0),
)
```

### Animation

The progress bar automatically animates changes in value. Customize the animation duration by setting the `animationDuration` property.

## Example

An example of how to integrate `BasicProgressBar` within a StatefulWidget to dynamically update the progress.

```dart
class MyProgressPage extends StatefulWidget {
  @override
  _MyProgressPageState createState() => _MyProgressPageState();
}

class _MyProgressPageState extends State<MyProgressPage> {
  double progressValue = 0;

  void _increaseProgress() {
    setState(() {
      progressValue += 10;
      if (progressValue > 100) {
        progressValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BasicProgressBar(
          config: ProgressBarConfig.fixedValue(value: progressValue),
          height: 20.0,
          progressColor: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseProgress,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

This package is designed to be simple yet flexible, allowing developers to quickly implement progress bars in their Flutter applications with minimal setup.

### License

This project is licensed under the MIT License - see the LICENSE file for details.