# shab templating language

[![Build Status](https://travis-ci.org/zimbatm/shab.svg?branch=master)](https://travis-ci.org/zimbatm/shab)

One day, @roberth and @zimbatm were tired of manually replacing variables with
sed. What if they could just drop variables in the file and have bash do the
substitution for them? Get the full power of the bash variable expansion,
brilliant!

Thus was born the shab templating language. Minimal size, maximum power
(assuming bash is already installed).

```
$ wc -l shab
24 shab
```

**SECURITY WARNING**: only use templates that you trust! The template really does
have all the power of a shell script.

## Example

Input:
```
$ cat example.sha
Hello,

this is a shab templating example.

Usage: ./shab example.shab

Your hostname: $(hostname)
Your user: ${USER:-unknown}
```

Output:
```
$ shab example.shab
Hello,

this is a shab templating example.

Usage: ./shab example.shab

Your hostname: x1
Your user: zimbatm
```

## Template format

Basically anything that bash can do.

* [Variable expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)
* Capture program outputs with `$(...)`

## Dependencies

* bash

## Related projects

* envsubst from the gettext package
* manually replacing variables with sed

## Credits

* The authors of the UNIX V7 shell
* Richard Stallman, GNU, and bash maintainers for their reimplementation
* Our source of inspiration, [Rube Goldberg](https://en.wikipedia.org/wiki/Rube_Goldberg)
