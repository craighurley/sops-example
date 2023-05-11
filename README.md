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

## Example commands

Encrypt `test.env` and save as `sops.test.env`:

```sh
sops -e --output sops.test.env test.env
```

Decrypt `sops.test.env` and save as `test.env`:

```sh
sops -d --output test.env sops.test.env
```

Decrypt `sops.test.env` and extract a specific value, e.g. `password`:

```sh
sops -d --extract '["password"]' sops.test.env
```

## WARNING

Don't commit unencrypted secrets to git.  Think ahead and use `.gitignore`.
