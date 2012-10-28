# Google Drive CMS
Fed-up with clients sending copy in Excel spreadsheets, hand-written on the back of an envelope, or by carrier-pigeon? Try this.

```
npm install googcms
```

## Minimum-viable CMS?
Let a Google spreadsheet ([example](https://docs.google.com/spreadsheet/pub?key=0AgBCP8hZC0GXdE5TQlM0d0N2YURPM3RSMWQ2djNRZnc&output=html)) take care of auth, versioning, storage, and pretty much everything else. All you need to worry about is having `googlecl` installed on your server (see note below), and adding a `.googcms.yml` file to your project with the following fields:

``` yaml
document : DocName # Exactly as appears on Google Drive
column_key : 0 # Column on spreadsheet for string identifiers (numbered from 0)
column_value : 1 # Column with actual string in
```

Once everything is installed, you can then run `googcms` in your project directory, and you'll get a `strings.json` file with your copy in key:value pairs, ready to be loaded into your app (see implementation details below). We have this included in our deployment script, so apps always get deployed with the latest copy.

## Installing googlecl
`googlecl` is a great little [tool](http://code.google.com/p/googlecl/) for accessing Google services from the command-line. However, the project seemed mothballed until recently. The packaged version dates from 2011 and is broken... but, the latest version from the svn trunk has fixed a bunch of bugs, including (most importantly for us) the ability to download spreadsheets from Google Drive (née Google Docs). If you have `svn` installed on your server, you can run the following to get the latest version of `googlecl` installed:

``` bash
curl -O https://raw.github.com/benhartley/googcms/master/googcms.sh; chmod +x googcms.sh; ./googcms.sh
```

The above script attempts to connect to Google after installation. If you haven't previously authorised `googlecl` to access your Google account, it will launch a browser window where you can do this.

## Implementation
