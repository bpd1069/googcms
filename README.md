# Google Drive CMS
Fed-up with clients sending copy in Excel spreadsheets, hand-written on the back of an envelope, or by carrier-pigeon? Try this.

```
npm install googcms
```

## Minimum-viable CMS?
Let a Google spreadsheet take care of auth, versioning, storage, and pretty much everything else. All you need to worry about is having `googlecl` installed on your server (see note below), and adding a `.googcms.yml` file to your project with the following fields:

```
document : DocName # Exactly as appears on Google Drive
column_key : 0 # Column on spreadsheet for string identifiers (numbered from 0)
column_value : 1 # Column with actual string in
```

## Example spreadsheet
<iframe width='500' height='300' frameborder='0' src='https://docs.google.com/spreadsheet/pub?key=0AgBCP8hZC0GXdE5TQlM0d0N2YURPM3RSMWQ2djNRZnc&output=html&widget=true'></iframe>

## Installing googlecl
`googlecl` is a great little tool for accessing Google services from the command-line. However, the project seemed mothballed until recently. The packaged version dates from 2011 and is broken... but, the latest version from the svn trunk has fixed a bunch of bugs, including (most importantly for us) the ability to download spreadsheets from Google Drive (née Google Docs).


