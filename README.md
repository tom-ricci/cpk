# cpk
CPK is a little utility script that allows you to add public keys to a server and update your private key on the client.

## adding public keys
To add a public key, log into the server you wish to add the key to and run the following:

```bash
curl -s public.cpk.thomasricci.dev | bash -s $PUBLIC_KEY
```

Where `$PUBLIC_KEY` is your public key.

## updating private key
To update your private key, run the following on the client:

```bash
curl -s private.cpk.thomasricci.dev | bash -s $PRIVATE_KEY
```

Where `$PRIVATE_KEY` is your private key or the file containing your private key.

## development
CPK is made of two Bash scripts, `public.sh` and `private.sh`. It is deployed to Cloudflare Pages via a Github Actions workflow triggered on every push to `main`. So, to update a script, just push.

> [!Note]
> The scripts can be deployed manually via the Actions tab as well.

The workflow relies on a few secrets, namely:
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`
- `GITHUB_TOKEN` (automatically provided at runtime)
