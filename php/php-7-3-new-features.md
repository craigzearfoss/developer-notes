# PHP 7.3 New Features
- Upgrade full details [https://php.net/migration73](https://php.net/migration73)
- Extension authors: [https://github.com/php/php-src/blob/master/UPGRADING.INTERNALS](https://github.com/php/php-src/blob/master/UPGRADING.INTERNALS)
---

## Flexible Heredoc
- The ending tab doesn't have to be on the left columns.
- The left indentation will be removed when outputted.
```
class foo {
	public $bar = <<<EOT
	bar
	EOT;
}
```

## Continue in Switch
```
while ($foo) {
	switch ($bar) {
		case "baz":
			continue;
	}
}
```
**Warning**: "continue" targeting switch is equivalent to "break". Did you mean to use "continue 2"?

## List references
- Both the long syntax and the short syntax support list references.
```
$array = [1, 2];
list($a, &$b) = $array;
// or
[$a, &$b] = $array;
```

## Trailing comma allowed in function calls
- In 7.2 trailing comma support was added to most things, but not function calls.
```
$newAray = array_merge(
	$arrayOne,
	$arrayTwo,
	['foo', 'bar'],
);

# Parse error
function bar($a, $b, ) { }

# Parse error
foo(,);

# Parse error
foo('fuction', 'bar', ,);

# Also parse error
foo(, 'function', bar');
```

## Monotimic Timer function
- You don't need to really on microtime (which relies on the system clock).
- Monotomic timer will always click forward one second per second regardless of the system clock.
```
php> function(hrtime());
Array
(
	[0] => 2320165	// seconds
	[1] =979969517	// nanoseconds
)
php> print_r(hrtime(true));
2230183981647424
```

## New fpm_get_status() function
- You can see what each request is doing
```
print_r(fpm_get_status());
Array(
	[pool] => www
	[process-manager] => static
	[start-time] => 1536934549
	[start-since] => 26
	[accepted-conn] => 20039
	[listen-queue] => 0
	[max-listen-queue] => 0
	[idle-processes] => 0
	[active-processes] => 47
	[total-processes] => 47
	[max-active-processes] => 514
	[slow-results] => 0
	[procs] => Array (
		[0] => Array (
			[pid] => 10819
			[state] => Running
			[start-time] => 1536934549
			[start-since] => 26
			[requests] => 2001
			[request-duration] => 8108
			[request-method] => GET
			[request-uri] => /index.php
			[query-string] => p=1
			[request-length] => 0
			[user] => -
			[script] => /var/www/wordpress/index.php
			[last-request-cpu] => 0
			[last-request-memory] =>
		)
	...
```

## is_countable()
```
if (is_array($foo) || $foo instanceof Countable) {
	// $foo is countable
}

if (is_countable($foo)) {
	// $foo is countable
}
```

## array_key_first() / array_key_last()
```
$a = ['abc' => 'First', 'def' => 'Second', 'ghi => 'Third];
echo array_key_first($a);
// abc
echo array_key_last($a)
// ghi
```

## More DCE and SCCP optimizations
- DCE - Dead Code Elimination
  - Escape Analyis
  - Sparse Conditional Constant Propagation
- SCCP - Signalling Connection Control Part

## Upgraded from PCRE to PCRE2
- Perl Compatible Regular Expressions
- PCRE differences (should be rare)
  - The most common problem you will hit when you upgrade will be invalid character classes.
    - This will break your code.
    - Most often you will just need to add a backslash before a dashes to treat them as literal dashes.
  

## getallheaders() now available in **php-fpm**

## Full case-mapping for **mbstring**

## preg_quote() now also escapes '#'

## New gmp functions
- **gmp_binomial** - calculates binomial coefficient
  - gmp_binomial ( mixed $n , int $k ) : GMP
- **gmp_lcm** - computes the least common multiple
  - gmp_lcm ( mixed $a , mixed $b ) : GMP
- **gmp_perfect_power** - perfect power check
  - gmp_perfect_power ( mixed $a ) : bool
- **gmp_kronecker** - computes the Kronecker symbol
  - gmp_kronecker ( mixed $a , mixed $b ) : int

## New **JsonException**

## Default ftp transfer mode is now binary

## ODBCRouter and Birdstep have been removed

## Various deprecations - see UPGRADING
