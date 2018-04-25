# shab templating language

One day, @roberth and @zimbatm were tired or manually replacing variables with
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

## Dependencies

* bash
* mktemp

## Related projects

* envsubst from the gettext package
* manually replacing variables with sed

