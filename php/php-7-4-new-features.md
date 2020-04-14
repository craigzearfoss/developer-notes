# PHP 7.4 New Features

- Upgrade full details [https://php.net/migration74](https://php.net/migration74)
- Extension authors: [https://github.com/php/php-src/blob/master/UPGRADING.INTERNALS](https://github.com/php/php-src/blob/master/UPGRADING.INTERNALS)

---

## Typed Properties

- There is less of a performance hit doing this than doing it for regular variables.

```
class User {
  public int $id;
  public string $name;

  public function__construct(int $id, string $name) {
    $this->id = $id;
    $this->name = $name;
  }
}
```

## Arrow Functions

```
$cb = function ($x) use ($y) {
        return $$x + $y;
      };

$cb = fun($x) => $x + $y;
```

## \_\_serialize / \_\_unserialize

- PHP has variouus problems with the wakeup and sleep magic methods.
- \_\_serialize and \_\_unserialize let you control exactly how your class serializes and unserializes.

```
class Test {
  public $prop;
  public function __serialize() {
    return ['prop' => $this->prop];
  }
  public function __deserialize(array $data) {
    $this->prop = $data['prop];
  }
}
```

## Null coalescing assignment operator

```
$this->config['value']   = $this->config['value'] ?? 'default_value';
$this->config['value'] ??= 'default_value';
```

## Weak references

- Allow the programmer to retain a reference to an object which does not prevent the object from being destroyed.
- They are useful for implementing cache like structures.

```
$std = new stdClass;
$wr - WeakReference::create($std);
```

## Opcache preloading

- Loads userspace code at server startup as if it was part of core PHP.
- Trades some flexibility for performance.
- Inspired by the "Class Data Sharing" feature in Java's Hotspot VM.

## FFI - Foreign Function Interface

- Allows you to include with ease some externals libraries into your PHP code.
- Allows you to use C, Go, Rust, etc. shared library directly in PHP without writing a PHP Extension in C.
- Loading the FFI is extremely slow so you will want to do it with opcache preloading on server started.
  - Allows FFIs to be loaded like PHP extensions.

```
// create FFI object, loading libc and exporting function printf()
$ffi = FFI::cdef(
    "int printf(const char *format, ...);",
    "libc.so.6");
// call C printf();
$ffi->printf("Hell %s!\n", "world");
```
