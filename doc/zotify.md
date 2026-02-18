# Zotify installation

Custom Zotify installation instructions, as a workaround for the OAuth issue in
[zotify-dev/zotify#181](https://github.com/zotify-dev/zotify/issues/181).

>   [!NOTE]
>   These instructions are for Mac, with Rust/Cargo, jq, etc. already installed.  Adjust as needed
>   for other systems.

### Setup

**Install Zotify in a virtualenv:**

```bash
python -m venv .venv
. .venv/bin/activate
pip install "zotify @ git+ssh://git@github.com/zotify-dev/zotify.git"
```

**Perform Spotify OAuth with librespot fork:**:

```bash
git clone https://github.com/librespot-org/librespot
cd librespot
cargo run --no-default-features -F native-tls \
  -- \
  --cache . \
  --enable-oauth

jq \
  '{
    credentials: .auth_data,
    type: "AUTHENTICATION_STORED_SPOTIFY_CREDENTIALS",
    username: .username
  }' \
  credentials.json \
  > ~/Library/Application\ Support/Zotify/credentials.json
```

See [zotify-dev/zotify#181](https://github.com/zotify-dev/zotify/issues/181).
Note that the additional `-F native-tls` option is required though.
