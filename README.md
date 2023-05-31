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

## Age Recipients

When defining the recipient public keys age will use to encrypt a file, there are two options:

1. Pass the public key(s) as a comma separated list in the `--age` argument:

    ```sh
    sops -a $(paste -s -d, public-age-keys.txt) -e test.env
    ```

1. Pass the public key(s) as a comma separated list in the `SOPS_AGE_RECIPIENTS` environment variable:

    ```sh
    export SOPS_AGE_RECIPIENTS=$(paste -s -d, public-age-keys.txt)
    sops -e test.env
    ```

1. Use a `.sops.yaml` configuration file which defines the encryption rules.  This is the method used in this repo; see the provided example `.sops.yaml`.

## Example Commands

Encrypt `test.env` and save as `sops.test.env`:

```sh
sops -e test.env > sops.test.env
```

Decrypt `sops.test.env` and save as `test.env`:

```sh
sops -d sops.test.env > test.env
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
