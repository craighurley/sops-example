# sops-example

<https://github.com/mozilla/sops>

## Configuration

Generate an `age` key with:

```sh
age-keygen -o <path to key file>
```

If a key/key file is not specified when decrypting, `sops` will automatically look for `age` keys in the following locations:

- macOS: `$HOME/Library/Application Support/sops/age/keys.txt`
- linux: `$XDG_CONFIG_HOME/sops/age/keys.txt`
- Windows: `%AppData%\sops\age\keys.txt`

Alternatively, you can specify the location of the `age` key file manually by setting the environment variable `SOPS_AGE_KEY_FILE`.

## Example Commands

Encrypt `test.env` and save as `sops.test.env`:

```sh
sops -e test.env > sops.test.env
```

Decrypt `sops.test.env` and save as `test.env`:

```sh
sops -d sops.test.env
```

Decrypt `sops.test.env` and extract a specific value, e.g. `password`:

```sh
sops -d --extract '["password"]' sops.test.env
```

Decrypt `sops.test.env` to a temporary file and make it's contents available for the duration of a child process:

```sh
sops exec-file sops.test.env 'wc -l {}'
```

Decrypt `sops.test.env` into the environment of a child process:

```sh
sops exec-env sops.test.env 'echo $username/$password'
```

## Warning

Don't commit unencrypted secrets to git.  Think ahead and use `.gitignore`.
