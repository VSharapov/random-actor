# random-actor
Cast your TTRPG campaign with random IMDB entries that have a photo

## User stories

- MVP:
    - I need a face for a name.
    - After running a script I am presented with:
        - `N` faces from IMDB and for each:
            - a count of how many images are in ther `Photos` section.
    - I select a face and create a mapping from `Fictional Name` to `imdb_ID`
        - the photos are stashed for me.
        - I can now look at my `cast` and see all such mappings.

## TODO
- See if IMDB has API - or some other way of avoiding non-actor nameID entries
- `generateSomeHTML(N)`
    - Scrapes until it gets `N` photoIDs
    - Figures out how many photos in `Photos` section
    - Table with links
        - Main photo -> main page
        - Photo count -> photo section
