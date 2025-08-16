[Documents](../../Documents)

## About Color Specification Methods
Generally, color specification can be done with the color specification widget GUI ([Documents/GUIのチュートリアル(CueMol2)/Step7](../../Documents/GUIのチュートリアル(CueMol2)/Step7)),
but it is also possible to directly input text into the text box of the color specification widget as follows.

## HTML Notation
Same as the color notation method using # used in HTML and CSS.
### 6-Digit Notation
```
#UVWXYZ
```

When U-Z are digits 0-9 or alphabets A-F:
UV represents red intensity
WX represents green intensity
YZ represents blue intensity

#### Examples
```
#1234AB
```
Red=0x12 (=18/255), Green=0x34 (=52/255), Blue=0xAB (=171/255)

```
#FFFFFF
```
Red=0xFF (=255/255), Green=0xFF (=255/255), Blue=0xFF (=255/255) represents white color.

### 3-Digit Notation
```
#XYZ
```

X is a digit 0-9 or alphabet A-F. Equivalent to #XXYYZZ

#### Examples
```
#CCC
```
Red=0xCC (=204/255), Green=0xCC (=204/255), Blue=0xCC (=204/255) represents gray color.

## RGB Notation
```
rgb(X,Y,Z)
```

X,Y,Z are real values from 0 to 1.
X represents red intensity
Y represents green intensity
Z represents blue intensity

#### Examples
```
rgb(1.0, 0.5, 0.5)
```

becomes pink color.

### Notation with Transparency Alpha
```
rgba(X,Y,Z,W)
```

X,Y,Z,W are real values from 0 to 1.
W represents opacity. 0 becomes completely transparent.

## HSB Notation
```
hsb(X,Y,Z)
```

X is a real value from 0 to 360, representing hue (0 is red, 180 is cyan, etc.).
Y,Z are real values from 0 to 1, representing saturation and brightness.

### Notation with Transparency Alpha
```
hsba(X,Y,Z,W)
```

W represents opacity. 0 becomes completely transparent.

## Name Notation
```
<string consisting of _a-z0-1+->
```
Specify colors by color names defined in style files. Case insensitive.
In the system's default style file, color names of the same type as those usable in HTML/CSS are defined.
http://www.w3.org/TR/css3-color/#svg-color

#### Examples
```
antiquewhite
```
Results in the same color as "#faebd7".

## Molecular Color Notation
```
$molcol
```

Can only be used for color specifications related to molecular renderers.
References the color specification in the corresponding molecule.
For details, refer to [cuemol2/MolColor](../../cuemol2/MolColor).

## Modifiers
Specified in parentheses ({}) after the above color specifications.
When specifying multiple modifiers, separate them with semicolons.
```
<color specification>{<modifier1>;<modifier2>;...}
```

Modifiers consist of keys and values.
```
modifier := <key> : <value>
```

Keys include the following. The type of value that can be specified is determined by the key type.

material
:   Specifies material quality. Value is a string representing material quality.

alpha
:   Specifies transparency. Value is a real number from 0 to 1.

mod_h
:   Hue change. Value is any real number.

mod_s
:   Saturation change. Value is any real number.

mod_b
:   Brightness change. Value is any real number.

Currently cannot be specified from GUI.
Can be used with any notation such as rgb, hsb, #, or color name notation,
but except for material, it may not be very meaningful to use with notations other than color name notation or molecular color notation.

#### Examples
```
rgb(1,0,0){material: shadow; alpha: 0.5}
```
Specifies red color with material changed to shadow (flat coloring without shading) and transparency set to 0.5.
```
$molcol{mod_s: -0.2}
```
Specifies molecular color with saturation (1 for pure color, becomes more whitish as it decreases) reduced by 0.2.
That is, it will be colored in a slightly more whitish color than the coloring specified on the molecular side.
