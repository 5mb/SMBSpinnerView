# SBSpinnerView

Custom Activity Indicator

![Screenshot](https://raw.githubusercontent.com/smbhuin/SBSpinnerView/master/screenshot.png)

## INSTALLATION

#### Manual
* Open your XCode project and the SMBSpinnerView project.
* Drag the "SBSpinnerView" directory under "Library" directory to your project.

## HOW TO USE

 ```objc
 SMBSpinnerView *spv = [[SMBSpinnerView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
 [spv setColor:[UIColor orangeColor]];
 [self.view addSubview:spv];
 [spv startAnimation];
 ```
 ## LICENSE

MIT LICENSE

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
