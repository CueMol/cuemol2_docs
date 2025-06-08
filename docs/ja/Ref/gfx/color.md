[Ref/gfx](../../../Ref/gfx)


## color (QScript object)

### Static Methods

#### color
; create RGB color
```
static object color(real, real, real)
```

#### color
; create RGBA color
```
static object color(real, real, real, real)
```

#### hsb
; static creation methods
; create HSB color
```
static object hsb (real, real, real)
```

#### gradient
; create gradient color (low_color, hi_color, ratio)
```
static object gradient(object, object, real)
```

### Methods

#### red
; get R/G/B/A component
```
real red()
```
#### green
```
real green()
```
#### blue
```
real blue()
```
#### alpha
```
real alpha()
```

#### red
; set R/G/B/A component
```
void red(real)
```
#### green
```
void green(real)
```
#### blue
```
void blue(real)
```
#### alpha
```
void alpha(real)
```

#### addhue
; incr/decr hue of color
```
object addhue(real);
```

#### addsat
; incr/decr saturation of color
```
object addsat(real);
```

#### addbri
; incr/decr brightness of color
```
object addbri(real);
```