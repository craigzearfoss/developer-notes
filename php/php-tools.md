# PHP Tools

---

## [Phan](https://github.com/phan/phan) - Static Analysis

Install with composer

```
composer require --deve phan/phan
```

Create .phan/config.php

```
return [
  'target_php_version' => '7.2',
  'directory_list' => ['/src'],
  'exclude_analysis_diretory_list' => ['vendor'],
];
```

## [phpspy](https://github.com/adsr/phpspy) - Low-overhead sampling profiler

- You can attach it to any PHP process.
- Can also spy on a variable.
- Needs a nicer frontend,
- Default sampling interval is 99 msec.
- You can get the memory usage from each frame.
- Can generate a **flame graph**.
- Sample of generating a flame graph on phan:

```
phpspy phan > /tmp/output
cat /tmp/output | stackcollapse-phpspy.pl | flamegraph.pl > flame.svg
```
